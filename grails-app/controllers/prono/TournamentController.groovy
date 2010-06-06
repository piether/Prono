package prono

class TournamentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def wkBuilderService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tournamentInstanceList: Tournament.list(params), tournamentInstanceTotal: Tournament.count()]
    }

    def create = {
        def wk = wkBuilderService.buildNewWkTournament()
        if (!wk.save()) {
            wk.errors.each {
                println it
            }
        }else {
            println 'succesfully saved'
        }
        render(view: "create_grouprounds", model: [tournamentInstance: wk])
    }

    def saveGroupRounds = {
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
            (1..8).each() {
                def groupRound = tournamentInstance.groupRounds[it - 1]

                 groupRound.winner = Team.findById(params["group.${it}.winner.id"])
                 groupRound.second = Team.findById(params["group.${it}.second.id"])

                println 'groupRound.id: ' + groupRound.id
                groupRound = groupRound.merge()
                println 'new groupRound.id: ' + groupRound.id
                if(!groupRound.save()){
                  groupRound.errors.each {
                    println it
                  }                 groupRound.teams
                }else {
                    println 'groupround saved'
                }
                tournamentInstance.merge()
            }
            if (!tournamentInstance.hasErrors() && tournamentInstance.save(flush: true)) {
                // flash.message = "${message(code: 'default.updated.message', args: [message(code: 'tournament.label', default: 'Tournament'), tournamentInstance.id])}"
                tournamentInstance = Tournament.findById(tournamentInstance.id)
                println tournamentInstance.fourthRound[0].possibleWinners()
                def round = KnockoutRound.findById(tournamentInstance.fourthRound[0].id)
                println tournamentInstance.fourthRound[0].left.round.winner
                println tournamentInstance.fourthRound[0].left.round.id
                render(view: "create", model: [tournamentInstance: tournamentInstance, fourthRounders: tournamentInstance.fourthRounders()])
            }
            else {
                flash.message = "error"
                render(view: "create_grouprounds")
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tournament.label', default: 'Tournament'), params.id])}"
            redirect(action: "list")
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
