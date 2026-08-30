

const planets = {
  "mercury": 0.2408467,
  "venus": 0.61519726,
  "earth": 1.0,
  "mars": 1.8808158,
  "jupiter": 11.862615,
  "saturn": 29.447498,
  "uranus": 84.016846,
  "neptune": 164.79132
} as const

type Planet = keyof typeof planets

export function age(planet: Planet, seconds: number): number {
  const earthYear = seconds / 31557600
  const multiplier = planets[planet]
  return Math.round(earthYear / multiplier * 100) / 100
}
