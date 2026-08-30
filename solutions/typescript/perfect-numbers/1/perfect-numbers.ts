export function classify(num: number): string {
  if (num < 1) {
    throw new Error("Classification is only possible for natural numbers.")
  }
  if (num === 1) {
    return "deficient"
  }
  var arr: number[] = [1]
  for (let i = 2; i <= num / 2; i++) {
    if (num % i === 0) {
      arr.push(i)
    }
  }
  var sum = arr.reduce((el, acc)=> acc + el, 0)
  if (sum === num) {
    return "perfect"
  } else if(sum < num) {
    return "deficient"
  } else {
    return "abundant"
  }
}
