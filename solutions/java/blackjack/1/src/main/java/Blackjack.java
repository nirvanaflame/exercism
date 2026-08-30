public class Blackjack {

    public int parseCard(String card) {
        return switch(card) {
            case "two" -> 2;
            case "three" -> 3;
            case "four" -> 4;
            case "five" -> 5;
            case "six" -> 6;
            case "seven" -> 7;
            case "eight" -> 8;
            case "nine" -> 9;
            case "ten" -> 10;
            case "jack" -> 10;
            case "queen" -> 10;
            case "king" -> 10;
            case "ace" -> 11;
            default -> 0;
        };
    }

    public boolean isBlackjack(String card1, String card2) {
        return parseCard(card1) + parseCard(card2) == 21;
    }

    public String largeHand(boolean isBlackjack, int dealerScore) {
        return isBlackjack && !(dealerScore == 11 || dealerScore == 10) ? "W" : "S";        
    }

    public String smallHand(int handScore, int dealerScore) {
        if (handScore <= 11) return "H";
        if (17 <= handScore) return "S";
        return 7 <= dealerScore ? "H" : "S";
    }

    // FirstTurn returns the semi-optimal decision for the first turn, given the cards of the player and the dealer.
    // This function is already implemented and does not need to be edited. It pulls the other functions together in a
    // complete decision tree for the first turn.
    public String firstTurn(String card1, String card2, String dealerCard) {
        int handScore = parseCard(card1) + parseCard(card2);
        int dealerScore = parseCard(dealerCard);

        if (handScore == 22) return "P";

        if (20 < handScore) {
            return largeHand(isBlackjack(card1, card2), dealerScore);
        } else {
            return smallHand(handScore, dealerScore);
        }
    }
}
