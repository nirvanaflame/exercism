export function hey(message: string): string {
  const say = message.replace(/\s/g, "")
  if (say === "") return "Fine. Be that way!"
  
  const isQuestion = say.endsWith("?")
  const isYellilng = message.toUpperCase() === message && /[a-zA-Z]/.test(message)

  if (isYellilng && isQuestion) return "Calm down, I know what I'm doing!"
  if (isQuestion) return "Sure."
  if (isYellilng) return "Whoa, chill out!"
  
  return "Whatever."
}
