package prono

class TournamentTagLib {

    def team = { attrs ->
        def myTeam = attrs['team']
        out << "<img src='${myTeam.image}' alt='vlag ${myTeam.name}'/>&nbsp; ${myTeam.name}"
    }

}
