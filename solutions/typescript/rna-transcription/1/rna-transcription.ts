interface EntryMap {
    [key: string]: string
}

const transformation = {
    "G": "C",
    "C": "G",
    "T": "A",
    "A": "U",
} as EntryMap

function apply(ch: string): string {
  const res = transformation[ch]
  if (res == null) {
    throw new Error("Invalid input DNA.")
  }
  return res
} 

export function toRna(dna: string): string {
  return [...dna].map(apply).join("")
}
