;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 101_06-exercise-space_invader_v5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 101. 
;
;   Design the function si-control, which plays the role of the key event handler. As such it consumes a game
;   state and a KeyEvent and produces a new game state. This specific function reacts to three different key
;   events:
;
;     pressing the left  arrow ensures that the tank moves left;
;     pressing the right arrow ensures that the tank moves right; and
;     pressing the space bar fires the missile if it hasn’t been launched yet.
;          
;   Once you have this function, you can define the si-main function, which uses big-bang to spawn the game-playing window.
;
;   Enjoy the game.
;

(require 2htdp/image)
(require 2htdp/universe)

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
(define Y-TREE       (- HEIGHT (/ (image-height TREE) 2)))
(define Y-TANK       (- HEIGHT (/ (image-height TANK) 2)))
(define TANK-HEIGHT  (+ 5 (image-height TANK)))
(define UFO-DIA      10)
(define X-TANK-DISPL (/ (image-width TANK) 2))
(define Y-UFO-DISPL  (/ (image-height UFO) 2))
(define DELTA-X      3)
(define VEL-UFO      1)
(define VEL-MISSILE  (* 2 VEL-UFO))

(define BACKGROUND
  (place-images (list TREE TREE TREE TREE TREE)
                (list(make-posn 10 Y-TREE)
                     (make-posn 20 Y-TREE)
                     (make-posn 25 Y-TREE)
                     (make-posn 180 Y-TREE)
                     (make-posn 190 Y-TREE))
                (empty-scene WIDTH HEIGHT "aliceblue")))

; -----------------------------------------------------------------------
; Data Structures and Definitions

; A UFO is Posn. 
; interpretation: (make-posn x y) is the UFO's current location  

; A Missile is Posn. 
; interpretation: (make-posn x y) is the missile's current location 

(define-struct tank [loc vel])
; A Tank is (make-tank Number Number). 
; interpretation: (make-tank x dx) means the tank is at position
; (x, Y-TANK) and that it moves dx pixels per clock tick  

; A SIGS is one of: 
; – (make-aim   UFO Tank)
; – (make-fired UFO Tank Missile)
; interpretation: represents the state of the space invader game

(define-struct aim   [ufo tank])
(define-struct fired [ufo tank missile])

; -------------------------------------------------------------------
; Functions

; Tank Image -> Image 
; adds t to the given image im
(check-expect (tank-render (make-tank 0 -3) BACKGROUND)
              (place-image TANK 0 Y-TANK BACKGROUND))
(check-expect (tank-render (make-tank 28 -3) BACKGROUND)
              (place-image TANK 28 Y-TANK BACKGROUND))

(define (tank-render t im) 
  (place-image TANK (tank-loc t) Y-TANK im))

; UFO Image -> Image 
; adds u to the given image im
(check-expect (ufo-render (make-posn 10 20) BACKGROUND)
              (place-image UFO 10 20 BACKGROUND))

(define (ufo-render u im) 
  (place-image UFO (posn-x u) (posn-y u) im))

; Missile Image -> Image 
; adds m to the given image im
(check-expect (missile-render (make-posn 22 103) BACKGROUND)
              (place-image MISSILE 22 103 BACKGROUND))

(define (missile-render m im) 
  (place-image MISSILE (posn-x m) (posn-y m) im))

; SIGS -> IMAGE
; adds TANK, UFO, and possibly the MISSILE to BACKGROUND
(check-expect (si-render (make-aim (make-posn 20 10) (make-tank 28 -3))) 
              (ufo-render (make-posn 20 10) 
                          (tank-render (make-tank 28 -3) BACKGROUND)))
(check-expect (si-render (make-fired (make-posn 10 20)
                                     (make-tank 28 -3)
                                     (make-posn 32 103)))
              (ufo-render (make-posn 10 20)
                          (tank-render (make-tank 28 -3)
                                       (missile-render (make-posn 32 103)
                                                       BACKGROUND))))

(define (si-render s)  
  (cond    
    [(aim? s)     
     (tank-render (aim-tank s)                  
                  (ufo-render (aim-ufo s) BACKGROUND))]    
    [(fired? s)     
     (tank-render (fired-tank s)                 
                  (ufo-render (fired-ufo s)     
                              (missile-render (fired-missile s) 
                                               BACKGROUND)))]))

