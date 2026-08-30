export class Squares {
  count: number
  
  constructor(count: number) {
    this.count = count
  }

  get sumOfSquares(): number {
    var res = 0
    for (let i = 1; i <= this.count; i++) {
      res += i ** 2
    }
    return res
  }

  get squareOfSum(): number {
    var res = 0
    for (let i = 1; i <= this.count; i++) {
      res += i
    }
    return res ** 2
  }

  get difference(): number {
    return this.squareOfSum - this.sumOfSquares
  }
}
