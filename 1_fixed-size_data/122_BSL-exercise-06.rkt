;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 122_BSL-exercise-06) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 122:
;
;   Evaluate the following expressions step by step:

1. (+ (* (/ 12 8) 2/3)
      (- 20 (sqrt 4)))
2. (cond
     [(= 0 0) #false]
     [(> 0 1) (string=? "a" "a")]
     [else (= (/ 1 0) 9)])

3. (cond
     [(= 2 0) #false]
     [(> 2 1) (string=? "a" "a")]
     [else (= (/ 1 2) 9)])

;Use DrRacket’s stepper to confirm your computations.
