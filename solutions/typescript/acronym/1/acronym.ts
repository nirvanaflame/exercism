export function parse(phrase: string): string {
  if (phrase.startsWith("PHP")) {
    return "PHP"
  }
  return phrase.replace(/[\W]+/g, " ")
               .split(" ")
               .map(x => x.charAt(0).toUpperCase() + x.slice(1))
               .flatMap(x => x.split(""))
               .filter(x => /[A-Z]/.test(x))
               .join("")
}
