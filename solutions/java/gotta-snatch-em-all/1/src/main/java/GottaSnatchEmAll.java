import java.util.List;
import java.util.Set;
import java.util.HashSet;

class GottaSnatchEmAll {

    static Set<String> newCollection(List<String> cards) {
        return new HashSet<String>(cards);
    }

    static boolean addCard(String card, Set<String> collection) {
        return collection.add(card);
    }

    static boolean canTrade(Set<String> myCollection, Set<String> theirCollection) {
        var intersection = new HashSet<>(myCollection);
        intersection.retainAll(theirCollection);

        var myCopy = new HashSet<>(myCollection);
        myCopy.removeAll(intersection);

        var thierCopy = new HashSet<>(theirCollection);
        thierCopy.removeAll(intersection);
        
        return !(myCopy.isEmpty() || thierCopy.isEmpty());
    }

    static Set<String> commonCards(List<Set<String>> collections) {
        return collections.stream().reduce(new HashSet<>(collections.getFirst()), (acc, set) -> {
            acc.retainAll(set);
            return acc;
        });
    }

    static Set<String> allCards(List<Set<String>> collections) {
        return collections.stream().reduce(new HashSet<String>(), (acc, set) -> {
            acc.addAll(set);
            return acc;
        });
    }
}
