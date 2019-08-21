;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 082_05-exercise-compare_word) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 82: 
;
;  Design the function compare-word. The function consumes two (representations of) three-letter words. It
;  produces a word that indicates where the given ones agree and disagree. The function retains the content of the structure
;  fields if the two agree; otherwise it places #false in the field of the resulting word. Hint The exercises mentions two tasks:
;  the comparison of words and the comparison of “letters.”
;

(define-struct 3_letter_word [a b c])

(define (compare_letter a b)
  (cond
    [(string=? a b) a]
    [else #false]))


(define (compare_word w_a w_b)
  (make-3_letter_word (compare_letter (3_letter_word-a w_a) (3_letter_word-a w_b))
                      (compare_letter (3_letter_word-b w_a) (3_letter_word-b w_b))
                      (compare_letter (3_letter_word-c w_a) (3_letter_word-c w_b))))

; Test
(check-expect (compare_word (make-3_letter_word "a" "b" "c") (make-3_letter_word "a" "b" "d")) (make-3_letter_word "a" "b" #false))