; SIGS -> Boolean
; returns true if the ufo has landed or been hit
(check-expect (si-game-over? (make-aim (make-posn 20 190) (make-tank 30 -3)))
              true)
(check-expect (si-game-over? (make-aim (make-posn 10 20) (make-tank 30 -3)))
              false)
(check-expect (si-game-over? (make-fired (make-posn 20 150) 
                                         (make-tank 30 -3)
                                         (make-posn 20 155))) true)
(check-expect (si-game-over? (make-fired (make-posn 20 100)
                                         (make-tank 30 -3)
                                         (make-posn 50 50))) false)

(define (si-game-over? s) 
  (cond [(aim? s)   (ufo-landed? (aim-ufo s))]
        [(fired? s) 
         (or (ufo-landed? (fired-ufo s))
             (ufo-hit? (fired-ufo s) (fired-missile s)))]))

; SIGS -> Image
; displays a "You Win" message if the the ufo is hit
; displays a "You Lose" message if the ufo has landed
; (only to be called when the game is deemed over)
(check-expect (si-render-final (make-aim (make-posn 20 190)
                                         (make-tank 30 -3)))
              (final-screen "You Lose!" "red" 
                            (tank-render (make-tank 30 -3) 
                                         (ufo-render (make-posn 20 190) 
                                                     BACKGROUND))))
(check-expect (si-render-final (make-fired (make-posn 20 190)
                                           (make-tank 30 -3)
                                           (make-posn 50 50)))
              (final-screen "You Lose!" "red" 
                            (tank-render (make-tank 30 -3) 
                                         (ufo-render (make-posn 20 190) 
                                                     (missile-render
                                                      (make-posn 50 50)
                                                      BACKGROUND)))))

(check-expect (si-render-final (make-fired (make-posn 50 50)
                                           (make-tank 30 -3)
                                           (make-posn 50 50)))
              (final-screen "You Win!" "green" 
                            (tank-render (make-tank 30 -3) 
                                         (ufo-render (make-posn 50 50) 
                                                     (missile-render
                                                      (make-posn 50 50)
                                                      BACKGROUND)))))


(define (si-render-final s)
  (cond
    [(aim? s) (final-screen "You Lose!" "red" (si-render s))]
    [(ufo-landed? (fired-ufo s)) 
     (final-screen "You Lose!" "red" (si-render s))]
    [else (final-screen "You Win!" "green" (si-render s))])) ; assume a hit

; String Color Image -> Image
; displays the final screen of the game with the given message
(define (final-screen msg txt-color img)
  (place-image (text msg 24 txt-color)
               (/ WIDTH 2)
               (/ HEIGHT 2)
               img))


; POSN -> Boolean
; returns true if the ufo is within landing range
(check-expect (ufo-landed? (make-posn 50 190)) true)
(check-expect (ufo-landed? (make-posn 50 50)) false)

(define (ufo-landed? s)
  (>= (posn-y s) (- HEIGHT Y-UFO-DISPL)))
  
; Posn -> Posn -> Boolean
; returns true if the missile is within range of the UFO body
; (uses Cartesian Distance formula to determine the distance 
;  between the ufo and misiile)
(check-expect (ufo-hit? (make-posn 20 10) (make-posn 25 10)) true)
(check-expect (ufo-hit? (make-posn 50 50) (make-posn 30 90)) false)
(check-expect (ufo-hit? (make-posn 20 10) (make-posn 50 15)) false)
(check-expect (ufo-hit? (make-posn 50 50) (make-posn 50 50)) true)

(define (ufo-hit? u m)
   (<= (sqrt (+ (sqr (- (posn-x m) (posn-x u))) 
                (sqr (- (posn-y m) (posn-y u)))))
       UFO-DIA))

; SIGS -> SIGS
; move world objects based on current state and velocities
(define (si-move w)  
  (si-move-proper w (create-random-number w)))

; SIGS Number -> SIGS
; move world elements at the given velocity on each clock tick
; the UFO moves at a constant downward velocity with occasional
; horizontal jumps
; the tank moves at a constant speed across the canvas
; the missile moves at two times the ufo velocity
(check-expect (si-move-proper (make-aim (make-posn 20 190) (make-tank 30 -3)) 
                              2)
              (make-aim (make-posn 22 (+ 190 VEL-UFO))
                        (make-tank 27 -3)))
