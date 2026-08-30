pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  foldr(over: first, from: second, with: fn(acc, x) {
    [x, ..acc]
  })
}

pub fn concat(lists: List(List(a))) -> List(a) {
  foldl(over: lists, from: [], with: fn(acc, list) {
    append(acc, list)
  })
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  foldr(over: list, from: [], with: fn(acc, x){
    case function(x) {
      True -> [x, ..acc]
      False -> acc
    }
  })
}

pub fn length(list: List(a)) -> Int {
  foldl(over: list, from: 0, with: fn(acc, _){acc+1})
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  foldr(over: list, from: [], with: fn(acc, x){[function(x), ..acc]})
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [head, ..tail] -> foldl(tail, function(initial, head), function)
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [head, ..tail] -> function(foldr(tail, initial, function), head)
  }  
}

pub fn reverse(list: List(a)) -> List(a) {
   list |> do_reverse([])
}

fn do_reverse(list: List(a), acc: List(a)) -> List(a) {
  case list {
    [] -> acc
    [head, ..tail] -> do_reverse(tail, [head, ..acc])
  }
}
