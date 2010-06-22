package prono

class StandingController {

    def standingService

    def index = {
        redirect action: show, params: params
    }

    def show = {
        if (!params.max) {
            params.max = 10
        }
        [personList: standingService.getUsersWithPointsSorted()]
    }
}
