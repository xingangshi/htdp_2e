;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-06_01_01-space__invaders_game) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
;

;
(define-struct tank [loc vel])


(define-struct aim [ufo tank])

(define-struct fired [ufo tank missile])


;Test
(define height      300)
(define tank_height 30)

(make-aim (make-posn 20 20) (make-tank 28 3))

(make-fired (make-posn 20 20)
            (make-tank 28 3)
            (make-posn 28 (- height tank_height)))


(make-fired (make-posn 300  100)            
            (make-tank 200  113)            
            (make-posn 332  103))

