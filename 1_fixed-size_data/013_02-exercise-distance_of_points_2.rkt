;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 013_01-exercise-distance_of_points_2) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define x 3)
(define y 4)

(define (distance_of_points x y)
  (sqrt (+ (expt x 2) (expt y 2))))

(distance_of_points x y)

(distance_of_points 12 5); expect 13