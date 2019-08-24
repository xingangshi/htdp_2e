;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 143_09-exercise-image_size) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 143:
;
; Design ill-sized?. The function consumes a list of images loi and a positive number n. It produces the first
; image on loi that is not an n by n square; if it cannot find such an image, it produces #false.
;
; Hint Use
;   ImageOrFalse is one of: ; – Image
;   – #false
;
; for the result part of the signature.
;

(require 2htdp/image)
(require 2htdp/universe)

(define (ill_sized? n loi)
  (cond
    [(empty? loi) true]
    [(cons? loi)
     (cond
       [(not (is_squart n (first loi))) false]
       [else (ill_sized? n (rest loi))])]))

(define (is_squart n image)
  (and (= n (image-width image))
       (= n (image-height image))))

; Test
(check-expect (ill_sized? 3 '()) true)
(check-expect (ill_sized? 3 (cons (circle 3 "solid" "red") '())) false)
(check-expect (ill_sized? 4 (cons (rectangle 4 4 "solid" "green") '())) true)
(check-expect (ill_sized? 4 (cons (square 4 "solid" "red")
                                  (cons (square 3 "solid" "red")
                                        (cons (square 4 "solid" "red") '()))))
              false)
(check-expect (ill_sized? 1 (cons (square 1 "solid" "green")
                                 (cons (square 1 "solid" "red")
                                       (cons (square 1 "solid" "blue") '()))))
              true)

