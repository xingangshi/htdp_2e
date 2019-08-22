;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 097_06-exercise-r) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 97:
;
;  A programmer has chosen to represent locations on the Cartesian plane as pairs (x, y) or as
;  single numbers if the point lies on one of the axes:
;
;  Location is one of:
;    – Posn
;    – Number
;  interpretation Posn are positions on the Cartesian plane,
;  Numbers are positions on either the x- or the y-axis.
;
;  Design the function in-reach?, which determines whether a given location’s distance to the origin is strictly less than some constant R.
;
;  Note This function has no connection to any other material in this chapter.
;

(define R 20)

(define (in_reach? loc)
  (cond
    [(number? loc) (<= (abs loc) R)]
    [else (<= (distance loc) R)]))

(define (distance pos)
  (sqrt (+ (expt (posn-x pos) 2) (sqr (posn-y pos)))))

; Test
(check-expect (in_reach? 10)  #true)
(check-expect (in_reach? 30)  #false)
(check-expect (in_reach? -10) #true)
(check-expect (in_reach? -30) #false)

(check-expect (in_reach? (make-posn   2   2)) #true)
(check-expect (in_reach? (make-posn  30   2)) #false)
(check-expect (in_reach? (make-posn   2  40)) #false)
(check-expect (in_reach? (make-posn   2 -40)) #false)
(check-expect (in_reach? (make-posn  -2   2)) #true)
(check-expect (in_reach? (make-posn -30   2)) #false)
(check-expect (in_reach? (make-posn   0   0)) #true)

