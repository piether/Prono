package prono

class WkBuilderService {

    static transactional = true

    Team zuidAfrika, mexico, uruguay, frankrijk, argentinie, nigeria, zuidKorea, griekenland, engeland, verenigdeStaten, algerije, slovenie;
    Team duitsland, australie, servie, ghana, nederland, denemarken, japan, kameroen, italie, paraguay, nieuwZeeland, slowakije, brazilie, noordKorea, ivoorkust, portugal, spanje, zwitserland, honduras, chili;

    def createTeams() {

        if (zuidAfrika == null) {

            // Poule A
            zuidAfrika = new Team(name: 'Zuid-Afrika')
            mexico = new Team(name: 'Mexico')
            uruguay = new Team(name: 'Uruguay')
            frankrijk = new Team(name: 'Frankrijk')

// Poule B
            argentinie = new Team(name: 'Argentinië')
            nigeria = new Team(name: 'Nigeria')
            zuidKorea = new Team(name: 'Zuid-Korea')
            griekenland = new Team(name: 'Griekenland')

// Poule C
            engeland = new Team(name: 'Engeland')
            verenigdeStaten = new Team(name: 'Verenigde Staten')
            algerije = new Team(name: 'Algerije')
            slovenie = new Team(name: 'Slovenië')

// Poule D
            duitsland = new Team(name: 'Duitsland')
            australie = new Team(name: 'Australie')
            servie = new Team(name: 'Servië')
            ghana = new Team(name: 'Ghana')

// Poule E
            nederland = new Team(name: 'Nederland')
            denemarken = new Team(name: 'Denemarken')
            japan = new Team(name: 'Japan')
            kameroen = new Team(name: 'Kameroen')

// Poule F
            italie = new Team(name: 'Italie')
            paraguay = new Team(name: 'Paraguay')
            nieuwZeeland = new Team(name: 'Nieuw Zeeland')
            slowakije = new Team(name: 'Slowakije')

// Poule G
            brazilie = new Team(name: 'Brazilië')
            noordKorea = new Team(name: 'Noord-Korea')
            ivoorkust = new Team(name: 'Ivoorkust')
            portugal = new Team(name: 'Portugal')

// Poule H
            spanje = new Team(name: 'Spanje')
            zwitserland = new Team(name: 'Zwitserland')
            honduras = new Team(name: 'Honduras')
            chili = new Team(name: 'Chili')

            zuidAfrika.save()
            mexico.save()
            uruguay.save()
            frankrijk.save()
            argentinie.save()
            nigeria.save()
            zuidKorea.save()
            griekenland.save()
            engeland.save()
            verenigdeStaten.save()
            algerije.save()
            slovenie.save()
            duitsland.save()
            australie.save()
            servie.save()
            ghana.save()
            nederland.save()
            denemarken.save()
            japan.save()
            kameroen.save()
            italie.save()
            paraguay.save()
            nieuwZeeland.save()
            slowakije.save()
            brazilie.save()
            noordKorea.save()
            ivoorkust.save()
            portugal.save()
            spanje.save()
            zwitserland.save()
            honduras.save()
            chili.save()
        }
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
            australie = Team.findByName('Australie')
            servie = Team.findByName('Servië')
            ghana = Team.findByName('Ghana')

// Poule E
            nederland = Team.findByName('Nederland')
            denemarken = Team.findByName('Denemarken')
            japan = Team.findByName('Japan')
            kameroen = Team.findByName('Kameroen')

// Poule F
            italie = Team.findByName('Italie')
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

    Tournament buildNewWkTournament() {

        fetchTeams();

        Tournament wk = new Tournament(name: 'WK')

        TournamentRound groupA = new GroupRound(teams: [zuidAfrika, mexico, uruguay, frankrijk])
        TournamentRound groupB = new GroupRound(teams: [argentinie, nigeria, zuidKorea, griekenland])

        TournamentRound groupC = new GroupRound(teams: [engeland, verenigdeStaten, algerije, slovenie])
        TournamentRound groupD = new GroupRound(teams: [duitsland, australie, servie, ghana])
        TournamentRound groupE = new GroupRound(teams: [nederland, denemarken, japan, kameroen])
        TournamentRound groupF = new GroupRound(teams: [italie, paraguay, nieuwZeeland, slowakije])
        TournamentRound groupG = new GroupRound(teams: [brazilie, noordKorea, ivoorkust, portugal])
        TournamentRound groupH = new GroupRound(teams: [spanje, zwitserland, honduras, chili])

        groupA.save()
        groupB.save()
        groupC.save()
        groupD.save()
        groupE.save()
        groupF.save()
        groupG.save()
        groupH.save()

        wk.groupRounds.addAll([groupA, groupB, groupC, groupD, groupE, groupF, groupG, groupH])

        KnockoutRound r4g1 = createFourthRound(groupA, groupB)
        KnockoutRound r4g2 = createFourthRound(groupC, groupD)
        KnockoutRound r4g3 = createFourthRound(groupE, groupF)
        KnockoutRound r4g4 = createFourthRound(groupG, groupH)
        KnockoutRound r4g5 = createFourthRound(groupD, groupC)
        KnockoutRound r4g6 = createFourthRound(groupB, groupA)
        KnockoutRound r4g7 = createFourthRound(groupH, groupG)
        KnockoutRound r4g8 = createFourthRound(groupF, groupE)

        wk.fourthRound.addAll([r4g1, r4g2, r4g3, r4g4, r4g5, r4g6, r4g7, r4g8])

        KnockoutRound r3g1 = createKnockoutRound(r4g1, r4g2)
        KnockoutRound r3g2 = createKnockoutRound(r4g3, r4g4)
        KnockoutRound r3g3 = createKnockoutRound(r4g5, r4g6)
        KnockoutRound r3g4 = createKnockoutRound(r4g7, r4g8)        

        wk.quarterFinals.addAll([r3g1, r3g2, r3g3, r3g4])

        KnockoutRound r2g1 = createKnockoutRound(r3g1, r3g2)
        KnockoutRound r2g2 = createKnockoutRound(r3g3, r3g4)

        wk.semiFinals.add(r2g1)
        wk.semiFinals.add(r2g2)

        KnockoutRound r1g1 = createKnockoutRound(r2g1, r2g1)

        wk.theFinal = r1g1

        wk.save()

        return wk
    }

    def createKnockoutRound(def left, def right) {
        def a1 = new Advancer(round: left)
        def a2 = new Advancer(round: right)
        a1.save()
        a2.save()
        def round = new KnockoutRound(left: a1, right: a2)
        round.save()
        return round
    }

    def createFourthRound(def left, def right) {
        def a1 = new Advancer(round: left)
        def a2 = new Advancer(round: right, place: 2)
        a1.save()
        a2.save()
        def round = new KnockoutRound(left: a1, right: a2)
        round.save()
        return round
    }

}
