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
            } catch (NumberFormatException e) {
            }
            // println "${nr}.  ${name}  ${dateOfBirth}  ${position}  ${clubs}  ${height}"
        }
    }

    def getTeamWithName(def name) {
        return teamsMap[name]
    }

    def scrapeGames() {
        def tagsoupParser = new org.ccil.cowan.tagsoup.Parser()
        def slurper = new XmlSlurper(tagsoupParser)
        def htmlParser = slurper.parse('http://www.fifa.com/worldcup/matches/index.html')

        def teams = htmlParser.'**'.findAll { it.@class == 'fixture'}.each {
            it.tbody.tr.each {
                def dateTime = it.td[1].text()
                def venue = it.td[2].text()
                def homeTeamLink = it.td[4].a.@href.text()
                def homeScore, awayScore
                String score = it.td[5].text()
                def matches = score =~ /(\d*):(\d*)/
                if (matches.size() > 0) {
                    homeScore = matches[0][1]
                    awayScore = matches[0][2]
                }
                def awayTeamLink = it.td[6].a.@href.text()
                def homeTeam = Team.findByLink(homeTeamLink)
                println homeTeam
                Game game = new Game()
            }
        }

        /**
         def teams = htmlParser.'**'.find { it.@id == 'fwcHPMatchlist'}.li.each {print it.div[0].div[0].div[1].img[0].@alt
         print " - "
         print it.div[0].div[3].div[1].img[0].@alt
         if (it.div[2] != 'Preview') {print ": " + it.div[0].div[1]
         print " (" + it.div[1] + ")"} else {print ": @" + it.div[0].div[1]}println ""}*/

    }

}
