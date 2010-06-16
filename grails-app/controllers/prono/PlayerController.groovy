package prono

import grails.converters.JSON

class PlayerController {

    static Date dec30first88

    static {
        def cal = new GregorianCalendar()
        cal.set(Calendar.YEAR, 1988)
        cal.set(Calendar.MONTH, Calendar.DECEMBER)
        cal.set(Calendar.DAY_OF_MONTH, 31)
        dec30first88 = new Date(cal.getTimeInMillis())
    }

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [playerInstanceList: Player.list(params), playerInstanceTotal: Player.count()]
    }

    def show = {
        def playerInstance = Player.get(params.id)
        if (!playerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'player.label', default: 'Player'), params.id])}"
            redirect(action: "list")
        }
        else {
            [playerInstance: playerInstance]
        }
    }

    def playersAsJson = {
        def players = Player.findAllByNameIlike("%" + params.q + "%")
        def jsonList = players.collect { [id: it.id, name: it.name] }
        render jsonList as JSON
    }

    def youngPlayersAsJson = {
        def players = Player.findAllByNameIlikeAndDateOfBirthGreaterThan("%" + params.q + "%", dec30first88)
        def jsonList = players.collect { [id: it.id, name: it.name] }
        render jsonList as JSON
    }

    def goalKeepersAsJson = {
        def players = Player.findAllByNameIlikeAndPosIlike("%" + params.q + "%", "gk")
        def jsonList = players.collect { [id: it.id, name: it.name] }
        render jsonList as JSON
    }
}
