#lang sicp
;; 根据星期几返回活动安排
(define (activity day)
		(case day
			("monday" "上班")
			("tuesday" "开会")
			(else "休息"))
)
(activity "monday")
(activity "tuesday")
(activity "sunday")
(activity "saturday")