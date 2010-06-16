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
}
