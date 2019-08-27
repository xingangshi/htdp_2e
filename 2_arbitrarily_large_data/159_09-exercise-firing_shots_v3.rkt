;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 159_09-exercise-firing_shots_v3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 159:
;
;  If you run main, press the space bar (fire a shot), and wait for a good amount of time, the shot disappears from
;  the canvas. When you shut down the world canvas, however, the result is a world that still contains this invisible shot.
;
;  Design an alternative tock function, which not just moves shots one pixel per clock tick but also eliminates those
;  whose coordinates places them above the canvas. Hint You may wish to consider the design of an auxiliary function for the recursive cond clause.
;

(require 2htdp/image)
(require 2htdp/universe)

(define height 200)
(define width   30)
(define x_shots (- (/ width 2) 10))

(define bg (empty-scene width height "green"))
(define shot (rectangle 6 12 "outline" "black"))

(define (to_image w)
  (cond
    [(empty? w) bg]
    [else (place-image shot x_shots (first w) (to_image (rest w)))]))

(define (tock w) 
  (cond
    [(empty? w) '()]
    [(cons? w)
     (cond
       [(< (sub1 (first w)) 0) (tock (rest w))]
       [else (cons (sub1 (first w)) (tock (rest w)))])]))

(define (keyh w ke) 
  (cond  
    [(key=? ke " ") (cons height w)]  
    [else w]))

(define (main w0)  
  (big-bang w0         
            (on-tick tock)   
            (on-key keyh)    
            (to-draw to_image)))

; Test
(main (cons 0 '()))