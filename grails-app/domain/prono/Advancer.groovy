package prono

class Advancer {

    TournamentRound round
    Integer position

    Team getTeam(){
        return round.teamInPosition(position)
    }

    static constraints = {
    }
}
