package prono

class WkBuilderService {

    static transactional = true

    def fifaSiteScraperService

    Team zuidAfrika, mexico, uruguay, frankrijk, argentinie, nigeria, zuidKorea, griekenland, engeland, verenigdeStaten, algerije, slovenie;
    Team duitsland, australie, servie, ghana, nederland, denemarken, japan, kameroen, italie, paraguay, nieuwZeeland, slowakije, brazilie, noordKorea, ivoorkust, portugal, spanje, zwitserland, honduras, chili;

    def teamNames = [
            "Algerije": 'Algeria',
            "Engeland": 'England',
            "Noord-Korea": 'Korea DPR',
            "Servië": 'Serbia',
            "Argentinië": 'Argentina',
            "Frankrijk": 'France',
            "Zuid-Korea": 'Korea Republic',
            "Slowakije": 'Slovakia',
            "Australië": 'Australia',
            "Duitsland": 'Germany',
            "Mexico": 'Mexico',
            "Slovenië": 'Slovenia',
            "Brazilië": 'Brazil',
            "Ghana": 'Ghana',
            "Nederland": 'Netherlands',
            "Zuid-Afrika": 'South Africa',
            "Kameroen": 'Cameroon',
            "Griekenland": 'Greece',
            "Nieuw Zeeland": 'New Zealand',
            "Spanje": 'Spain',
            "Chili": 'Chile',
            "Honduras": 'Honduras',
            "Nigeria": 'Nigeria',
            "Zwitserland": 'Switzerland',
            "Ivoorkust": "Côte d'Ivoire",
            "Italië": 'Italy',
            "Paraguay": 'Paraguay',
            "Uruguay": 'Uruguay',
            "Denemarken": 'Denmark',
            "Japan": 'Japan',
            "Portugal": 'Portugal',
            "Verenigde Staten": 'USA'
    ]

    /**

     */
    def createTeams() {

        zuidAfrika = Team.findByName('Zuid-Afrika')

        if (zuidAfrika == null) {

            fifaSiteScraperService.scrapeTeams()

            // Poule A
            zuidAfrika = createTeam('Zuid-Afrika')
            mexico = createTeam('Mexico')
            uruguay = createTeam('Uruguay')
            frankrijk = createTeam('Frankrijk')

// Poule B
            argentinie = createTeam('Argentinië')
            nigeria = createTeam('Nigeria')
            zuidKorea = createTeam('Zuid-Korea')
            griekenland = createTeam('Griekenland')

// Poule C
            engeland = createTeam('Engeland')
            verenigdeStaten = createTeam('Verenigde Staten')
            algerije = createTeam('Algerije')
            slovenie = createTeam('Slovenië')

// Poule D
            duitsland = createTeam('Duitsland')
            australie = createTeam('Australië')
            servie = createTeam('Servië')
            ghana = createTeam('Ghana')

// Poule E
            nederland = createTeam('Nederland')
            denemarken = createTeam('Denemarken')
            japan = createTeam('Japan')
            kameroen = createTeam('Kameroen')

// Poule F
            italie = createTeam('Italië')
            paraguay = createTeam('Paraguay')
            nieuwZeeland = createTeam('Nieuw Zeeland')
            slowakije = createTeam('Slowakije')

// Poule G
            brazilie = createTeam('Brazilië')
            noordKorea = createTeam('Noord-Korea')
            ivoorkust = createTeam('Ivoorkust')
            portugal = createTeam('Portugal')

// Poule H
            spanje = createTeam('Spanje')
            zwitserland = createTeam('Zwitserland')
            honduras = createTeam('Honduras')
            chili = createTeam('Chili')
        }
    }

    def createTeam(def name){
        Team team = fifaSiteScraperService.getTeamWithName(teamNames[name])
        if(team == null)
            throw new RuntimeException("No team with name ${name} >${teamNames[name]}<")
        team.setName name
        team = team.save(flush:true)
        // println team.image
        return team
    }

