package prono

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class GroupRoundController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [groupRoundInstanceList: GroupRound.list(params), groupRoundInstanceTotal: GroupRound.count()]
    }

    def save = {
        def groupRoundInstance = new GroupRound(params)
        if (groupRoundInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'groupRound.label', default: 'GroupRound'), groupRoundInstance.id])}"
            redirect(action: "show", id: groupRoundInstance.id)
        }
        else {
            render(view: "create", model: [groupRoundInstance: groupRoundInstance])
        }
    }

    def show = {
        def groupRoundInstance = GroupRound.get(params.id)
        if (!groupRoundInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groupRound.label', default: 'GroupRound'), params.id])}"
            redirect(action: "list")
        }
        else {
            [groupRoundInstance: groupRoundInstance]
        }
    }

    def edit = {
        def groupRoundInstance = GroupRound.get(params.id)
        if (!groupRoundInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groupRound.label', default: 'GroupRound'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [groupRoundInstance: groupRoundInstance]
        }
    }

    def update = {
        def groupRoundInstance = GroupRound.get(params.id)
        if (groupRoundInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (groupRoundInstance.version > version) {
                    
                    groupRoundInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'groupRound.label', default: 'GroupRound')] as Object[], "Another user has updated this GroupRound while you were editing")
                    render(view: "edit", model: [groupRoundInstance: groupRoundInstance])
                    return
                }
            }
            groupRoundInstance.properties = params
            if (!groupRoundInstance.hasErrors() && groupRoundInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'groupRound.label', default: 'GroupRound'), groupRoundInstance.id])}"
                redirect(action: "show", id: groupRoundInstance.id)
            }
            else {
                render(view: "edit", model: [groupRoundInstance: groupRoundInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groupRound.label', default: 'GroupRound'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def groupRoundInstance = GroupRound.get(params.id)
        if (groupRoundInstance) {
            try {
                groupRoundInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'groupRound.label', default: 'GroupRound'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'groupRound.label', default: 'GroupRound'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'groupRound.label', default: 'GroupRound'), params.id])}"
            redirect(action: "list")
        }
    }
}
