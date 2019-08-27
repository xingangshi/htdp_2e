;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 165_10-exercise-subst_robot) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 165:
;
;  Design the function subst-robot, which consumes a list of toy descriptions (strings) and replaces
;  all occurrences of "robot" with "r2d2"; all other descriptions remain the same.
;
;  Generalize subst-robot to the function substitute. The new function consumes two strings, called
;  new and old, and a list of strings. It produces a new list of strings by substituting all occurrences of old with new.


(require racket/string)

(define raw_str "robot")
(define aim_str "r2d2")

(define (subst str)
  (if (string-contains? raw_str str) (string-replace str raw_str aim_str)
      str))

(define (subst_robot lotd)
  (cond [(empty? lotd) '()]
        [else 
         (cons (subst (first lotd))
               (subst_robot (rest lotd)))]))


(define (substitute lot old new)
  (cond [(empty? lot) '()]
        [else (cons (string-replace (first lot) old new)
                    (substitute (rest lot) old new))]))

 
; Test
(check-expect (subst_robot '()) '())
(check-expect (subst_robot (cons "robot" '()))
              (cons "r2d2" '()))
(check-expect (subst_robot (cons "robot" (cons "robot man" '())))
              (cons "r2d2" (cons "robot man" '())))


(check-expect (substitute '() "old" "new") '())
(check-expect (substitute (cons "rocket" '()) "rocket" "r2d2")
              (cons "r2d2" '()))
(check-expect (substitute (cons "rocket"(cons "rocket man" '())) 
                          "rocket" "r2d2")
              (cons "r2d2"(cons "r2d2 man" '())))
