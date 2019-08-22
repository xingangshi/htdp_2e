;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 102_06-exercise-space_invader_rev1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 102:
;
;   Turn the examples into test cases.
;

(require 2htdp/image)
(require 2htdp/universe)

(define-struct sigs [ufo tank missile])
; SIGS.v2 (short for version 2) 
; is (make-sigs UFO Tank MissileOrNot)
; interpretation represents the state of the space invader game  

; A MissileOrNot is one of: 
; – #false
; – Posn
; interpretation #false means the missile hasn't been fired yet
; Posn says the missile has been fired and is at the specified location. 

; Graphic Constants
(define TREE
  (underlay/xy (circle 10 "solid" "darkgreen")
               9 15
               (rectangle 2 20 "solid" "brown")))

(define UFO  (overlay (circle 10 "solid" "green")          
                      (rectangle 40 2 "solid" "green")))

(define TANK (overlay/align "center" "bottom"
                            (rectangle 10 17 "solid" "DarkKhaki")
                            (rectangle 40 10 "solid" "DarkKhaki")))

(define MISSILE (triangle 5 "solid" "red"))

; Physical Constants
(define WIDTH        200)
(define HEIGHT       200)
(define TANK-HEIGHT  (+ 5 (image-height TANK)))
(define Y-TREE       (- HEIGHT (/ (image-height TREE) 2)))
(define Y-TANK       (- HEIGHT (/ (image-height TANK) 2)))


(define BACKGROUND
  (place-images (list TREE TREE TREE TREE TREE)
                (list(make-posn 10 Y-TREE)
                     (make-posn 20 Y-TREE)
                     (make-posn 25 Y-TREE)
                     (make-posn 180 Y-TREE)
                     (make-posn 190 Y-TREE))
                (empty-scene WIDTH HEIGHT "aliceblue")))


; MissileOrNot Image -> Image 
; adds the missile image to sc for m
(check-expect (missile-render.v2 false BACKGROUND)
              BACKGROUND)
(check-expect (missile-render.v2 (make-posn 32 (- HEIGHT TANK-HEIGHT 10))
                                 BACKGROUND)
              (place-image MISSILE 32 (- HEIGHT TANK-HEIGHT 10) BACKGROUND))

(define (missile-render.v2 m scene) 
  (cond
    [(posn? m)    (place-image MISSILE (posn-x m) (posn-y m) scene)]
    [(boolean? m) scene]))