package prono

class TeamController {

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [teamInstanceList: Team.list(params), teamInstanceTotal: Team.count()]
    }

    def show = {
        def teamInstance = Team.get(params.id)
        if (!teamInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'team.label', default: 'Team'), params.id])}"
            redirect(action: "list")
        }
        else {
            [teamInstance: teamInstance]
        }
    }

}
