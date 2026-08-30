class AnnalynsInfiltration {
    public static boolean canFastAttack(boolean knightIsAwake) {
        return !knightIsAwake;
    }

    public static boolean canSpy(boolean knightIsAwake, boolean archerIsAwake, boolean prisonerIsAwake) {
        return knightIsAwake == true || archerIsAwake == true || prisonerIsAwake == true;
    }

    public static boolean canSignalPrisoner(boolean archerIsAwake, boolean prisonerIsAwake) {
        return archerIsAwake == false && prisonerIsAwake == true;
    }

    public static boolean canFreePrisoner(boolean knightIsAwake, boolean archerIsAwake, boolean prisonerIsAwake, boolean petDogIsPresent) {
        return petDogIsPresent ? 
            archerIsAwake == false :
            prisonerIsAwake ? 
                knightIsAwake == false && archerIsAwake == false :
                false;
    }
}
