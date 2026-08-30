export function isPangram(input: string): boolean {
  const chars = input.toLowerCase().replace(/[^a-zA-Z]/g, '')
  const set = new Set(chars)
  return set.size === 26
}
