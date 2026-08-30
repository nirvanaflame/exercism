export function transform(dict: Map<string, string[]>): {} {

  const result: {[key: string]: number} = {}
  for (let [key, values] of Object.entries(dict)) {
    for (let value of values) {
      result[value.toLowerCase()] = Number(key)
    }
  }

  return result
}