export class Anagram {
  original: string
  inputHash: string
  
  constructor(input: string) {
    this.original = input
    this.inputHash = this.hashCode(input)
  }

  public matches(...potentials: string[]): string[] {
    return potentials
      .filter(
        x => x.toLowerCase() !== this.original.toLowerCase() 
          && this.hashCode(x) === this.inputHash
      )
  }

  private hashCode(str: string): string {
    return str.toLowerCase()
      .split("")
      .sort()
      .join("")
  }
}
