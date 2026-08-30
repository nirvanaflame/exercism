export class Anagram {
  input: string
  inputHash: string
  
  constructor(input: string) {
    this.input = input
    this.inputHash = this.hashCode(this.input.toLowerCase())
  }

  public matches(...potentials: string[]): string[] {
    return potentials
      .filter(
        x => x.toLowerCase() !== this.input.toLowerCase() 
          && this.hashCode(x.toLowerCase()) === this.inputHash
      )
  }

  private alpha = "abcdefghijklmnopqrstuvwxyz";
  private hashCode(str: string): string {
    const counts = new Array(this.alpha.length).fill(0);
    for (const char of str) {
      const index = this.alpha.indexOf(char);
      if (index !== -1) {
        counts[index]++;
      }
    }
    return counts.join("");
  }
}
