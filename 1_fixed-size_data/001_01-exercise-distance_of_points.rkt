;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1_1_distance_of_points) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define x 3)
(define y 4)

(define (distance_of_points x y)
  (sqrt (+ (* x x) (* y y))))

(distance_of_points x y)

(distance_of_points 12 5); expect 13