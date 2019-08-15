;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 006_01-exercise-boat) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define sail_body (right-triangle 20 40 "solid" "black"))

(define sail (add-line sail_body 0 0 0 50 (make-pen "maroon" 3 "solid" "round" "miter")))

(define body_sider (ellipse 10 15 "solid" "white"))

(define body_top (rectangle 50 2 "solid" "blue"))

(define body_bottom (rectangle 50 15 "solid" "red"))

(define body (overlay/align/offset "center" "top" body_top 0 2
                                   (overlay/align/offset "right" "center" body_sider -5 0
                                                         (overlay/align/offset "left" "center" body_sider 5 0 body_bottom))))

(define sail_boat (overlay/align/offset 'center "bottom" sail 0 17  body))

sail_boat