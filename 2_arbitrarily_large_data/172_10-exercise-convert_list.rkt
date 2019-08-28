;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 172_10-exercise-convert_list) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 172:
;
;  Design a program that converts a list of lines into a string. The strings should be separated by blank spaces
;  (" " ). The lines should be separated with a newline ("\n").
;
;  Challenge: Remove all extraneous white spaces in your version of the Piet Hein poem. When you are finished with the
;  design of the program, use it like this:
;
;  | (write-file "ttt.dat" (collapse (read-words/line "ttt.txt")))
;
;  The two files "ttt.dat" and "ttt.txt" should be identical.

(require 2htdp/batch-io)

(define (convert lls)
  (cond
    [(empty? lls) ""]
    [(cons? lls)
     (cond
       [(cons? (first lls))
        (string-append (convert_line (first lls))
                       (convert (rest lls)))]
       [else (string-append (first lls) " \n")])]))

(define (convert_line los)
  (cond
    [(empty? los) "\n"]
    [(cons?  los)
     (string-append (string-append (first los) " ") (convert_line (rest los)))]))

; Test
(define lls_1 (cons (cons "TTT" '())
                    (cons (cons "Put" (cons "up" (cons "in" (cons "a" (cons "place" '())))))
                          (cons (cons "los" (cons "2" '()))
                                '()))))

(check-expect (convert '()) "")
(check-expect (convert (cons "TTT" '())) "TTT \n")
(check-expect (convert 
               (cons (cons "TTT" '())
                     (cons (cons "Put" (cons "up" (cons "in" '())))
                           (cons (cons "los" (cons "2" '()))
                                 '()))))
              "TTT \nPut up in \nlos 2 \n")

(define raw_date (read-words/line "./temp_files/ttt.txt"))

raw_date

(write-file "./temp_files/ttt.dat" (convert raw_date))