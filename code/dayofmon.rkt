#lang sicp
;; 写程序返回月份的天数，假设2月有28天
(define (dayofmon month)
            (case month
                ((1 3 5 7 8 10 12) 31)
                ((4 6 9 11) 30)
                ((2) 28)
                (else (error "Invalid month"))))
(dayofmon 3)

; ;; 写程序返回月份的天数，假设2月有28天
; (define (dayofmon month)
;   (case month
;     ((1 3 5 7 8 10 12) 31)  ;; 31天的月份
;     ((4 6 9 11) 30)          ;; 30天的月份
;     ((2) 28)                ;; 2月
;     (else (error "Invalid month"))))  ;; 无效月份

;; 测试
(dayofmon 3)  ; 返回 31
(dayofmon 2)  ; 返回 28
(dayofmon 13) ; 抛出错误 "Invalid month"