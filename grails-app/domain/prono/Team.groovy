package prono

class Team implements Serializable {

    static hasMany = [players:Player]

	String name

    def image

    def link

    static constraints = {
    }

    String toString() {
        name
    }
}
