import java.util.*;

class BracketChecker {

    String input;
    
    BracketChecker(String expression) {
        this.input = expression;
    }

    boolean areBracketsMatchedAndNestedCorrectly() {
        var stack = new Stack<String>();
        
        for (var s : input.split("")) {
            switch (s) {
                case "(", "[", "{" -> stack.push(s);
                case ")", "]", "}" -> {if (stack.isEmpty() || !reverse(s).equals(stack.pop())) return false;}
            }
        }
        
        return stack.isEmpty();     
    }

    static String reverse(String bracket) {
        return switch (bracket) {
            case ")" -> "(";
            case "]" -> "[";
            case "}" -> "{";
            default -> throw new IllegalStateException("Unexpected value: " + bracket);
        };
    }
}