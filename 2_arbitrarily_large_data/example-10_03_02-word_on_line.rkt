;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-10_03_02-word_on_line) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))


; LLS -> list_of_numbers
;
; determines the number of words on each line

(define (words_on_lines lls)
  (cond
    [(empty? lls) '()]
    [else (cons (length (first lls)) (words_on_lines (rest lls)))]))    


; Test
(define line_0 (cons "hello" (cons "world" '())))
(define line_1 '())

(define lls_0 '())
(define lls_1 (cons line_0 (cons line_1 '())))

(words_on_lines lls_1)

(check-expect (words_on_lines lls_0) '())
(check-expect (words_on_lines lls_1) (cons 2 (cons 0 '())))