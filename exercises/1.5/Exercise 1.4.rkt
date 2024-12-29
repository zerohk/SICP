#lang sicp
;; Observe that our model of evaluation allows for combinations whose operators are compound expres- sions. 
;; Use this observation to describe the behavior of the following procedure

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; (if (> b 0) + -) 当 b > 0时，返回+，然后执行(+ a b)；当b <= 0时，返回-，然后执行(- a b)；
;; 所以a-plus-abs-b(a b)计算的结果是 a + |b|。