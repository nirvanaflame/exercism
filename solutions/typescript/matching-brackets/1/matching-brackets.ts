const braces = new Map([
  ["]", "["],
  ["}", "{"],
  [")", "("]
]);

export function isPaired(input: string): boolean {
  const mem: string[] = []

  for (let bracket of input.split("")) {
    if ("[{(".indexOf(bracket) > -1) {
      mem.push(bracket)
    } else if ("]})".indexOf(bracket) > -1) {
      const closing = braces.get(bracket)
      if (closing) {
        if (closing !== mem.pop()) {
          return false
        }
      }
    }
  }

  return mem.length === 0
}