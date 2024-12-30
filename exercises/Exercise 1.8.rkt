#lang sicp
;; 使用牛顿法求三次方根
;; 假设y是x的三次方根的近似值，我们可以通过(x/2y^2 + 2y) / 3 来得到一个更好的近似值
(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)
      )
  )

;; 实现good-enough?
(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001)
  )
;; 实现求立方的过程
(define (cube x)
  (* x x x)
  )

;; 实现改进过程
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3)
  )
;;
(define (square x)
  (* x x)
  )

;; 假定初始猜测值为1
(define (cube-root x)
  (cube-root-iter 1.0 x)
  )

(cube-root 27)