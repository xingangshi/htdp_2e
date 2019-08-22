;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 095_06-exercise-explain_datas) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 95:
;
;   Explain why the three instances are generated according to the first or second clause of the data definition.
;

(define-struct tank [loc vel])
;  A Tank is
;    (make-tank Number Number). 
;  interpretation:
;    (make-tank x dx)
;  means the tank is at position (x, HEIGHT) and that it moves dx pixels per clock tick  

;  A Missile/UFO is
;    Posn. 
;  interpretation:
;    (make-posn x y)
;  is the missile's/UFO's current location 

;  A SIGS is one of: 
;    – (make-aim   UFO Tank)
;    – (make-fired UFO Tank Missile)
;  interpretation:
;    represents the state of the space invader game

(define-struct aim   [ufo tank])

(define-struct fired [ufo tank missile])

;Test
(define height      300)
(define tank_height 30)


(make-aim (make-posn 20 10) (make-tank 28 -3))

(make-fired (make-posn 20 10)
            (make-tank 28 -3)
            (make-posn 28 (- height tank_height)))


(make-fired (make-posn 20 100)
            (make-tank 100 3)
            (make-posn 22 103))