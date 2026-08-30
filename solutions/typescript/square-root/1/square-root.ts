export const squareRoot = (radicand: number, candidate = 1): number =>
  candidate * candidate >= radicand
  ? candidate
  : squareRoot(radicand, candidate + 1);