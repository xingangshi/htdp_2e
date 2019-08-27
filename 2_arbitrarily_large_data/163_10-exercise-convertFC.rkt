;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 163_10-exercise-convertFC) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 163:
;
;  Design convertFC. The function converts a list of Fahrenheit measurements to a list of Celsius measurements.

; 摄氏温度(C)与华氏温度(F)的换算式是：C = 5×(F- 32)/9，F = 9×C /5+32。

;  1℃ =（9×1 /5+32）℉=33.8℉。

;  式中F-华氏温度，C-摄氏温度。

(define (f_to_c f)
  (/ (* 5 (- f 32)) 9))

(define (convertFC* l_o_f)
  (cond
    [(empty? l_o_f) '()]
    [else (cons (f_to_c (first l_o_f)) (convertFC* (rest l_o_f)))]))

; Test
(check-expect (convertFC* '()) '())
(check-expect (convertFC* (cons 32 '())) 
              (cons 0 '()))
(check-expect (convertFC* (cons 32 (cons -40 '())))
              (cons 0 (cons -40 '())))