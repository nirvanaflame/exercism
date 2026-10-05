import java.util.*;
import java.util.stream.Stream;

class RelativeDistance {

    private final Map<String, Set<String>> connections;

    RelativeDistance(Map<String, List<String>> familyTree) {
        this.connections = buildConnections(familyTree);
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

            for (String neighbor : connections.getOrDefault(current, Set.of())) {
                if (!depth.containsKey(neighbor)) {
                    depth.put(neighbor, currentDepth + 1);
                    queue.offer(neighbor);
                }
            }
        }



        return -1;
    }


    public Object[] rotate(Object[] data, int n) {
        int shift = data.length % n;

        Object[] result = new Object[data.length];
        if (n > 0) {
            int startIndex = data.length - 1 - shift;

        }


    }

    /**
     * Turns the parent-to-children input into an undirected graph where each
     * person maps to everyone reachable in one hop: parents, children, siblings.
     */
    private static Map<String, Set<String>> buildConnections(Map<String, List<String>> familyTree) {
        var connections = new HashMap<String, Set<String>>();
        for (var entry : familyTree.entrySet()) {
            String parent = entry.getKey();
            for (String child : entry.getValue()) {
                connect(connections, parent, child);
                for (String sibling : entry.getValue()) {
                    if (!sibling.equals(child)) {
                        connect(connections, child, sibling);
                    }
                }
            }
        }
        return connections;
    }

    private static void connect(Map<String, Set<String>> connections, String first, String second) {
        connections.computeIfAbsent(first, key -> new HashSet<>()).add(second);
        connections.computeIfAbsent(second, key -> new HashSet<>()).add(first);
    }
}
