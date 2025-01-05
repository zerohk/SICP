#lang sicp
;; 编写一个函数 leap-year?，判断某一年是否为闰年
;; 能被 4 整除但不能被 100 整除，或者能被 400 整除。
(define (leap-year? year)
  (if (= 0 (modulo year 4)) ;; 如果能被4整除
      (if (= 0 (modulo year 100)) ;; 能被4整除且能被100整除
          (if (= 0(modulo year 400)) ;; 能被4，100,400整除，则是闰年
              "闰年"
              "平年" ;; 能被4,100，但不能被400整除，是平年
              )
              "闰年")
              "平年" )) 
(leap-year? 2000)  ; 返回 "闰年"
(leap-year? 2004)  ; 返回 "闰年"
(leap-year? 2005)  ; 返回 "平年"
(leap-year? 1900)  ; 返回 "平年"

                