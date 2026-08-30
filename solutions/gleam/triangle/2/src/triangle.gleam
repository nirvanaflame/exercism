pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && a == b && b == c
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && { a == b || a == c || b == c }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && { a != b && b != c && a != c }
}

fn is_triangle(a: Float, b: Float, c: Float) -> Bool {
  a != 0.0
  && a +. b >=. c
  && a +. c >=. b
  && b +. c >=. a
}
