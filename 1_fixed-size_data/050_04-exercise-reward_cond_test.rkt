;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 050_04-exercise-reward_cond_test) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 50:
;
;   Enter the definition of reward and the application (reward 18) into the Definitions area
;   of DrRacket and use the stepper to find out how DrRacket evaluates applications of the function.
;
; Name : reward


(define (reward in_num)
  (cond
    [(< 0 in_num 10) "bronze"]
    ;[(and (< 10 in_num) (<= in_num 20)) "silver"]
    [(< 10 in_num 20) "silver"]
    [else "gold"]))

(reward 18)