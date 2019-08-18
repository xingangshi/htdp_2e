;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 054_04-exercise-UFO_descent) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 54:
;
;   the upper interval goes from 0 to CLOSE;
;   the middle one starts at CLOSE and reaches HEIGHT;
;   and the lower, invisible interval is just a single line at HEIGHT.
;
; Name :  UFO_descent

; world_state is a Number
;
; interpretation height of UFO (from top)

; libs
(require 2htdp/image)
(require 2htdp/universe)

; constants
(define width    80)
(define height_y 300)
(define close    (/ height_y 3))

;visual constants
(define background (empty-scene width height_y))
(define UFO        (overlay/align "center" "center"
                            (circle    10   "solid" "green")
                            (rectangle 40 2 "solid" "green")))

(define (tock height)
  (+ height 3))

(define (render height)
  (place-image UFO (/ width 2) height background))

(define (text_info info color)
  (text info 11 color))

(define (draw_image info status)
  (place-image info
               30 15
               status))

(define (render/status height)
  (cond
    [(<= 0 height close) (draw_image (text_info "descending" "green")
                                     (render height))]
    [(and (> height close) (<= height height_y))  (draw_image (text_info "closing in" "orange")
                                      (render -100))]
    [(> height height_y) (draw_image (text_info "landed" "red")
                                      (render height))]))


(define (render/status_v2 height)
  (draw_image
   (cond
     [(<= 0 height close) (text_info "descending" "green")]
     [(and (> height close) (<= height height_y)) (text_info "closing in" "orange")]
     [(> height height_y) (text_info "landed" "red")])
   (render height)))


(define (main init_height)
  (big-bang init_height
    [on-tick tock]
    [to-draw render/status]))

(define (main_v2 init_height)
  (big-bang init_height
    [on-tick tock]
    [to-draw render/status_v2]))

; Test
UFO
(check-expect (tock 11) 14)
(render 11)

(main 0)
(main_v2 0)