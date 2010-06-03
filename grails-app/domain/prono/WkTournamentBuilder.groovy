package prono

class WkTournamentBuilder {

// Poule A
    static Team zuidAfrika = new Team(name: 'Zuid-Afrika')
    static Team mexico = new Team(name: 'Zuid-Afrika')
    static Team uruguay = new Team(name: 'Uruguay')
    static Team frankrijk = new Team(name: 'Frankrijk')

// Poule B
    static Team argentinie = new Team(name: 'Argentinië')
    static Team nigeria = new Team(name: 'Nigeria')
    static Team zuidKorea = new Team(name: 'Zuid-Korea')
    static Team griekenland = new Team(name: 'Griekenland')

// Poule C
    static Team engeland = new Team(name: 'Engeland')
    static Team verenigdeStaten = new Team(name: 'Verenigde Staten')
    static Team algerije = new Team(name: 'Algerije')
    static Team slovenie = new Team(name: 'Slovenië')

// Poule D
    static Team duitsland = new Team(name: 'Duitsland')
    static Team australie = new Team(name: 'Australie')
    static Team servie = new Team(name: 'Servië')
    static Team ghana = new Team(name: 'Ghana')

// Poule E
    static Team nederland = new Team(name: 'Nederland')
    static Team denemarken = new Team(name: 'Denemarken')
    static Team japan = new Team(name: 'Japan')
    static Team kameroen = new Team(name: 'Kameroen')

// Poule F
    static Team italie = new Team(name: 'Italie')
    static Team paraguay = new Team(name: 'Paraguay')
    static Team nieuwZeeland = new Team(name: 'Nieuw Zeeland')
    static Team slowakije = new Team(name: 'Slowakije')

// Poule G
    static Team brazilie = new Team(name: 'Brazilië')
    static Team noordKorea = new Team(name: 'Noord-Korea')
    static Team ivoorkust = new Team(name: 'Ivoorkust')
    static Team portugal = new Team(name: 'Portugal')

// Poule H
    static Team spanje = new Team(name: 'Spanje')
    static Team zwitserland = new Team(name: 'Zwitserland')
    static Team honduras = new Team(name: 'Honduras')
    static Team chili = new Team(name: 'Chili')

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
        
        wk.groupRounds.addAll([groupA,groupB,groupC,groupD,groupE,groupF,groupG,groupH])

        KnockoutRound r4g1 = new KnockoutRound(left: new Advancer(round: groupA, position: 1), right: new Advancer(round: groupB, position: 2))
        KnockoutRound r4g2 = new KnockoutRound(left: new Advancer(round: groupC, position: 1), right: new Advancer(round: groupD, position: 2))
        KnockoutRound r4g3 = new KnockoutRound(left: new Advancer(round: groupE, position: 1), right: new Advancer(round: groupF, position: 2))
        KnockoutRound r4g4 = new KnockoutRound(left: new Advancer(round: groupG, position: 1), right: new Advancer(round: groupH, position: 2))
        KnockoutRound r4g5 = new KnockoutRound(left: new Advancer(round: groupD, position: 1), right: new Advancer(round: groupC, position: 2))
        KnockoutRound r4g6 = new KnockoutRound(left: new Advancer(round: groupB, position: 1), right: new Advancer(round: groupA, position: 2))
        KnockoutRound r4g7 = new KnockoutRound(left: new Advancer(round: groupH, position: 1), right: new Advancer(round: groupG, position: 2))
        KnockoutRound r4g8 = new KnockoutRound(left: new Advancer(round: groupF, position: 1), right: new Advancer(round: groupE, position: 2))

        wk.fourthRound.addAll([r4g1,r4g2,r4g3,r4g4,r4g5,r4g6,r4g7,r4g8])

        KnockoutRound r3g1 = new KnockoutRound(left: new Advancer(round: r4g1), right: new Advancer(round: r4g2))
        KnockoutRound r3g2 = new KnockoutRound(left: new Advancer(round: r4g3), right: new Advancer(round: r4g4))
        KnockoutRound r3g3 = new KnockoutRound(left: new Advancer(round: r4g5), right: new Advancer(round: r4g6))
        KnockoutRound r3g4 = new KnockoutRound(left: new Advancer(round: r4g7), right: new Advancer(round: r4g8))

        wk.quarterFinals.addAll([r3g1,r3g2,r3g3,r3g4])

        KnockoutRound r2g1 = new KnockoutRound(left: new Advancer(round: r3g1), right: new Advancer(round: r3g2))
        KnockoutRound r2g2 = new KnockoutRound(left: new Advancer(round: r3g3), right: new Advancer(round: r3g4))

        wk.semiFinals.add(r2g1)
        wk.semiFinals.add(r2g2)

        KnockoutRound r1g1 = new KnockoutRound(left: new Advancer(round: r2g1), right: new Advancer(round: r2g2))

        wk.theFinal = r1g1

        return wk
    }
}
