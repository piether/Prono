package prono

class Tournament {

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
    }
}
