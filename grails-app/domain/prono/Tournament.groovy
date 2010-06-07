package prono

class Tournament {

    ArrayList<GroupRound> groupRounds;
    ArrayList<KnockoutRound> fourthRound;

    Tournament(){
        groupRounds = new ArrayList()
        fourthRound = new ArrayList()
        quarterFinals = new ArrayList()
        semiFinals = new ArrayList()
    }

	static hasMany = [groupRounds: GroupRound, fourthRound: KnockoutRound, quarterFinals: KnockoutRound, semiFinals: KnockoutRound]

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
        println fourthRound.size()
        fourthRound.each{
            println it.possibleWinners()
           result.addAll(it.possibleWinners())
        }
        assert(fourthRound.size()==8)
        return result
    }
}
