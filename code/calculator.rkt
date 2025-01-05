#lang sicp
;; 编写一个函数 calculator，接受两个数和一个操作符（+、-、*、/），返回计算结果。
(define (calculator x y op)
    (cond ((= op "+") (+ x y))
          ((= op "-") (- x y))
          ((= op "*") (* x y))
          ((= op "/") (/ x y))
          (else (error "Invalid operator"))))
(calculator 1 2 "+")  ; 返回 3
(calculator 1 2 "-")  ; 返回 -1
(calculator 1 2 "*")  ; 返回 2
(calculator 1 2 "/")  ; 返回 1/2  
(calculator 1 2 "^")  ; 抛出错误 "Invalid operator"