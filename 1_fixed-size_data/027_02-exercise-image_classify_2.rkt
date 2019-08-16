;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 027_02-exercise-image_classify_2) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)

(define in_sider_length 3)
(define in_mode "solid")
(define in_color "red")

(define in_image (circle in_sider_length in_mode in_color))

(define image_height (image-height in_image))
(define image_width  (image-width in_image))

(define (image_classify in_image)
  (cond
    [(> image_height image_width) "tall"]
    [(< image_height image_width) "wide"]
    [else "square"]))

(image_classify in_image)