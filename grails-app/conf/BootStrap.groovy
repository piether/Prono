

class BootStrap {

    def wkBuilderService
    def securityService

     def init = { servletContext ->

        wkBuilderService.createTeams() 
        securityService.createAdmin()
     }

     def destroy = {
     }
} 