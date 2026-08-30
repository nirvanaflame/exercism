const translations = new Map([
  ["AUG", "Methionine"],
  ["UUU", "Phenylalanine"],
  ["UUC", "Phenylalanine"],
  ["UUA", "Leucine"],
  ["UUG", "Leucine"],
  ["UCU", "Serine"],
  ["UCC", "Serine"],
  ["UCA", "Serine"],
  ["UCG", "Serine"],
  ["UAU", "Tyrosine"],
  ["UAC", "Tyrosine"],
  ["UGU", "Cysteine"],
  ["UGC", "Cysteine"],
  ["UGG", "Tryptophan"],
  ["UAA", "STOP"],
  ["UAG", "STOP"],
  ["UGA", "STOP"]
])

export function translate(seq: string): string[] {
  const result: string[] = []
  for (let i = 0; i < seq.length; i += 3) {
    const code = seq.substring(i, i + 3).trim()
    if (code.length !== 3) {
      throw new Error("Invalid codon")
    }

    let value = translations.get(code);
    if (value) {
      if (value === "STOP") {
        return result
      }
      result.push(value)
    } else {
      throw new Error("Invalid codon")
    }
  }

  return result
}