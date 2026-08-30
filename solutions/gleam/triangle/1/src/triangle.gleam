pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && a == b && b == c
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && case [a == b, b == c, a == c] {
    [True, _, _] -> True
    [_, True, _] -> True
    [_, _, True] -> True
    _ -> False 
  }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && case [a != b, b != c, a != c] {
    [True, True, True] -> True
    _ -> False
  }
}

fn is_triangle(a: Float, b: Float, c: Float) -> Bool {
  a != 0.0
  && a +. b >=. c
  && a +. c >=. b
  && b +. c >=. a
}