    def fetchTeams = {
        zuidAfrika = Team.findByName('Zuid-Afrika')
        mexico = Team.findByName('Mexico')
        uruguay = Team.findByName('Uruguay')
        frankrijk = Team.findByName('Frankrijk')

// Poule B
        argentinie = Team.findByName('Argentinië')
        nigeria = Team.findByName('Nigeria')
        zuidKorea = Team.findByName('Zuid-Korea')
        griekenland = Team.findByName('Griekenland')

// Poule C
        engeland = Team.findByName('Engeland')
        verenigdeStaten = Team.findByName('Verenigde Staten')
        algerije = Team.findByName('Algerije')
        slovenie = Team.findByName('Slovenië')

// Poule D
        duitsland = Team.findByName('Duitsland')
        australie = Team.findByName('Australië')
        servie = Team.findByName('Servië')
        ghana = Team.findByName('Ghana')

// Poule E
        nederland = Team.findByName('Nederland')
        denemarken = Team.findByName('Denemarken')
        japan = Team.findByName('Japan')
        kameroen = Team.findByName('Kameroen')

// Poule F
        italie = Team.findByName('Italië')
        paraguay = Team.findByName('Paraguay')
        nieuwZeeland = Team.findByName('Nieuw Zeeland')
        slowakije = Team.findByName('Slowakije')

// Poule G
        brazilie = Team.findByName('Brazilië')
        noordKorea = Team.findByName('Noord-Korea')
        ivoorkust = Team.findByName('Ivoorkust')
        portugal = Team.findByName('Portugal')

// Poule H
        spanje = Team.findByName('Spanje')
        zwitserland = Team.findByName('Zwitserland')
        honduras = Team.findByName('Honduras')
        chili = Team.findByName('Chili')
    }

    Tournament buildNewWkTournament(List winners, List seconds) {

        fetchTeams();

        Tournament wk = new Tournament(name: 'WK')

        TournamentRound groupA = new GroupRound(teams: [zuidAfrika, mexico, uruguay, frankrijk], winner: winners[0], second: seconds[0])
        TournamentRound groupB = new GroupRound(teams: [argentinie, nigeria, zuidKorea, griekenland], winner: winners[1], second: seconds[1])
        TournamentRound groupC = new GroupRound(teams: [engeland, verenigdeStaten, algerije, slovenie], winner: winners[2], second: seconds[2])
        TournamentRound groupD = new GroupRound(teams: [duitsland, australie, servie, ghana], winner: winners[3], second: seconds[3])
        TournamentRound groupE = new GroupRound(teams: [nederland, denemarken, japan, kameroen], winner: winners[4], second: seconds[4])
        TournamentRound groupF = new GroupRound(teams: [italie, paraguay, nieuwZeeland, slowakije], winner: winners[5], second: seconds[5])
        TournamentRound groupG = new GroupRound(teams: [brazilie, noordKorea, ivoorkust, portugal], winner: winners[6], second: seconds[6])
        TournamentRound groupH = new GroupRound(teams: [spanje, zwitserland, honduras, chili], winner: winners[7], second: seconds[7])

        groupA.save()
        groupB.save()
        groupC.save()
        groupD.save()
        groupE.save()
        groupF.save()
        groupG.save()
        groupH.save()

        ([groupA, groupB, groupC, groupD, groupE, groupF, groupG, groupH]).each {
            wk.addToGroupRounds(it)
        }

        KnockoutRound r4g1 = createFourthRound(groupA, groupC)
        KnockoutRound r4g2 = createFourthRound(groupC, groupD)
        KnockoutRound r4g3 = createFourthRound(groupE, groupF)
        KnockoutRound r4g4 = createFourthRound(groupG, groupH)
        KnockoutRound r4g5 = createFourthRound(groupD, groupC)
        KnockoutRound r4g6 = createFourthRound(groupB, groupA)
        KnockoutRound r4g7 = createFourthRound(groupH, groupG)
        KnockoutRound r4g8 = createFourthRound(groupF, groupE)

        ([r4g1, r4g2, r4g3, r4g4, r4g5, r4g6, r4g7, r4g8]).each {
            wk.addToFourthRound(it)
        }
        
        KnockoutRound r3g1 = createKnockoutRound(r4g1, r4g2)
        KnockoutRound r3g2 = createKnockoutRound(r4g3, r4g4)
        KnockoutRound r3g3 = createKnockoutRound(r4g5, r4g6)
        KnockoutRound r3g4 = createKnockoutRound(r4g7, r4g8)

        ([r3g1, r3g2, r3g3, r3g4]).each {
            wk.addToQuarterFinals(it)
        }

        KnockoutRound r2g1 = createKnockoutRound(r3g1, r3g2)
        KnockoutRound r2g2 = createKnockoutRound(r3g3, r3g4)

        wk.addToSemiFinals(r2g1)
        wk.addToSemiFinals(r2g2)

        KnockoutRound r1g1 = createKnockoutRound(r2g1, r2g2)

        wk.theFinal = r1g1
        wk.consolidationFinal = createKnockoutRound(r2g1, r2g2)

        return wk
    }

    def saveKnockoutRounds(Tournament wk) {
        /*

        */
    }

    def createKnockoutRound(TournamentRound tr1, TournamentRound tr2) {
        new KnockoutRound()
    }

    def createFourthRound(def left, def right) {
        new KnockoutRound()
    }

}
