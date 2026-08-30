import java.util.Random;

public class DnDCharacter {

    Random random = new Random();
    int charisma;
    int constitution;
    int dexterity;
    int intelligence;
    int strength;
    int wisdom;

    public DnDCharacter() {
        charisma = ability();
        constitution = ability();
        dexterity = ability();
        intelligence = ability();
        strength = ability();
        wisdom = ability();
    }

    public int ability() {
        int min = Integer.MAX_VALUE;
        int sum = 0;
        for (int i = 0; i < 4; i++) {
            int x = random.nextInt(1, 7);
            sum += x;
            min = Math.min(min, x);
        }
        return sum - min;
    }

    public int getStrength() {
        return strength;
    }

    public int getDexterity() {
        return dexterity;
    }

    public int getConstitution() {
        return constitution;
    }

    public int getIntelligence() {
        return intelligence;
    }

    public int getWisdom() {
        return wisdom;
    }

    public int getCharisma() {
        return charisma;
    }

    public int getHitpoints() {
        return 10 + modifier(constitution);
    }

    public int modifier(int constitution) {
        return (int) Math.floor((constitution - 10) / 2.0);
    }
}
