package prono

class Player {

    static belongsTo = Team

    Integer nr
    String name
    Date dateOfBirth
    String pos
    String clubs
    Integer height

    static constraints = {
        nr(nullable: false)
        name(nullable: false)
        dateOfBirth(max: new Date(), nullable: false)
        pos(size: 2..3)
        clubs(nullable: true)
        height(min: 0, max: 300)
    }

    String toString() {
        name
    }
}
