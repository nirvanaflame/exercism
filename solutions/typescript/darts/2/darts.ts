export function score(x: number, y: number): number {
  const pos = Math.sqrt(x ** 2 + y ** 2)

  if (pos <= 1) return 10
  if (pos <= 5) return 5
  if (pos <= 10) return 1
  return 0

}
