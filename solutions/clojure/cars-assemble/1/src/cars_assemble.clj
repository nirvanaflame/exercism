(ns cars-assemble)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (cond (= speed 0) 0.0
      (< speed 5) (* speed 221.0)
      (< speed 9) (* (* speed 221.0) 0.9)
      (< speed 10) (* (* speed 221.0) 0.8)
      :else (* (* speed 221.0) 0.77)
    )
  )

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (Math/floor (/ (production-rate speed) 60)))
  )
