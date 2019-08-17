;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 049_03-exercise-guage_prog) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 49:
;
;   The program consumes the maximum level of happiness. The gauge display starts with the maximum score,
;   and with each clock tick, happiness decreases by -0.1; it never falls below 0, the minimum happiness
;   score. Every time the down arrow key is pressed, happiness increases by 1/5; every time the up arrow
;   is pressed, happiness jumps by 1/3.
;
;   To show the level of happiness, we use a scene with a solid, red rectangle with a black frame. For a
;   happiness level of 0, the red bar should be gone; for the maximum happiness level of 100, the bar
;   should go all the way across the scene.
;
; Name : guage_prog

; Include headfiles
(require 2htdp/image)
(require 2htdp/universe)


(define guage_width  100)
(define guage_height (* 0.1 guage_width))
(define frame_size   2)
(define speed        0.1)
(define backgroud    (empty-scene (+ guage_width frame_size) (+ guage_height frame_size)))

(define (tock world_state)
  (cond
    [(>= world_state guage_width) (- guage_width speed)]
    [(<= world_state 0) 0]
    [else (- world_state speed)]))

(define (adjust world_state key_info)
  (cond
    [(key=? key_info "up")   (* world_state (+ 1 1/3))]
    [(key=? key_info "down") (* world_state (+ 1 1/5))]
    [else world_state]))

(define (render world_state) 
  (overlay/align "left" "center"
                 (rectangle (+ world_state (* 1/2 frame_size)) (+ guage_height  (* 1/2 frame_size)) "solid" "red") 
                 backgroud))
                             
(define (guage_prog world_state)
  (big-bang world_state
    [on-tick  tock]
    [on-key   adjust]
    [to-draw  render]))

; Test
backgroud
(render 100)
(guage_prog 100)