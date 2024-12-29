#lang sicp
;; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

;;
(define (square x)
  (* x x))
;; find smallest num of three numbers
(define (smallest-of-three x y z)
  (cond ((and (< x y) (< x z)) x)
        ((and (< y x) (< y z)) y)
        (else z)))
(define (sum-of-squares-of-two-larger x y z)
  (-
   (+ (square x)
      (square y)
      (square z))
   (square (smallest-of-three x y z))))

(sum-of-squares-of-two-larger 2 3 4)