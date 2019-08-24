;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 141_09-exercise-all_true_one_true) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 141:
;
; all-true, which consumes a list of Boolean values and determines whether all of them are #true. In other words,
; if there is any #false on the list, the function produces #false; otherwise it produces #true.
;
; one-true, which consumes a list of Boolean values and determines whether at least one item on the list is #true.
;


(define (all_true b_list)
  (cond
    [(empty? b_list) #true]
    [(cons? b_list)
     (cond
       [(not (first b_list)) #false]
       [else (all_true (rest b_list))])]
    [else (error "all_true the input must be type Boolean list")]))

(define (one_ture b_list)
  (cond
    [(empty? b_list) #false]
    [(cons? b_list)
     (cond
       [(first b_list) #true]
       [else (one_ture (rest b_list))])]
    [else (error "one_ture the input must be type Boolean list")]))

; Test
(check-expect (all_true (cons true (cons true (cons true '())))) true)
(check-expect (all_true (cons true (cons false (cons true '())))) false)
(check-expect (all_true '()) true)
(check-error  (all_true 111) "all_true the input must be type Boolean list")


(check-expect (one_ture (cons false (cons false (cons false '())))) false)
(check-expect (one_ture (cons false (cons true (cons false '())))) true)
(check-expect (one_ture '()) false)
(check-error  (one_ture 111) "one_ture the input must be type Boolean list")