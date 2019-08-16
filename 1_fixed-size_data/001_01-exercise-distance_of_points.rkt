;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 001_01-exercise-distance_of_points) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define x 12)
(define y 5)

(define distance_of_points
  (sqrt (+ (* x x) (* y y))))

distance_of_points