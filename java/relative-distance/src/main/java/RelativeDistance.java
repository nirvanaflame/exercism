import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class RelativeDistance {

    private Map<String, List<String>> tree;


    RelativeDistance(Map<String, List<String>> familyTree) {
        this.tree = familyTree;
    }

    int degreeOfSeparation(String personA, String personB) {
        var queue = new ArrayDeque<String>();
        var depth = new HashMap<String, Integer>();

        queue.offer(personA);
        depth.put(personA, 0);

        while (!queue.isEmpty()) {
            String current = queue.poll();
            int currentDepth = depth.get(current);

            if (current.equals(personB)) {
                return currentDepth;
            }

            for (String sibling : findSiblings(current)) {
                if (!depth.containsKey(sibling)) {
                    depth.put(sibling, currentDepth + 1);
                    queue.offer(sibling);
                }
            }


            for (String children : tree.getOrDefault(current, List.of())) {
                if (!depth.containsKey(children)) {
                    depth.put(children, currentDepth + 1);
                    queue.offer(children);
                }
            }

            for (String parent : findParents(current)) {
                if (!depth.containsKey(parent)) {
                    depth.put(parent, currentDepth + 1);
                    queue.offer(parent);
                }
            }
        }

        return -1;
    }

    List<String> findParents(String child) {
        return tree.entrySet().stream()
            .filter(entry -> entry.getValue().contains(child))
            .map(Map.Entry::getKey)
            .toList();
    }

    List<String> findSiblings(String value) {
        return tree.entrySet().stream()
            .filter(entry -> entry.getValue().contains(value))
            .findFirst()
            .map(Map.Entry::getValue)
            .orElse(List.of());
    }
}
