;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 059_04-exercise-rocke_rising_v5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 59:
;
;    Recall that the word “height” forced us to choose one of two
;    possible interpretation. Now that you have solved the exercises
;    in this section, solve them again using the first interpretation of the word. Compare and contrast the solutions.

;
(require 2htdp/image)
(require 2htdp/universe)

(define width      100)
(define y_pos      300)
(define y_delta    3)
(define background (empty-scene width y_pos))
(define rocket     (rectangle 5 30 "solid" "red"))
(define center     (/ (image-width rocket) 2))

; An LRCD (for launching rocket countdown) is one of:
;   – "resting"
;   – a Number between -3 and -1
;   – a NonnegativeNumber 
;   interpretation a grounded rocket, in countdown mode,
;   a number denotes the number of pixels between the
;   top of the canvas and the rocket (its height)

; LRCD -> Image
;   renders the state as a resting or flying rocket

(define (draw_rocket height)
  (place-image rocket 10 (- height center) background))

(define (show x)
  (cond
    [(string? x) (draw_rocket y_pos)]
    [(<= -3 x -1) (place-image (text (number->string x) 20 "red")
                               10 (* 3/4 width)
                               (draw_rocket y_pos))]
    [(>= x 0) (draw_rocket x)]))

; LRCD KeyEvent -> LRCD
;   starts the countdown when space bar is pressed, 
;   if the rocket is still resting 
(define (launch x ke)
  (cond
    [(string? x)  (if (string=? " " ke) -3 x)]
    [(<= -3 x -1) x]
    [(>= x 0)     x]))

; LRCD -> LRCD
;   raises the rocket by YDELTA, if it is moving already 
(define (fly x)
  (cond
    [(string? x)  x]
    [(<= -3 x -1) (if (= x -1) y_pos (+ x 1))]
    [(>= x 0)     (- x y_delta)]))

(define (render x)
  (+ x y_delta))

(define (stop x)
  (>= x (- y_pos 10)))

(define (main2 s)
  (big-bang s
    [on-key  launch]
    [to-draw show]
    [on-tick render]
    [stop-when stop]))

; Test
(check-expect (launch 100 10) 100)
(check-expect (fly 100 ) 97)

(launch "abb" " ")
(launch "abb" "11")
(launch 100 " ")
(launch -2 " ")

(fly "abb")
(fly 100)
(fly -2)
(fly -1)

(show "resting")

(show -2)
(show 53)
(main2 0)
  