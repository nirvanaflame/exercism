const expected = {
  "]": "[",
  "}": "{",
  ")": "("
}

export function isPaired(input: string): boolean {
  const stack: string[] = []

  for (let ch of input.split("")) {
    switch (ch) {
      case "[":
      case "{":
      case "(":
        stack.push(ch);break;
      case "]":
      case "}":
      case ")":
        if (stack.pop() !== expected[ch]) return false
    }
  }

  return stack.length === 0
}