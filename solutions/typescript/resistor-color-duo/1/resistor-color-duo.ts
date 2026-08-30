export const COLORS = [
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

export type Color = typeof COLORS[number]

export function decodedValue(colors: Color[]): number {
  const first = String(COLORS.indexOf(colors[0]))
  const second = String(COLORS.indexOf(colors[1]))
  return Number(first + second)
}
