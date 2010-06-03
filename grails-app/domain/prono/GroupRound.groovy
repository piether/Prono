package prono

class GroupRound extends TournamentRound {

    static hasMany = [teams: Team]

    static constraints = {
    }
}
