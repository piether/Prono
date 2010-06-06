

class BootStrap {

    def wkBuilderService

     def init = { servletContext ->

        wkBuilderService.createTeams() 

     }

     def destroy = {
     }
} 