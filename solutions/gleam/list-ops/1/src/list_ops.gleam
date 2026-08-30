fn do_append(acc: List(a), list: List(a)) -> List(a) {
  case list {
    [] -> acc
    [head, ..tail] -> {
      acc |> append_val(head) |> do_append(tail)
    }
  }
}

fn append_val(list: List(a), val: a) -> List(a) {
  [val, ..list]
}

pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  [] |> do_append(first) |> do_append(second) |> reverse
}

pub fn concat(lists: List(List(a))) -> List(a) {
  [] |> flatten(lists) |> reverse
}

fn flatten(acc: List(a), lists: List(List(a))) -> List(a) {
  case lists {
    [] -> acc
    [first, ..rest] -> {
      acc |> do_append(first) |> flatten(rest)
    }
  }
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  case list {
    [] -> []
    [head, ..tail] -> {
      case function(head) {
        True -> [head, ..filter(tail, function)]
        False -> filter(tail, function)
      }
    }
  }
}

pub fn length(list: List(a)) -> Int {
  do_length(list, 0)
}

fn do_length(list: List(a), acc: Int) -> Int {
  case list {
    [] -> acc
    [_, ..tail] -> do_length(tail, acc + 1)
  }
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  case list {
    [] -> []
    [head, ..tail] -> [function(head), ..map(tail, function)]
  }
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  list |> do_foldl(initial, function)
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  list |> reverse |> do_foldl(initial, function)
}

fn do_foldl(list: List(a), acc: b, func: fn(b, a) -> b) -> b {
  case list {
    [] -> acc
    [head, ..tail] -> do_foldl(tail, func(acc, head), func)
  }
}

pub fn reverse(list: List(a)) -> List(a) {
   do_append([], list)
}
