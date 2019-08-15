;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1_2_hello_world) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define prefix "hello")
(define suffix "world")

(define (hello_world combition_sign)
  (string-append (string-append prefix combition_sign) suffix))

(hello_world "_")