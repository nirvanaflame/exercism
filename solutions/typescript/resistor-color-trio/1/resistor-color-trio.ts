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

export function decodedResistorValue(colors: Color[]): string {
  let first = String(COLORS.indexOf(colors[0]))
  if (first === "0") {
    first = ""
  }
  
  let second = String(COLORS.indexOf(colors[1]))
  let num = COLORS.indexOf(colors[2])
  if (COLORS.indexOf(colors[1]) == 0) {
    second = ""
    num += 1
  }
  console.log(num)

  let suffix = "0"
  if (num < 3) {
    console.log(suffix)
    console.log(num)
    suffix = suffix.repeat(num) + " "
    console.log(suffix)
  } else if (num < 6) {
    suffix = suffix.repeat(num - 3) + " kilo"
  } else if (num < 9) {
    suffix = suffix.repeat(num - 6) + " mega"
  } else if (num < 12) {
    suffix =suffix.repeat(num - 9) + " giga"
  }

  return `${first}${second}${suffix}ohms`
}
