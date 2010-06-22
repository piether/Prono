package prono

class StandingService {

    static transactional = true

    List getUsersWithPointsSorted() {
        def result = new ArrayList()
        User.list().each {
            it.setPoints(calculatePointsForUser(it))
            if (it.username != 'admin') {
                result.add(it)
            }
        }
        result.sort {it.points}
    }

    int calculatePointsForUser(User user) {

        User admin = User.findByUsername('admin')

        Tournament prediction = Tournament.findByUser(user)
        Tournament realDeal = Tournament.findByUser(admin)

        if (realDeal == null)
            return -1

        int total = 0

        total += calculateGroupRoundPoints(prediction, realDeal)
    }

    int calculateGroupRoundPoints(Tournament prediction, Tournament realDeal) {
        int total = 0
        def fourthRounders = realDeal.fourthRounders()
        for (int i = 0; i < prediction.groupRounds.size(); i++) {
            if (prediction.groupRounds[i].winner?.equals(realDeal.groupRounds[i].winner)) {
                total += 3
            } else {
                if (fourthRounders.contains(prediction.groupRounds[i].winner)) {
                    total += 2
                }
            }
            if (prediction.groupRounds[i].second?.equals(realDeal.groupRounds[i].second)) {
                total += 3
            } else {
                if (fourthRounders.contains(prediction.groupRounds[i].second)) {
                    total += 2
                }
            }
        }
        return total
    }
}
