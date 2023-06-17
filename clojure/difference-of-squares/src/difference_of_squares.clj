(ns difference-of-squares)

(defn sum-of-squares [n]
  (/ (* n (inc n) (inc (* 2 n))) 6))

(defn- sum [n]
  (/ (* n (inc n)) 2))

(defn square-of-sum [n]
  (#(* % %) (sum n)))

(defn difference [n]
  (- (square-of-sum n)
     (sum-of-squares n)))