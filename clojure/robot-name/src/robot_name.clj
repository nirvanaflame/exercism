(ns robot-name)

(def string (partial apply str))

(def caps "ABCDEFGHIJKLMNOPQRSTUVWXYZ")

(defn generate-name []
  (let [letters (->> caps seq shuffle (take 2) string)
        numbers (->> 10 range shuffle (take 3) string)]
    (string letters numbers)))

(defn robot []
  (atom {:name (generate-name)}))

(defn robot-name [robot]
  (:name @robot))

(defn reset-name [robot]
  (swap! robot assoc :name (generate-name)))