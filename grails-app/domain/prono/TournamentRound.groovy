package prono

class TournamentRound {

    static belongsTo = Tournament

	Team winner
	Team second

    static constraints = {

        winner(nullable:true)
        second(nullable:true)

    }

    Team teamInPlace(Integer position){
         if(position == 1)
            return winner
         if(position == 2)
            return second
         else
            return null
    }
    
}