(check-expect (si-move-proper (make-aim (make-posn 10 20) (make-tank 30 -3))
                              -2)
              (make-aim (make-posn 8 (+ 20 VEL-UFO))
                        (make-tank 27 -3)))

(check-expect (si-move-proper (make-fired (make-posn 20 150) 
                                         (make-tank 30 -3)
                                         (make-posn 20 155)) 0) 
              (make-fired (make-posn 20 (+ VEL-UFO 150))
                          (make-tank 27 -3)
                          (make-posn (+ 20 VEL-MISSILE) (- 155 VEL-MISSILE))))

(define (si-move-proper w n) 
  (cond
    [(aim? w) (make-aim (make-posn (+ (posn-x (aim-ufo w)) n)
                                   (+ (posn-y (aim-ufo w)) VEL-UFO))
                        (make-tank (+ (tank-loc (aim-tank w)) 
                                      (tank-vel (aim-tank w)))   
                                   (tank-vel (aim-tank w))))]
    [(fired? w) (make-fired (make-posn (+ (posn-x (fired-ufo w)) n)
                                       (+ (posn-y (fired-ufo w)) VEL-UFO))
                            (make-tank (+ (tank-loc (fired-tank w)) 
                                          (tank-vel (fired-tank w)))
                                        (tank-vel (fired-tank w)))
                            (make-posn (+ (posn-x (fired-missile w)) 
                                           VEL-MISSILE)
                                       (- (posn-y (fired-missile w))
                                           VEL-MISSILE)))])) 

; SIGS -> Number
; create a random number in case a UFO should perform a horizontal jump  
(check-random (abs( create-random-number (make-aim (make-posn 20 10) 
                                                   (make-tank 28 -3)))) 
              (random DELTA-X)) 

(define (create-random-number w)
  (if (odd? (current-seconds))
      (* -1 (random DELTA-X))
      (random DELTA-X)))

; SIGS KeyEvent -> SIGS
; changes the direction of the tank on left or right arrow key event
; launches a missile (if one not already fired) on a spacebar event
(check-expect (si-control (make-aim (make-posn 20 10) (make-tank 50 3)) 
                          "left")
              (make-aim (make-posn 20 10) (make-tank 50 -3)))
(check-expect (si-control (make-aim (make-posn 20 10) (make-tank 50 -3))
                          "right")
              (make-aim (make-posn 20 10) (make-tank 50 3)))
(check-expect (si-control (make-fired (make-posn 20 10)
                                      (make-tank 50 3)
                                      (make-posn 50 50))
                          "left")
              (make-fired (make-posn 20 10)
                          (make-tank 50 -3)
                          (make-posn 50 50)))
(check-expect (si-control (make-aim (make-posn 20 10) (make-tank 50 3))
                          " ")
              (make-fired (make-posn 20 10)
                          (make-tank 50 3)
                          (make-posn 50 (- HEIGHT TANK-HEIGHT))))

(define (si-control w ke)
  (cond
    [(or (string=? "right" ke) (string=? "left" ke))
     (cond
       [(aim? w) (make-aim (aim-ufo w)
                           (make-tank (tank-loc (aim-tank w))
                                      (* -1 (tank-vel (aim-tank w)))))]
       [else (make-fired (fired-ufo w)
                         (make-tank (tank-loc (fired-tank w))
                                    (* -1 (tank-vel (fired-tank w))))
                         (fired-missile w))])]
    [(and (string=? " " ke) (aim? w))
     (make-fired (aim-ufo  w)
                 (aim-tank w)
                 (make-posn (tank-loc (aim-tank w))
                            (- HEIGHT TANK-HEIGHT)))]
    [else w]))
     
; SIGS -> SIGS
; main routine
(define (si-main s)
  (big-bang s
            [on-tick   si-move]
            [on-key    si-control]
            [to-draw   si-render]
            [stop-when si-game-over? si-render-final ]))

; usage example
(si-main (make-aim (make-posn 50 0) (make-tank 0 0.5)))