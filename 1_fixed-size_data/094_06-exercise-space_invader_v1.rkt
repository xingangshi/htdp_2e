;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 094_06-exercise-space_invader_v1) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 94:
;
;   Draw some sketches of what the game scenery looks like at various stages. Use the sketches to
;   determine the constant and the variable pieces of the game. For the former, develop physical
;   and graphical constants that describe the dimensions of the world (canvas) and its objects.
;   Also develop some background scenery. Finally, create your initial scene from the constants for
;  the tank, the UFO, and the background. 
;

(require 2htdp/image)
(require 2htdp/universe)




(define tree
  (underlay/xy (circle 10 "solid" "darkgreen")
               9 15
               (rectangle 2 20 "solid" "darkbrown")))

(define UFO
  (overlay (circle 10 "solid" "green")
           (rectangle 40 2 "solid" "green")))

(define tank
  (overlay/align "center" "bottom"
                 (rectangle 10 17 "solid" "brown")
                 (rectangle 40 10 "solid" "brown")))

(define missile (triangle 6 "solid" "red"))

(define width  400)
(define height 200)
(define y_tree (- height (* 1/2 (image-height tree))))
(define y_tank (- height (image-height tank)))
(define background (empty-scene width height "white"))


(define canvas
  (place-images (list tree tree tree tree tree)
                (list(make-posn 130 y_tree)
                     (make-posn 150 y_tree)
                     (make-posn 160 y_tree)
                     (make-posn 310 y_tree)
                     (make-posn 320 y_tree))
                background))

(define initial_scene
  (overlay/align "center" "center"
                 UFO
                 (overlay/align "left" "bottom"
                                tank
                                canvas)))

; Test
tree
UFO
tank
missile
y_tree
y_tank
background
canvas
initial_scene