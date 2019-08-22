;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 098_06-exercise-space_invader_v2) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 98:
;
;   Design the functions tank-render, ufo-render, and missile-render. Is the result of this expression
;
;   ...
;
;   When do the two expressions produce the same result?
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

(define tank_height (+ 5 (image-height tank)))
(define x_tank_displ (/ (image-width tank) 2))


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

(define-struct tank1 [loc vel])
(define-struct aim [ufo tank])
(define-struct fired [ufo tank  missile])

(define (tank_render t im) 
  (place-image tank (tank1-loc t) y_tank im))

(define (ufo_render u im) 
  (place-image UFO (posn-x u) (posn-y u) im))

(define (missile_render m im) 
  (place-image missile (posn-x m) (posn-y m) im))

(define (si_render s)  
  (cond    
    [(aim? s)     
     (tank_render (aim-tank s)                  
                  (ufo_render (aim-ufo s) background))]    
    [(fired? s)     
     (tank_render (fired-tank s)                 
                  (ufo_render (fired-ufo s)     
                              (missile_render (fired-missile s) 
                                               background)))]))


; Test

(tank_render    (make-tank1 28 -3) background)
(tank_render    (make-tank1 0  -3) background)
(ufo_render     (make-posn  10 20) background)
(missile_render (make-posn 22 103) background)
(si_render (make-aim (make-posn 20 10) (make-tank1 28 -3)))
(si_render (make-fired (make-posn 10 20) (make-tank1 28 -3) (make-posn 32 103)))


;

(define a1 (make-aim (make-posn 20 10) 
                     (make-tank1 28 -3)))

; missile has been fired
(define f1 (make-fired (make-posn 20 10)            
                       (make-tank1 28 -3)           
                       (make-posn 28 (- height tank_height))))

; missile fired and close enough to ufo for a collision
(define f2 (make-fired (make-posn 20  100)            
                       (make-tank1 100   3)            
                       (make-posn 22  103)))

(define ex1 (ufo_render (fired-ufo f1)               
                        (tank_render (fired-tank f1)
                                     (missile_render (fired-missile f1)
                                                     background))))

(define ex2 (tank_render (fired-tank f1)               
                         (ufo_render (fired-ufo f1)    
                                     (missile_render (fired-missile f1)    
                                                     background))))

(define ex3 (ufo_render (fired-ufo f2)               
                        (tank_render (fired-tank f2)
                                     (missile_render (fired-missile f2)
                                                     background))))

(define ex4 (tank_render (fired-tank f2)               
                         (ufo_render (fired-ufo f2)    
                                     (missile_render (fired-missile f2)    
                                                     background))))

(check-expect ex1 ex2)
(check-expect ex3 ex4)