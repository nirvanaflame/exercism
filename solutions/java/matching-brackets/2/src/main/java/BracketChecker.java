import java.util.*;

class BracketChecker {
    static Map<String, String> pairs = Map.of(
        ")", "(",
        "]", "[",
        "}", "{"
    );
    
    String input;
    
    BracketChecker(String expression) {
        this.input = expression;
    }

    boolean areBracketsMatchedAndNestedCorrectly() {
        var stack = new Stack<String>();

        for (var s : input.split("")) {
            switch (s) {
                case "(", "[", "{" -> stack.push(s);
                case ")", "]", "}" -> {
                    if (stack.isEmpty() || !pairs.get(s).equals(stack.pop()))
                        return false;
                }
            }
        }

        return stack.isEmpty();   
    }
}