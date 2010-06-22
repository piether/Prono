package prono

class Tournament {

    List<GroupRound> groupRounds;
    List<KnockoutRound> fourthRound, quarterFinals, semiFinals;


	static hasMany = [groupRounds: GroupRound, fourthRound: KnockoutRound, quarterFinals: KnockoutRound, semiFinals: KnockoutRound]

    static belongsTo = User

	String name

    User user

    KnockoutRound theFinal
    KnockoutRound consolidationFinal

    static constraints = {
        theFinal(nullable:true)
        consolidationFinal(nullable:true)
        user(nullable: false, unique:true)
    }

    TournamentRound tournamentRoundAt(int roundIndex, int gameIndex){
        switch(roundIndex){
            case 1:
                return theFinal
            case 2:
                return semiFinals.get(gameIndex-1)
            case 3:
                return quarterFinals.get(gameIndex-1)
            case 4:
                return fourthRound.get(gameIndex-1)
            case 5:
                return groupRounds.get(gameIndex-1)
        }
        return null
    }

    public List<Team> fourthRounders() {
        def result = new LinkedList()
        fourthRound.each{
           result.add(it.winner)
           result.add(it.second)
        }
        return result
    }
}
