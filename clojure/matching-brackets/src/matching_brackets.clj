(ns matching-brackets)

(def ^:private matching {\{ \}, \[ \], \( \)})

(def ^:private opening? (set (keys matching)))

(def ^:private bracket? (into opening? (vals matching)))

(defn valid? [s]
  (let [update-stack
         (fn [stk c]
           (cond (opening? c) (conj stk c)
                 (= (matching (peek stk)) c) (pop stk)
                 :else (reduced [::not-empty])))]
    (->> (filter bracket? s)
         (reduce update-stack [])
         (empty?))))
