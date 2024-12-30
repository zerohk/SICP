#lang sicp
;; if 语句是一个特殊形式，它的谓词部分和结果部分都是表达式
;; 改写了if语句，使他是一个普通的过程调用
;; 
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;; 使用new-if改写了求平方根的程序
;; 使用此程序求解平方根时会发生什么
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
(define (improve guess x)
        (average guess (/ x guess))
        )
(define (average x y)
        (/ (+ x y) 2)
        )
(define (good-enough? guess x)
        (< (abs (- (square guess) x)) 0.001)
        )
(define (square x)
        (* x x)
        )
(define (sqrt x)
        (sqrt-iter 1.0 x)
        )
(sqrt 4)


;; 按应用序执行：先求出参数值，再应用过程
;; (sqrt 4) => (sqrt-iter 1.0 4)
;; (sqrt-iter 1.0 4) => (new-if (good-enough? 1.0 4) 1.0 (sqrt-iter (improve 1.0 4) 4))


;; 上一步是一个new-if调用，需要先求出参数值
;;; 第一个参数(good-enough? 1.0 4)
;;; 第二个参数是1.0
;;; 第三个参数是(sqrt-iter (improve 1.0 4) 4)
;;; 先求解第一个参数：(good-enough? 1.0 4)
;;; (good-enough? 1.0 4) => (< (abs (- (square 1.0) 4)) 0.001)
;;; (abs (- (square 1.0) 4))
;;; (abs (- 1.0 4)) => 3.0

;;; 再求解第三个参数：(sqrt-iter (improve 1.0 4) 4)
;;; (sqrt-iter (improve 1.0 4) 4) 
;;; (sqrt-iter (average 1.0 (/ 4 1.0)) 4)
;;; (sqrt-iter (average 1.0 4.0) 4)
;;; (sqrt-iter 2.5 4)
;;; (new-if (good-enough? 2.5 4) 2.5 (sqrt-iter (improve 2.5 4) 4))
;;; 又要求解一个new-if调用
;;; 第一个参数(good-enough? 2.5 4)
;;; 第二个参数是2.5
;;; 第三个参数是(sqrt-iter (improve 2.5 4) 4)
;;;;; 先求解第一个参数：(good-enough? 2.5 4)
;;;;; (good-enough? 2.5 4) => (< (abs (- (square 2.5) 4)) 0.001)
;;;;; (abs (- (square 2.5) 4))
;;;;; (abs (- 6.25 4)) => 2.25
;;;;; 再求解第三个参数：(sqrt-iter (improve 2.5 4) 4)
;;;;; 又是一个新的new-if调用
;;;;; 此过程会一直持续下去；因为在应用序求值中，每次调用 new-if 时都会对所有参数求值，包括第三个参数（递归调用）。
;;;;; 这意味着即使 good-enough? 返回 #t，程序仍会继续计算第三个参数，导致无限递归。
