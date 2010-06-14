package prono

class Team implements Serializable {

    static hasMany = [players:Player]

	String name

    String image

    String link

    static constraints = {
    }

    String toString() {
        name
    }
}
