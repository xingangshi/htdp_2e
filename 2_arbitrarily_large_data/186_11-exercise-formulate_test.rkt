;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 186_11-exercise-formulate_test) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 186:
;
; Take a second look at Intermezzo 1: Beginning Student Language, the intermezzo that presents BSL and its
; ways of formulating tests. One of the latter is check-satisfied, which determines whether an expression
; satisfies a certain property. Use sorted>? from exercise 145 to reformulate the tests for sort> with
; check-satisfied.
;
; Now consider this function definition:
;
; ; List-of-numbers -> List-of-numbers
; ; produces a sorted version of l
;   (define (sort>/bad l)
;   (list 9 8 7 6 5 4 3 2 1 0))
;
; Can you formulate a test case that shows that sort>/bad is not a sorting function? Can you use
; check-satisfied to formulate this test case?
;

(define (sorted>? nel) 
  (cond
    [(empty? (rest nel)) true]
    [(cons?  (rest nel))
     (cond [(> (first nel) (first (rest nel))) (sorted>? (rest nel))]
           [else false])]))

(define (sort> alon) 
  (cond    [(empty? alon) '()]  
           [else (insert (first alon) (sort> (rest alon)))]))

(define (insert n alon) 
  (cond    [(empty? alon) (cons n '())]   
           [else (if (>= n (first alon))    
                     (cons n alon)         
                     (cons (first alon) (insert n (rest alon))))]))

(define (sort>/bad l) 
 (sort>  l))

; Test
(check-expect (sorted>? (cons 3(cons 2(cons 1 '())))) true)
(check-expect (sorted>? (cons 1(cons 2(cons 3 '())))) false)

(check-expect    (sort> '()) '() ) 
(check-satisfied (sort> (list 12 20 -5)) sorted>?) 
(check-satisfied (sort> (list 3 2 1))    sorted>?)
(check-satisfied (sort> (list 1 2 3))    sorted>?)

(check-expect (insert 5 '()) (list 5))
(check-expect (insert 5 (list 6)) (list 6 5))
(check-expect (insert 5 (list 4)) (list 5 4))
(check-expect (insert 12 (list 20 -5)) (list 20 12 -5))
(check-expect (insert 4 (list 3 2 1)) (list 4 3 2 1))
(check-expect (insert 1 (list 3 2)) (list 3 2 1))

(check-expect    (sort>/bad (list 2 1 3)) (list 3 2 1) 
(check-satisfied (sort>/bad (list 2 1 3)) sorted>?)  