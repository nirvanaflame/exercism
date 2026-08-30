class DndCharacter {

    Random r = new Random()

    int strength
    int dexterity
    int constitution
    int intelligence
    int wisdom
    int charisma

    int hitpoints


    DndCharacter()
    {
        strength = ability()
        dexterity = ability()
        constitution = ability()
        intelligence = ability()
        wisdom = ability()
        charisma = ability()

        hitpoints = 10 + modifier(constitution)
    }

    def modifier(int c)
    {
        Math.floorDiv( c-10, 2 )
    }

    def ability()
    {
        r.nextInt(16) + 3
    }

}