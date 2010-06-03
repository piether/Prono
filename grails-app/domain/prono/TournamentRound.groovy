package prono

abstract class TournamentRound {

	Team winner
	Team second

    static constraints = {

    }

    Team teamInPosition(Integer position){
         if(position == 1)
            return winner
         if(position == 2)
            return second
         else
            return null
    }
}
