const COLORS = [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white'
] as const

type Color = typeof COLORS[number]

const ohms = {
    "giga": 1_000_000_000,
    "mega": 1_000_000,
    "kilo": 1_000
} as const

export function decodedResistorValue(colors: Color[]): string {
    const num = (10 * COLORS.indexOf(colors[0]) + COLORS.indexOf(colors[1])) * (10 ** COLORS.indexOf(colors[2]))
    const [prefix, divisor] = Object.entries(ohms).find(([_, value]) => num > value) ?? ["", 1]

    return `${num/divisor} ${prefix}ohms`
}