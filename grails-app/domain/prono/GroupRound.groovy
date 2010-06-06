package prono

class GroupRound extends TournamentRound implements Serializable {

    static hasMany = [teams: Team]

    static constraints = {
    }

    def possibleWinners = {
        return teams
    }



}
