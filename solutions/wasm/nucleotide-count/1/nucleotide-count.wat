(module
  (memory (export "mem") 1)

  (func $countNucleotides (export "countNucleotides") (param $offset i32) (param $length i32) (result i32 i32 i32 i32)
                          (local $pos i32) (local $pos_val i32) (local $end i32)
                          (local $a i32) (local $c i32) (local $g i32) (local $t i32)
    (local.set $a (i32.const 0))
    (local.set $c (i32.const 0))
    (local.set $g (i32.const 0))
    (local.set $t (i32.const 0))
    
    (block $return
    (br_if $return (i32.le_u (local.get $length) (i32.const 0)))

    (local.set $pos (local.get $offset))
    (local.set $end (i32.add (local.get $offset) (local.get $length)))

    (loop $loop
      (local.set $pos_val (i32.load8_u (local.get $pos)))
      (if (i32.and (i32.ne (local.get $pos_val) (i32.const 65))
                   (i32.and (i32.ne (local.get $pos_val) (i32.const 67))
                            (i32.and (i32.ne (local.get $pos_val) (i32.const 71))
                                     (i32.ne (local.get $pos_val) (i32.const 84)))))
          (return (i32.const -1) (i32.const -1) (i32.const -1) (i32.const -1)))

      (if (i32.eq (local.get $pos_val) (i32.const 65)) (local.set $a (i32.add (local.get $a) (i32.const 1))))
      (if (i32.eq (local.get $pos_val) (i32.const 67)) (local.set $c (i32.add (local.get $c) (i32.const 1))))
      (if (i32.eq (local.get $pos_val) (i32.const 71)) (local.set $g (i32.add (local.get $g) (i32.const 1))))
      (if (i32.eq (local.get $pos_val) (i32.const 84)) (local.set $t (i32.add (local.get $t) (i32.const 1))))
      (local.set $pos (i32.add (local.get $pos) (i32.const 1)))
      (br_if $loop (i32.lt_u (local.get $pos) (local.get $end)))))

    (return (local.get $a) (local.get $c) (local.get $g) (local.get $t))
  )
)
