;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-04_04_01-UFO_descent) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; world_state is a Number
;
; interpretation height of UFO (from top)

; libs
(require 2htdp/image)
(require 2htdp/universe)

; constants
(define width  80)
(define height 100)
(define close  (/ height 3))

;visual constants
(define background (empty-scene width height))
(define UFO        (overlay/align "center" "center"
                            (circle    10   "solid" "green")
                            (rectangle 40 2 "solid" "green")))

(define (tock height)
  (+ height 3))

(define (render height)
  (place-image UFO (/ width 2) height background))

(define (main init_height)
  (big-bang init_height
    [on-tick tock]
    [to-draw render]))

; Test
UFO
(check-expect (tock 11) 14)
(render 11)