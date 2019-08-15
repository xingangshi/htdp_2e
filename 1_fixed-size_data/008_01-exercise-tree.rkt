;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 008_01-exercise_tree) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define leaves (star-polygon 12 11 2 "solid" "green"))

(define body  (rectangle 10 25 "solid" "blue"))

(define tree  (overlay/align/offset "center" "top" leaves 0 37 body))

tree