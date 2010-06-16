package prono

class FifaSiteScraperService {

    Map teamsMap = new HashMap()

    static transactional = true

    final static DATE_FORMAT = "dd/MM/yyyy"

    def scrapeTeams() {

        def tagsoupParser = new org.ccil.cowan.tagsoup.Parser()
        def slurper = new XmlSlurper(tagsoupParser)
        def htmlParser = slurper.parse('http://www.fifa.com/worldcup/teams/index.html')

        def teams = htmlParser.'**'.find { it.@class == 'tTeamsClean'}.table

        teams.tr.each {

            it.td.each {
                Team team = new Team()
                team.setName(it.toString())
                team.setImage it.'**'.find { it.@class == 'flag'}.@src.toString()
                // println team.image
                team.setLink it.a[0].@href.toString()
                teamsMap[team.name] = team
                parseTeam(team)
            }
        }
    }

    def parseTeam(def team) {
        def teamSlurper = new XmlSlurper(new org.ccil.cowan.tagsoup.Parser())
        def teamParser = teamSlurper.parse('http://www.fifa.com' + team.link.toString().replaceFirst('index.html', 'squadlist.html'))
        def players = teamParser.'**'.find { it.@class == 'teamstat'}
        players.tr.each {
            def nr = it.td[0].toString()
            try {
                nr = Integer.parseInt(nr)
                def name = it.td[1].toString()
                def dateOfBirth = Date.parse(DATE_FORMAT, it.td[2].toString())
                def position = it.td[3].toString()
                def clubs = it.td[4].toString()
                def height = Integer.parseInt(it.td[5].toString())
                def player = new Player(nr: nr, name: name, dateOfBirth: dateOfBirth, pos: position, clubs: clubs, height: height)
                team.addToPlayers(player)
            }catch(NumberFormatException e){
            }
            // println "${nr}.  ${name}  ${dateOfBirth}  ${position}  ${clubs}  ${height}"
        }
    }

    def getTeamWithName(def name) {
        return teamsMap[name]
    }
}
