#lang sicp
;; 判断一个数是否是偶数
(define (even? x)
		(if (= 0 (modulo x 2))
			"偶数"
			"奇数"))

(even? 3)
(even? 4)
(even? 5)