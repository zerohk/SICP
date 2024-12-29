#lang sicp
;; Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with 
;; is using applicative-order evaluation or normal-order evaluation. He deﬁnes the following two procedures:
;; (define (p) (p))
;; (define (test x y)
;;   (if (= x 0) 0 y))
;; Then he evaluates the expression
;; (test 0 (p))
;; What behavior will Ben observe with an interpreter that uses applicative-order evaluation? 
;; What behavior will he observe with an interpreter that uses normal-order evalu- ation? 
;; Explain your answer. (Assume that the evaluation rule for the special form if is the same 
;; whether the interpreter is using normal or applicative order: 
;; The predicate expression is evaluated ﬁrst, 
;; and the result determines whether to evaluate the consequent or the alternative expression.)
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))
(test 0 (p))


;; 应用序（Appicative Order）：先求值参数，再应用
;; 正则序（Normal Order）：先替换参数，再规约
;; (define (p) (p)) 定义了一个无限递归函数
;; (test 0 (p)) 在应用序中，先求值参数，(p)会无限递归，导致无法终止
;; 在正则序中，先替换参数，(p)会无限递归，但是由于if的短路特性，不会执行y，所以不会无限递归

