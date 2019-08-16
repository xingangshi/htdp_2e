;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-03_01-design_function) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)

; String -> Number
(define (f a_string) 0)

; Number -> String
(define (g n) "a")

;
(define (h num str img) (empty-scene 100 100))


; Number -> Number
; computes the area of a square whose side is len
; given: 2, expect: 4
; given: 7, expect: 49
(define (area_of_square sider_length)
  (sqr sider_length))


; Number String Image -> Image
; adds s to img, y pixels from top, 10 pixels to the left
; given:
; 5 for y,
; "hello" for s, and
; (empty-scene 100 100) for img
; expected:
; (place-image (text "hello" 10 "red") 10 5 (empty-scene 100 100))
(define (add_image y s img)
  (place-image (text s 10 "red") 10 y img))


;test
(f "11")
(g 100)
(h 100 "199" (rectangle 100 200 "solid" "red"))
(area_of_square 2)
(area_of_square 7)
(add_image 40 "test" (empty-scene 100 100))

