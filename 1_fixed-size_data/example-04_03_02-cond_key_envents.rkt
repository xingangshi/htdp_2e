;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-04_03_02-cond_key_envents) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (key_event_handle position key_event)
  (cond
    [(string=? key_event "left")  (- position 5)]
    [(string=? key_event "right") (+ position 5)]
    [else                         position]))

; Test
(check-expect (key_event_handle 13 "left")  8)
(check-expect (key_event_handle 13 "right") 18)
(check-expect (key_event_handle 13 "a")     13)