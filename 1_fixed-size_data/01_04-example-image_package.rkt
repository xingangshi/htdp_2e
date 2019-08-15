;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 01_04-example-image_package) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; the url of image package is https://docs.racket-lang.org/teachpack/2htdpimage.html
(require 2htdp/image)

(circle 30 "outline" "red")

(rectangle 10 20 "solid" "blue")

(star 12 "solid" "green")

(image-width (circle 10 "solid" "red"))

(image-height (rectangle 10 20 "solid" "blue"))

(+ (image-width (circle 10 "solid" "red"))
   (image-height (rectangle 10 20 "solid" "blue")))

(overlay (square 4 "solid" "orange")
         (circle 6 "solid" "yellow"))

(underlay (circle 6 "solid" "yellow")
          (square 4 "solid" "orange"))

(place-image (circle 6 "solid" "yellow")
             100 100
             (empty-scene 200 200))