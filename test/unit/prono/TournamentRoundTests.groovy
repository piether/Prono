package prono

import grails.test.*

class TournamentRoundTests extends GrailsUnitTestCase {

    // Poule A
    static Team zuidAfrika = new Team(name: 'Zuid-Afrika')
    static Team mexico = new Team(name: 'Zuid-Afrika')
    static Team uruguay = new Team(name: 'Uruguay')
    static Team frankrijk = new Team(name: 'Frankrijk')

    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {
        TournamentRound pouleA = new GroupRound(teams: [zuidAfrika, mexico, uruguay, frankrijk])
        assertEquals 4,pouleA.teams.size()
    }
}
