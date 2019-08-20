;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 069_05-exercise-ballf) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise : 69
;
;   Here is an alternative to the nested data representation of balls:
;
;    (define-struct ballf [x y deltax deltay])
;
;  Programmers often call this a flat representation. Create an instance
;  of ballf that has the same interpretation as ball1.
;

(define-struct vel [deltax deltay])

(define-struct loc [x_pos  y_pos])

(define-struct ball [location vertical])

(define-struct ballf [x y deltax deltay])

(define-struct centry [name home office cell])

(define-struct phone [area number])

; Test
(define localtion (make-loc 30 40))
(define vertical  (make-vel -10 5))

(define ball1 (make-ball localtion vertical))

(ball-location ball1)
(loc-x_pos (ball-location ball1))
(loc-y_pos (ball-location ball1))

(ball-vertical ball1)
(vel-deltax (ball-vertical ball1))
(vel-deltay (ball-vertical ball1))

;
(define ballf1 (make-ballf 30 40 -10 5))

(ballf-deltax ballf1)

;
(define Shriram_Fisler (make-centry "Shriram Fisler"
             (make-phone 207 "363-2421")
             (make-phone 101 "776-1099")
             (make-phone 208 "112-9981")))

(define home_phone (centry-home Shriram_Fisler))
(phone-number home_phone)