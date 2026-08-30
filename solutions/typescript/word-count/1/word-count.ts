export function count(text: string): Map<string, number> {
  const clean = text.replace(/[^\w']+|'(?![A-Za-z])|(?<![A-Za-z])'/g, " ").toLowerCase()
  const res = clean.split(" ").filter(x => x != "")
      .reduce((acc, word) => {
        if (acc.has(word)) {
          const val: number = acc.get(word) ?? 0
          acc.set(word, val + 1)
        } else {
          acc.set(word, 1)
        }
        return acc
      }, new Map())

  console.log(res)
  return res
}

