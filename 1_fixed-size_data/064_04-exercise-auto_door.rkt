;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 064_04-exercise-auto_door) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 64:
;
;   During a door simulation the “open” state is barely visible.
;   Modify door-simulation so that the clock ticks once every three
;   seconds. Rerun the simulation. 


(require 2htdp/image)
(require 2htdp/universe)


(define (door_closer status)  
  (cond    
    [(string=? "locked" status) "locked"]    
    [(string=? "closed" status) "closed"]   
    [(string=? "open"   status) "closed"]))

(define (door_action status key)  
  (cond    
    [(and (string=? "locked" status) (string=? "u" key)) "closed"]   
    [(and (string=? "closed" status) (string=? "l" key)) "locked"]   
    [(and (string=? "closed" status) (string=? "o" key)) "open"]    
    [else status]))

(define (door_render status)  (text status 40 "red"))

(define (door_simulation init_state)
  (big-bang init_state
    [on-tick door_closer 3]
    [on-key  door_action]
    [to-draw door_render]))

; Test
;(door_render 10)
(door_simulation "locked")
