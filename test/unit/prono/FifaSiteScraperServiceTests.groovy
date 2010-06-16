package prono

import grails.test.*

class FifaSiteScraperServiceTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testScrapeTeams() {
        new FifaSiteScraperService().scrapeTeams()
    }

    void testScrapeGames() {
        new FifaSiteScraperService().scrapeGames()
    }


    void testPatternMatching() {
        def matches = "1:1 " =~ /(\d*):(\d*)/
        println matches[0][1] + " - " +  matches[0][2]
    }

}
