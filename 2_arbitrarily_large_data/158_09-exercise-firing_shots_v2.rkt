;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 158_09-exercise-firing_shots_v2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 158:
;
;  Experiment whether the arbitrary decisions concerning constants are truly easy to change. For example, determine whether changing a single constant definition achieves the desired outcome:
;
;    change the height of the canvas to 220 pixels;
;    change the width of the canvas to 30 pixels;
;    change the x location of the line of shots to “somewhere to the left of the middle;” change the background to a green rectangle; and
;     change the rendering of shots to a red elongated rectangle.
;
;  Also check whether it is possible to double the size of the shot without changing anything else, change its color to black, or change its form to "outline".
;

(require 2htdp/image)
(require 2htdp/universe)

(define height 80)
(define width  100)
(define x_shots (- (/ width 2) 10))

(define bg (empty-scene width height "green"))
(define shot (rectangle 6 12 "outline" "black"))

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