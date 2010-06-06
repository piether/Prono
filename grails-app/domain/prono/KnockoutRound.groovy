package prono

class KnockoutRound extends TournamentRound implements Serializable {

    Advancer left
    Advancer right

    static constraints = {
    }

    List possibleWinners() {
        return [left.retrieveTeam(),right.retrieveTeam()].asList()
    }
    
}
