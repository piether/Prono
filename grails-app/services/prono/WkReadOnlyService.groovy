package prono

class WkReadOnlyService {

    static transactional = false

    Team zuidAfrika, mexico, uruguay, frankrijk, argentinie, nigeria, zuidKorea, griekenland, engeland, verenigdeStaten, algerije, slovenie;
    Team duitsland, australie, servie, ghana, nederland, denemarken, japan, kameroen, italie, paraguay, nieuwZeeland, slowakije, brazilie, noordKorea, ivoorkust, portugal, spanje, zwitserland, honduras, chili;


    def possibleWinnersForRound(Tournament t, Integer roundIndex, Integer gameIndex) {
        t.tournamentRoundAt(roundIndex, gameIndex).possibleWinners()
    }

    def getGroupRound(int i) {
        return getGroupRounds()[i]
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

    List getGroupRounds() {
        if (zuidAfrika == null)
            fetchTeams()

        return [[zuidAfrika, mexico, uruguay, frankrijk], [argentinie, nigeria, zuidKorea, griekenland], [engeland,
                verenigdeStaten, algerije, slovenie], [duitsland, australie, servie, ghana], [nederland, denemarken, japan, kameroen],
                [italie, paraguay, nieuwZeeland, slowakije], [brazilie, noordKorea, ivoorkust, portugal], [spanje, zwitserland, honduras, chili]]
    }
}
