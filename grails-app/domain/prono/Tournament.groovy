package prono

class Tournament {

    List<GroupRound> groupRounds;
    List<KnockoutRound> fourthRound, quarterFinals, semiFinals;


	static hasMany = [groupRounds: GroupRound, fourthRound: KnockoutRound, quarterFinals: KnockoutRound, semiFinals: KnockoutRound]

    static belongsTo = User

	String name

    KnockoutRound theFinal

    static constraints = {
        theFinal(nullable:true)
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
           result.addAll(it.possibleWinners())
        }
        assert(fourthRound.size()==8)
        return result
    }
}
