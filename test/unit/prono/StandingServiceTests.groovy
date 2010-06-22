package prono

import grails.test.*

class StandingServiceTests extends GrailsUnitTestCase {

    StandingService standingService

    Tournament t1;
    Tournament t2;

    static Team zuidAfrika, mexico, uruguay, frankrijk, argentinie, nigeria, zuidKorea, griekenland, engeland, verenigdeStaten, algerije, slovenie;
    static Team duitsland, australie, servie, ghana;

    static {
        setUpTeams()
    }

    protected void setUp() {
        standingService = new StandingService()
        t1 = new Tournament();
        KnockoutRound round = new KnockoutRound(winner: zuidAfrika, second: mexico)
        t1.addToFourthRound(new KnockoutRound(winner: uruguay, second: frankrijk))
        t1.addToFourthRound(new KnockoutRound(winner: argentinie, second: nigeria))
        t1.addToFourthRound(new KnockoutRound(winner: zuidKorea, second: griekenland))
        t1.addToFourthRound(new KnockoutRound(winner: engeland, second: verenigdeStaten))
        t1.addToFourthRound(new KnockoutRound(winner: algerije, second: slovenie))
        t1.addToFourthRound(new KnockoutRound(winner: duitsland, second: australie))
        t1.addToFourthRound(new KnockoutRound(winner: servie, second: ghana))
        t2 = new Tournament();
    }

    private static void setUpTeams() {
        zuidAfrika = new Team();
        mexico = new Team();
        uruguay = new Team();
        frankrijk = new Team();
        argentinie = new Team();
        nigeria = new Team();
        zuidKorea = new Team();
        griekenland = new Team();
        engeland = new Team();
        verenigdeStaten = new Team();
        algerije = new Team();
        slovenie = new Team();
        duitsland = new Team();
        australie = new Team();
        servie = new Team();
        ghana = new Team();
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testCalculateFourthRoundPointsMaximum() {
        assertEquals(8*3, standingService.calculateFourthRoundPoints(t1,t1))
    }
}
