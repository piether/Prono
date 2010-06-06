package prono

class Game {

    static belongsTo = TournamentRound

	Team homeTeam
	Team awayTeam
	Integer homeScore
	Integer awayScore

    static constraints = {
    }
}
