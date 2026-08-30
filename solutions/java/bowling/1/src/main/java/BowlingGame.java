import java.util.*;
public class BowlingGame {
    private LinkedHashMap<Integer, List<Integer>> game = new LinkedHashMap<>();
    private int frameNumber = 1;
    private List<Integer> frames = new LinkedList<>();
    private int totalScore;
    public void roll(int pins) throws IllegalStateException {
        if (pins > 10) {
            throw new IllegalStateException("Pin count exceeds pins on the lane");
        } else if (pins < 0) {
            throw new IllegalStateException("Negative roll is invalid");
        }
        frames.add(pins);
        if (frames.size() == 2 && game.size() == 10) {
            if (getSum(frames) > 10 && !frames.contains(10)) {
                throw new IllegalStateException("Pin count exceeds pins on the lane");
            } else if (game.get(10).get(0) == 10 && frames.get(0) != 10 && frames.get(1) == 10) {
                throw new IllegalStateException("Pin count exceeds pins on the lane");
            }
        }
        if (game.size() == 10) {
            if (game.get(10).size() == 2) {
                if (getSum(game.get(10)) != 10 && !frames.isEmpty()
                        || getSum(game.get(10)) == 10 && frames.size() > 1) {
                    throw new IllegalStateException("Cannot roll after game is over");
                }
            } else {
                if (game.get(10).get(0) == 10 && frames.size() > 2) {
                    throw new IllegalStateException("Cannot roll after game is over");
                }
            }
        }
        if (game.size() < 10 && (pins == 10 || frames.size() == 2)) {
            if (getSum(frames) > 10) {
                throw new IllegalStateException("Pin count exceeds pins on the lane");
            }
            game.put(frameNumber, frames.stream().toList());
            frameNumber++;
            frames.clear();
        }
    }
    public int score() throws IllegalStateException {
        if (game.size() < 10) {
            throw new IllegalStateException("Score cannot be taken until the end of the game");
        }
        for (int i = 1; i <= 10; i++) {
            List<Integer> currentFrame = game.get(i);
            if (currentFrame.size() == 2) {
                int frameSum = getSum(currentFrame);
                if (frameSum == 10) {
                    if (i == 10 && frames.isEmpty()) {
                        throw new IllegalStateException("Score cannot be taken until the end of the game");
                    } else if (i == 10) {
                        totalScore += frameSum + frames.get(0);
                    } else {
                        totalScore += frameSum + game.get(i + 1).get(0);
                    }
                } else {
                    totalScore += frameSum;
                }
            } else {
                if (i == 10) {
                    if (frames.size() < 2) {
                        throw new IllegalStateException("Score cannot be taken until the end of the game");
                    } else {
                        totalScore += currentFrame.get(0) + frames.get(0) + frames.get(1);
                    }
                } else {
                    if (game.get(i + 1).size() == 2) {
                        totalScore += currentFrame.get(0) + getSum(game.get(i + 1));
                    } else {
                        if (frames.isEmpty()) {
                            totalScore += currentFrame.get(0) + game.get(i + 1).get(0) + game.get(i + 2).get(0);
                        } else {
                            totalScore += currentFrame.get(0) + game.get(i + 1).get(0) + frames.get(0);
                        }
                    }
                }
            }
        }
        return totalScore;
    }
    private int getSum(List<Integer> frames) {
        return frames.stream().mapToInt(integer -> integer).sum();
    }
}