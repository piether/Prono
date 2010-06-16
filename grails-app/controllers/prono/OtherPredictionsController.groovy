package prono

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

class OtherPredictionsController {

    def authenticateService

    static allowedMethods = [save: "POST"]

    def index = {
        redirect(action: "create", params: params)
    }

    @Secured(['ROLE_USER'])
    def create = {
        User user = User.findByUsername(authenticateService.principal().getUsername());
        def instance = OtherPredictions.findByUser(user);
        if (instance == null) {
            def otherPredictionsInstance = new OtherPredictions()
            otherPredictionsInstance.properties = params
            return [otherPredictionsInstance: otherPredictionsInstance]
        } else {
            flash.message = "Ge hebt er al een!"
            redirect(controller: "tournament", action: "list")
        }
    }

    @Secured(['ROLE_USER'])
    def save = {

        User user = User.findByUsername(authenticateService.principal().getUsername());
        def instance = OtherPredictions.findByUser(user);
        if (instance == null) {
            def otherPredictionsInstance = new OtherPredictions(params)
            otherPredictionsInstance.setUser(user)
            if (otherPredictionsInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.created.message', args: [message(code: 'otherPredictions.label', default: 'OtherPredictions'), otherPredictionsInstance.id])}"
                redirect(action: "show", id: otherPredictionsInstance.id)
            }
            else {
                render(view: "create", model: [otherPredictionsInstance: otherPredictionsInstance])
            }
        } else {
            flash.message = "Ge hebt er al een!"
            redirect(controller: "tournament", action: "list")
        }
    }

    def show = {
        def otherPredictionsInstance = OtherPredictions.get(params.id)
        if (!otherPredictionsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'otherPredictions.label', default: 'OtherPredictions'), params.id])}"
            redirect(action: "list")
        }
        else {
            [otherPredictionsInstance: otherPredictionsInstance]
        }
    }
}
