;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 157_09-exercise-firing_shots) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 157:
;
;  Equip the program in figure 43 with tests and make sure it passes those.
;
;  Explain what main does. Then run the program via main.
;

(require 2htdp/image)
(require 2htdp/universe)

(define height 80)
(define width  100)
(define x_shots (/ width 2))

(define bg (empty-scene width height))
(define shot (triangle 3 "solid" "red"))


(define (to_image w)
  (cond
    [(empty? w) bg]
    [else
     (place-image shot x_shots (first w) (to_image (rest w)))]))

(define (tock w) 
  (cond
    [(empty? w) '()]
    [else (cons (sub1 (first w)) (tock (rest w)))]))

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
(to_image (cons 10 '()))

(check-expect (to_image (cons 10 '()))              
              (place-image shot x_shots 10 bg))

(check-expect (tock (cons 0 (cons 2 (cons 30 '()))))
              (cons -1(cons 1(cons 29 '()))))

(main (cons 0 (cons 0 (cons 2 (cons 30 '())))))