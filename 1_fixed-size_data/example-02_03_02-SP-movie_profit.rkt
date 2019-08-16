;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 02_03-SP-movie_profit) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (attendees ticket_price)
  (- 120 (* (- ticket_price 5.0) (/ 15 0.1))))

(define (revenue ticket_price)
  (* ticket_price (attendees ticket_price)))

(define (cost ticket_price)
  (+ 180 (* 0.04 (attendees ticket_price))))

(define (profit ticket_price)
  (- (revenue ticket_price)
     (cost ticket_price)))

(profit 1)