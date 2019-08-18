;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 056_04-exercise-rocke_rising_v2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 56:
;
;   Why would it be incorrect to use (string=? "resting" x) as the
;   first condition in show? Conversely, formulate a completely accurate
;   condition, that is, a Boolean expression that evaluates to #true
;   precisely when x belongs to the first sub-class of LRCD. 

;
(require 2htdp/image)
(require 2htdp/universe)

(define width      100)
(define height     300)
(define y_delta    3)
(define background (empty-scene width height))
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
(define (show x)
  (cond
    [(string? x) (place-image rocket 10 (- height center) background)]
    [(<= -3 x -1) (place-image (text (number->string x) 20 "red")
                               10 (* 3/4 width)
                               (place-image rocket 10 (- height center) background))]
    [(>= x 0) (place-image rocket 10 (- x center) background)]))

; LRCD KeyEvent -> LRCD
;   starts the countdown when space bar is pressed, 
;   if the rocket is still resting 
(define (launch x ke) x)

; LRCD -> LRCD
;   raises the rocket by YDELTA, if it is moving already 
(define (fly x) x)

; Test
(check-expect (launch 100 10) 100)
(check-expect (fly 100 ) 100)

(show "resting")

(show -2)
(show 53)
  