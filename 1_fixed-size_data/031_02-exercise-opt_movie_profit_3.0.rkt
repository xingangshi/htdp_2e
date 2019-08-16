;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 031_02-exercise-opt_movie_profit_3.0) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
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

(define base_profit_3 (profit_v2.0 3.0))
(define base_profit_4 (profit_v2.0 4.0))
(define base_profit_5 (profit_v2.0 5.0))

(define (profit_v3.0 in_price)
  (string-append "Compare with base 3.0: "
                 (number->string (- base_profit_3 (profit_v2.0 in_price)))
                 ", \n\nCompare with base 4.0: "
                 (number->string (- base_profit_4 (profit_v2.0 in_price)))
                 ", \n\nCompare with base 5.0: "
                 (number->string (- base_profit_5 (profit_v2.0 in_price)))))


(profit_v3.0 1.5)