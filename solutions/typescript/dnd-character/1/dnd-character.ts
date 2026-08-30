export class DnDCharacter {
  hitpoints: number
  constitution: number
  strength: number
  dexterity: number
  intelligence: number
  wisdom: number
  charisma: number

  constructor() {
    this.constitution = DnDCharacter.generateAbilityScore()
    this.hitpoints = 10 + DnDCharacter.getModifierFor(this.constitution)
    this.strength = DnDCharacter.generateAbilityScore()
    this.dexterity = DnDCharacter.generateAbilityScore()
    this.intelligence = DnDCharacter.generateAbilityScore()
    this.wisdom = DnDCharacter.generateAbilityScore()
    this.charisma = DnDCharacter.generateAbilityScore()
  }
  
  public static generateAbilityScore(): number {
    return Number((Math.random() * (18 - 3) + 3).toFixed(0))
  }

  public static getModifierFor(abilityValue: number): number {
    return Math.floor((abilityValue - 10) / 2)
  }
}
