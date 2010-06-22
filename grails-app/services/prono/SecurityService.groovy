package prono

class SecurityService {

    def authenticateService

    static transactional = true

    def createAdmin() {
        if (User.findByUsername('admin' == null)) {
            Role adminRole = new Role(authority: 'ROLE_ADMIN', description: 'Administration role')
            adminRole.save()
            Role userRole = new Role(authority: 'ROLE_USER', description: 'End user role')
            userRole.save()
            User admin = new User(userRealName: 'Admin', username: 'admin', enabled: true, email: 'pieter.herroelen@gmail.com', points: 0)
            admin.addToAuthorities(adminRole)
            admin.addToAuthorities(userRole)
            admin.passwd = authenticateService.encodePassword('ikhaatadvocaat')
            admin.save(flush: true)
        }
    }
}
