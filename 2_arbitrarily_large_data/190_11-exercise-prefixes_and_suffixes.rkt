;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 190_11-exercise-prefixes_and_suffixes) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 190:
;
; Design prefixes. The function consumes a list of 1Strings and produces the list of all prefixes.
; Recall that a list p is a prefix of l if p and l are the same up through all items in p. For example
; (list 1 2 3) is aprefix of itself and (list 1 2 3 4).
;
; Design the function suffixes, which consumes a list of 1Strings and produces all suffixes. A list
; s is a suffix of l if p and l are the same from the end, up through all items in s. For example,
; (list 2 3 4) is a suffix of itself and (list 1 2 3 4).
;

(define (prefixes los)
  (cond [(empty? los) '()]
        [else (cons los (prefixes (take (- (length los) 1) los)))]))

(define (take n los)
  (cond [(= 0 n) '()]
        [(= 1 n) (cons (first los) '())]
        [else (cons (first los) (take (- n 1) (rest los))) ]))

(define (suffixes los)
  (cond [(empty? los) '()]
        [else (cons los (suffixes (rest los)))]))
; Test
(check-expect (prefixes '()) '())
(check-expect (prefixes (list "a")) (list (list "a")))
(check-expect (prefixes (list "a" "b" "c" "d"))
              (list (list "a" "b" "c" "d") 
                    (list "a" "b" "c")
                    (list "a" "b") 
                    (list "a")))

(check-expect (suffixes '()) '())
(check-expect (suffixes (list "a" "b"))
              (list (list "a" "b") (list "b")))
(check-expect (suffixes (list "a" "b" "c" "d"))
              (list (list "a" "b" "c" "d") 
                    (list "b" "c" "d") 
                    (list "c" "d") 
                    (list "d")))