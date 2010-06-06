package prono

class Advancer implements Serializable {

    static belongsTo = TournamentRound
    TournamentRound round

    Integer place = 1
    

    Team retrieveTeam(){
        return round.teamInPlace(place)
    }

    static constraints = {
    }
}
