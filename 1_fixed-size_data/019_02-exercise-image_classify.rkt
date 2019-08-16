;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 019_02-exercise-image_classify) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)

(define (image_classify in_image)
  (cond
    [(> (image-height in_image) (image-width in_image)) "tall"]
    [(< (image-height in_image) (image-width in_image)) "wide"]
    [else "square"]))


(image_classify (rectangle 10 20 "solid" "red")); (rectangle width height mode color)

(image_classify (rectangle 20 10 "solid" "red"));

(image_classify (rectangle 20 20 "solid" "red")); 