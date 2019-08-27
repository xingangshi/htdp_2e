;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 162_10-exercise-cheked_wage) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 162:
;
;  No employee could possibly work more than 100 hours per week. To protect the company
;  against fraud, the function should check that no item of the input list of wage* exceeds
;  100. If one of them does, the function should immediately signal an error. How do we have
;  to change the function in figure 44 if we want to perform this basic reality check?

(define per_hour 14)
(define max_hour 100)


(define (wage* alon)
  (cond
    [(empty? alon) '()]
    [else (cons (wage (first alon)) (wage* (rest alon)))]))

(define (wage hour)
  (cond
    [(< hour max_hour) (* per_hour hour)]
    [else (error "hours exceed maximum allowed hours")]))

(define (wage_v2 hour)
  (if (< h max_hour) (* per_hour hour)
      (error "hours exceed maximum allowed hours")))

; Test
(check-expect (wage* '()) '())
(check-expect (wage* (cons 28 '()))
              (cons (* per_hour 28) '()))
(check-expect (wage* (cons 40(cons 28 '())))
              (cons (* per_hour 40)(cons (* per_hour 28) '())))
(check-error  (wage* (cons 104 '()))
              "hours exceed maximum allowed hours")