;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 006_01-exercise-automobile) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define body (rectangle 100 20 "solid" "pink"))

(define tire (circle    10     "solid" "black"))

(define top  (rectangle 50 20 "outline" 
                        (make-pen "red" 10 "solid" "round" "round" )))

(define auto
  (overlay/align/offset  "right"  "bottom" tire 10  0
  (overlay/align/offset  "left"   "bottom" tire -10 -15 
  (overlay/align/offset  "center" "top"    top  0   20
                         body))))

auto