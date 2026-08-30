export class Triangle {
  a: number;
  b: number;
  c: number;

  constructor(...sides: number[]) {
    this.a = sides[0]
    this.b = sides[1]
    this.c = sides[2]
  }

  get isEquilateral(): boolean {
    return this.isValid && (
      this.a === this.b && this.b === this.c
      )
  }

  get isIsosceles(): boolean {
    return this.isValid && (
      this.a === this.b || this.a === this.c || this.b === this.c
      )
  }

  get isScalene(): boolean {
    return this.isValid && (
      !this.isEquilateral && !this.isIsosceles
    ) 
  }

  get isValid(): boolean {
        if (this.a <= 0 || this.b <= 0 || this.c <= 0) {
            return false;
        }

        return (
            this.a + this.b > this.c &&
            this.a + this.c > this.b &&
            this.b + this.c > this.a
        );
    }
}