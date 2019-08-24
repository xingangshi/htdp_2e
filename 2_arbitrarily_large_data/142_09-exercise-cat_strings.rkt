;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 142_09-exercise-cat_strings) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 142:
;
; If you are asked to design the function cat, which consumes a list of strings and appends them
; all into one long string, you are guaranteed to end up with this partial definition:

; Guess a function that can create the desired result from the values computed by the subexpressions.
; Use DrRacket’s stepper to evaluate (cat (cons "a" '())).
;

(define (cat list)
  (cond
    [(empty? list) ""]
    [(cons? list)
     (cond
       [(string? (first list)) (string-append (first list) (cat (rest list)))]
       [else (error (first list) " must be type string ")])]
    [else (error "cat the input must be type string list")]))

; Test
(check-expect (cat '()) "")
(check-expect (cat (cons "a" (cons "b" '()))) "ab")
(check-expect (cat (cons "ab" (cons "cd" (cons "ef" '())))) "abcdef")
(check-error  (cat (cons "111" (cons 111 '())))  "111 must be type string ")
(check-error  (cat 111)  "cat the input must be type string list")