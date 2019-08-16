;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 030_02-exercise-opt_movie_profit) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; verion 1.0
;
(define (profit_v1.0 price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 180
        (* 0.04
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))


(profit_v1.0 1)
(profit_v1.0 2)
(profit_v1.0 3)
(profit_v1.0 4)
(profit_v1.0 5)

; version 2.0
;
(define base_price     5.0)
(define base_attendees 120)
(define base_cost      180)
(define percent_size   0.1)
(define percent_cost_by_attendees   0.04)
(define attendees_desc_percent_size 15)

(define attendees_impacted (/ attendees_desc_percent_size percent_size))

(define (profit_v2.0 in_price)
  (- (* (+ base_attendees
           (* attendees_impacted
              (- base_price in_price)))
        in_price)
     (+ base_cost
        (* percent_cost_by_attendees
           (+ base_attendees
              (* attendees_impacted
                 (- base_price in_price)))))))

(profit_v2.0 1)
(profit_v2.0 2)
(profit_v2.0 3)
(profit_v2.0 4)
(profit_v2.0 5)