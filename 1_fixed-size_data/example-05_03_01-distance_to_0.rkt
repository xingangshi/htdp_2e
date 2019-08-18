;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-05_03_01-distance_to_0) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define point  (make-posn 31 26))

(posn-x point)
(posn-y point)


(define x0 100)
(define y0 200)

(posn-x (make-posn x0 y0))
(posn-y (make-posn x0 y0))

(define (distance_to_0 a_posn)
  (sqrt (+ (expt (posn-x a_posn) 2) (expt (posn-y a_posn) 2))))

(check-expect (distance_to_0 (make-posn 3 4)) 5)
(check-expect (distance_to_0 (make-posn 8 6)) 10)
(check-expect (distance_to_0 (make-posn 5 12)) 13)