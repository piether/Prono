package prono

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class KnockoutRoundController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [knockoutRoundInstanceList: KnockoutRound.list(params), knockoutRoundInstanceTotal: KnockoutRound.count()]
    }

    def create = {
        def knockoutRoundInstance = new KnockoutRound()
        knockoutRoundInstance.properties = params
        return [knockoutRoundInstance: knockoutRoundInstance]
    }

    def save = {
        def knockoutRoundInstance = new KnockoutRound(params)
        if (knockoutRoundInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'knockoutRound.label', default: 'KnockoutRound'), knockoutRoundInstance.id])}"
            redirect(action: "show", id: knockoutRoundInstance.id)
        }
        else {
            render(view: "create", model: [knockoutRoundInstance: knockoutRoundInstance])
        }
    }

    def show = {
        def knockoutRoundInstance = KnockoutRound.get(params.id)
        if (!knockoutRoundInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'knockoutRound.label', default: 'KnockoutRound'), params.id])}"
            redirect(action: "list")
        }
        else {
            [knockoutRoundInstance: knockoutRoundInstance]
        }
    }

    def edit = {
        def knockoutRoundInstance = KnockoutRound.get(params.id)
        if (!knockoutRoundInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'knockoutRound.label', default: 'KnockoutRound'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [knockoutRoundInstance: knockoutRoundInstance]
        }
    }

    def update = {
        def knockoutRoundInstance = KnockoutRound.get(params.id)
        if (knockoutRoundInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (knockoutRoundInstance.version > version) {
                    
                    knockoutRoundInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'knockoutRound.label', default: 'KnockoutRound')] as Object[], "Another user has updated this KnockoutRound while you were editing")
                    render(view: "edit", model: [knockoutRoundInstance: knockoutRoundInstance])
                    return
                }
            }
            knockoutRoundInstance.properties = params
            if (!knockoutRoundInstance.hasErrors() && knockoutRoundInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'knockoutRound.label', default: 'KnockoutRound'), knockoutRoundInstance.id])}"
                redirect(action: "show", id: knockoutRoundInstance.id)
            }
            else {
                render(view: "edit", model: [knockoutRoundInstance: knockoutRoundInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'knockoutRound.label', default: 'KnockoutRound'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def knockoutRoundInstance = KnockoutRound.get(params.id)
        if (knockoutRoundInstance) {
            try {
                knockoutRoundInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'knockoutRound.label', default: 'KnockoutRound'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'knockoutRound.label', default: 'KnockoutRound'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'knockoutRound.label', default: 'KnockoutRound'), params.id])}"
            redirect(action: "list")
        }
    }
}
