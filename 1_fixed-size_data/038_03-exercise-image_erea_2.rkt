;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 038_03-exercise-image_erea_2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 38. 
;   Design the function image-area, which counts the number of pixels in a given image..

; Name     : image_erea

; Func     : Image -> Number, returns the number of pixels in a given image.
;
; Given    : Image of rectangle with width 20, height 20
;
; Expected : 200
;

(require 2htdp/image)

(define (image_area in_img)
  (* (image-height in_img) (image-width in_img)))

; test
(image_area (rectangle 10 20 "solid" "red"))