package prono

import grails.test.*

class WkTournamentBuilderTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testBuildNewWkTournament() {
        new WkTournamentBuilder().buildNewWkTournament();
    }
}
