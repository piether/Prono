package prono

class TournamentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST", saveGroupRounds: "POST", saveKnockoutRounds: "POST"]

    def wkBuilderService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tournamentInstanceList: Tournament.list(params), tournamentInstanceTotal: Tournament.count()]
    }

    def create = {
        render(view: "create_grouprounds")
    }

    def saveGroupRounds = {
        List winners = new ArrayList()
        List seconds = new ArrayList()
        def errorTeams = new ArrayList()
        (1..8).each() {
            def winner = Team.findById(params["group.${it}.winner.id"])
            winners.add(winner)
            def second = Team.findById(params["group.${it}.second.id"])
            seconds.add(second)
            if (winner == second) {
                errorTeams.add(winner)
            }
        }
        if (!errorTeams.isEmpty()) {
            flash.message = ""
            errorTeams.each {
                flash.message += "Je kan ${it} niet eerst en tweeds maken, he slumme!<br/>"
                render(view: "create_grouprounds")
            }
            flash.message += "Al je voorspellingen zijn, als straf, gereset! MUHAHAHAHA"
        }
        else {
            Tournament wk = wkBuilderService.buildNewWkTournament(winners, seconds)
            if (wk != null && !wk.hasErrors()) {
                render(view: "create_knockoutrounds", model: [tournamentInstance: wk])
            }
            else {
                flash.message = "error"
                wk.errors.each {
                    flash.message += "\n" + it
                }
                render(view: "create_grouprounds")
            }
        }

    }

    def save = {
        def tournamentInstance = new Tournament(params)
        if (tournamentInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'tournament.label', default: 'Tournament'), tournamentInstance.id])}"
            redirect(action: "show", id: tournamentInstance.id)
        }
        else {
            render(view: "create", model: [tournamentInstance: tournamentInstance])
        }
    }

    def saveKnockoutRounds = {
        def tournamentInstance = Tournament.get(params["tournamentInstance.id"])

        if (!tournamentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tournament.label', default: 'Tournament'), params.id])}"
            redirect(action: "list")
        }
        else {
            def success = true
            (1..8).each() {
                def round = tournamentInstance.fourthRound.getAt(it - 1)
                success &= saveRound(4, it, round)
            }
            (1..4).each() {
                def round = tournamentInstance.quarterFinals.getAt(it - 1)
                success &= saveRound(3, it, round)
            }
            (1..2).each() {
                def round = tournamentInstance.semiFinals.getAt(it - 1)
                success &= saveRound(2, it, round)
            }
            success &= saveRound(1, 1, tournamentInstance.theFinal)
            success &= saveRound(1, 2, tournamentInstance.consolidationFinal)

            if (!success) {
                flash.message = "Had ge alles ingevuld?"
                render(view: "create_knockoutrounds", model: [tournamentInstance: tournamentInstance])
            } else {
                if(!tournamentInstance.save(flush:true)){
                    flash.message = "Er is toch nog iets misgelopen precies"
                }
                redirect(controller: "otherPredictions", action: "create")
            }
        }
    }


    private def saveRound(int roundNb, int gameNb, KnockoutRound round) {
        def result
        if (round == null) {
            return false
        }
        def winner
        def loser
        def roundAndGame = "r" + roundNb + "g" + gameNb
        if (params[roundAndGame + "t1"]?.size() > 0 && params[roundAndGame + "t1"] != 'on') {
            winner = Team.findById(params[roundAndGame + "t1"])
            loser = Team.findById(params["loser_" + roundAndGame])
        } else if (params[roundAndGame + "t2"]?.size() > 0 && params[roundAndGame + "t2"] != 'on') {
            winner = Team.findById(params[roundAndGame + "t2"])
            loser = Team.findById(params["loser_" + roundAndGame])
        }
        if (winner != null && loser != null) {
            round.setWinner(winner)
            round.setSecond(loser)
            result = true
        } else {
            result = false
        }
        return result
    }

    def show = {
        def tournamentInstance = Tournament.get(params.id)
        if (!tournamentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tournament.label', default: 'Tournament'), params.id])}"
            redirect(action: "list")
        }
        else {
            [tournamentInstance: tournamentInstance]
        }
    }

    def edit = {
        def tournamentInstance = Tournament.get(params.id)
        if (!tournamentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tournament.label', default: 'Tournament'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [tournamentInstance: tournamentInstance]
        }
    }

    def update = {
        def tournamentInstance = Tournament.get(params.id)
        if (tournamentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tournamentInstance.version > version) {

                    tournamentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'tournament.label', default: 'Tournament')] as Object[], "Another user has updated this Tournament while you were editing")
                    render(view: "edit", model: [tournamentInstance: tournamentInstance])
                    return
                }
            }
            tournamentInstance.properties = params
            if (!tournamentInstance.hasErrors() && tournamentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'tournament.label', default: 'Tournament'), tournamentInstance.id])}"
                redirect(action: "show", id: tournamentInstance.id)
            }
            else {
                render(view: "edit", model: [tournamentInstance: tournamentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tournament.label', default: 'Tournament'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def tournamentInstance = Tournament.get(params.id)
        if (tournamentInstance) {
            try {
                tournamentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'tournament.label', default: 'Tournament'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'tournament.label', default: 'Tournament'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tournament.label', default: 'Tournament'), params.id])}"
            redirect(action: "list")
        }
    }
}
