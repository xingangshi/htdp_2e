;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 185_11-exercise-check_more_exites) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 185:
;
;  You know about first and rest from BSL, but BSL+ comes with even more selectors than that. Determine
;  the values of the following expressions:
;
;  Find out from the documentation whether third, fourth, and fifth exist.
;

(check-expect (cons 1 (cons 2 (cons 3 '())))
              (list 1  2 3))

(check-expect (first (list 1 2 3)) 1)

(check-expect (rest (list 1 2 3)) (cons 2 (cons 3 '())))

(check-expect (rest (list 1 2 3)) (list 2 3))


(check-expect (second (list 1 2 3)) 2)


(check-expect (third (list 1 2 3 )) 3)

;(fourth (list 1 2 3)) ; Not exist

;(fifth (list  1 2 3)) ; Not exist