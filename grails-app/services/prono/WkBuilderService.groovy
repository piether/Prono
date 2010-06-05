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

    Tournament buildNewWkTournament() {
        Tournament wk = new Tournament(name: 'WK')
        TournamentRound groupA = new GroupRound(teams: [zuidAfrika, mexico, uruguay, frankrijk])
        TournamentRound groupB = new GroupRound(teams: [argentinie, nigeria, zuidKorea, griekenland])
        TournamentRound groupC = new GroupRound(teams: [engeland, verenigdeStaten, algerije, slovenie])
        TournamentRound groupD = new GroupRound(teams: [duitsland, australie, servie, ghana])
        TournamentRound groupE = new GroupRound(teams: [nederland, denemarken, japan, kameroen])
        TournamentRound groupF = new GroupRound(teams: [italie, paraguay, nieuwZeeland, slowakije])
        TournamentRound groupG = new GroupRound(teams: [brazilie, noordKorea, ivoorkust, portugal])
        TournamentRound groupH = new GroupRound(teams: [spanje, zwitserland, honduras, chili])

        /**
        groupA.save()
        groupB.save()
        groupC.save()
        groupD.save()
        groupE.save()
        groupF.save()
        groupG.save()
        groupH.save()
        */

        wk.groupRounds.addAll([groupA, groupB, groupC, groupD, groupE, groupF, groupG, groupH])

        KnockoutRound r4g1 = new KnockoutRound(left: new Advancer(round: groupA, place: 1), right: new Advancer(round: groupB, place: 2))
        KnockoutRound r4g2 = new KnockoutRound(left: new Advancer(round: groupC, place: 1), right: new Advancer(round: groupD, place: 2))
        KnockoutRound r4g3 = new KnockoutRound(left: new Advancer(round: groupE, place: 1), right: new Advancer(round: groupF, place: 2))
        KnockoutRound r4g4 = new KnockoutRound(left: new Advancer(round: groupG, place: 1), right: new Advancer(round: groupH, place: 2))
        KnockoutRound r4g5 = new KnockoutRound(left: new Advancer(round: groupD, place: 1), right: new Advancer(round: groupC, place: 2))
        KnockoutRound r4g6 = new KnockoutRound(left: new Advancer(round: groupB, place: 1), right: new Advancer(round: groupA, place: 2))
        KnockoutRound r4g7 = new KnockoutRound(left: new Advancer(round: groupH, place: 1), right: new Advancer(round: groupG, place: 2))
        KnockoutRound r4g8 = new KnockoutRound(left: new Advancer(round: groupF, place: 1), right: new Advancer(round: groupE, place: 2))

        /*
        r4g1.save()
        r4g2.save()
        r4g3.save()
        r4g4.save()
        r4g5.save()
        r4g6.save()
        r4g7.save()
        r4g8.save()
        */

        wk.fourthRound.addAll([r4g1, r4g2, r4g3, r4g4, r4g5, r4g6, r4g7, r4g8])

        KnockoutRound r3g1 = new KnockoutRound(left: new Advancer(round: r4g1), right: new Advancer(round: r4g2))
        KnockoutRound r3g2 = new KnockoutRound(left: new Advancer(round: r4g3), right: new Advancer(round: r4g4))
        KnockoutRound r3g3 = new KnockoutRound(left: new Advancer(round: r4g5), right: new Advancer(round: r4g6))
        KnockoutRound r3g4 = new KnockoutRound(left: new Advancer(round: r4g7), right: new Advancer(round: r4g8))

        /*
        r3g1.save()
        r3g2.save()
        r3g3.save()
        r3g4.save()
        */

        wk.quarterFinals.addAll([r3g1, r3g2, r3g3, r3g4])

        KnockoutRound r2g1 = new KnockoutRound(left: new Advancer(round: r3g1), right: new Advancer(round: r3g2))
        KnockoutRound r2g2 = new KnockoutRound(left: new Advancer(round: r3g3), right: new Advancer(round: r3g4))

        /*
        r2g1.save()
        r2g2.save()
        */

        wk.semiFinals.add(r2g1)
        wk.semiFinals.add(r2g2)

        KnockoutRound r1g1 = new KnockoutRound(left: new Advancer(round: r2g1), right: new Advancer(round: r2g2))

        // r1g1.save()

        wk.theFinal = r1g1

        wk.save()

        return wk
    }

}
