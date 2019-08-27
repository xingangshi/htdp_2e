;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 169_10-exercise-legal_posns) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 169:
;
;  Design the function legal. Like translate from exercise 168 the function consumes and produces
;  a list of Posns. The result contains all those Posns whose x-coordinates are between 0 and 100
;  and whose y-coordinates are between 0 and 200.
;

(define (legal l_o_p)
  (cond
    [(empty? l_o_p) '()]
    [(cons? l_o_p)
     (cond
       [(is_legal? (first l_o_p)) (cons (first l_o_p) (legal (rest l_o_p)))]
       [else (legal (rest l_o_p))])]))


(define (is_legal? p)
  (and (> (posn-x p) 0)
       (< (posn-x p) 100)
       (> (posn-y p) 0)
       (< (posn-y p) 200)))

; Test
(check-expect (legal '()) '())
(check-expect (legal (cons (make-posn 40 40) '()))
              (cons (make-posn 40 40) '()))
(check-expect (legal (cons (make-posn 40 40)(cons (make-posn 30 210) '())))
              (cons (make-posn 40 40) '()))
(check-expect (legal (cons (make-posn 40 40) (cons (make-posn 110 40) '())))
              (cons (make-posn 40 40) '()))
(check-expect (legal (cons (make-posn 110 210)(cons (make-posn -2 -2) '())))
              '())
