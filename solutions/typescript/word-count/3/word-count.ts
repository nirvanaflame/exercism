export const count = (text: string): Map<string, number> => 
  (text.toLowerCase().match(/\b([\w']+)\b/g) || [] as string[])
    .reduce((acc, next) =>
      acc.set(next, (acc.get(next) ?? 0) + 1),
      new Map<string, number>()
  )
