;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 168_10-exercise-translate) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 168:
;
;  Design the function translate. It consumes and produces lists of Posns. For each (make-posn x y) in the former,
;  the latter contains (make-posn x (+ y 1)).—We borrow the word “translate” from geometry, where the movement of
;  a point by a constant distance along a straight line is called a translation.
;

(define (translate l_o_p)
  (cond
    [(empty? l_o_p) '()]
    [else
     (cons (make-posn (posn-x (first l_o_p)) (add1 (posn-y (first l_o_p))))
           (translate (rest l_o_p)))]))

; Test
(check-expect (translate '()) '())
(check-expect (translate (cons (make-posn 1 1) '()))
              (cons (make-posn 1 2) '()))
(check-expect (translate (cons (make-posn 1 1)(cons (make-posn 1 -1) '())))
              (cons (make-posn 1 2)(cons (make-posn 1 0) '())))
