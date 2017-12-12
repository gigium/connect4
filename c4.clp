(deftemplate next-move
  (slot move (type INTEGER) (default ?NONE))
)
 	
(deftemplate dim
  (slot x (type INTEGER) (default ?NONE))
  (slot y (type INTEGER) (default ?NONE))
)	


(deffunction get-all-facts-by-names
  ($?template-names)
  (bind ?facts (create$))
  (progn$ (?f (get-fact-list))
	   (if (member$ (fact-relation ?f) $?template-names)
	       then (bind ?facts (create$ ?facts ?f))))
  ?facts)


(defrule random (dim (x ?x) (y ?y))=> (assert (next-move (move (random 0 (- ?x 1))))))

(defrule dumb-defense (G1 ?x ?y) => (assert (next-move(move ?x))))
  
