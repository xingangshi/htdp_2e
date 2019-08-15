;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 01_06-example-supper_booleans) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define x 2)
(define inverse_of_x (/ 1 x))
inverse_of_x

(if (= x 0) 0 (/ 1 x))

(define x_1 0)

(if (= x_1 0) 0 (/ 1 x_1))

