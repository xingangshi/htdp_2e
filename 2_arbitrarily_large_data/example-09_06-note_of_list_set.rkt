;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-09_06-note_of_list_set) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise
;
; Exercise 160. Design the functions set+.L and set+.R, which create a set by adding a number x to some given set s for the left-hand and right-hand data definition, respectively. 

; list_of_string String -> N
;
; determines how often s occurs in los
(define (count los s)
  (cond
    [(empty? los) 0]
    [(string=? s (first los)) (+ 1 (count (rest los) s))]
    [else (count (rest los) s)]))

; A Son.L is one of: 
; – empty 
; – (cons Number Son.L)
; 
; Son is used when it 
; applies to Son.L and Son.R
  

; A Son.R is one of: 
; – empty 
; – (cons Number Son.R)
; 
; Constraint If s is a Son.R, 
; no number occurs twice in s

; Son
(define es '())
 
; Number Son -> Boolean
; is x in s
(define (in? x s)
  (member? x s))

; Son -> Boolean
; #true if 1 is not a member of s;  #false otherwise
(define (not-member-1? s)
  (not (in? 1 s)))

; Test
(check-expect (count '() "aaa") 0)
 
(check-expect (count (cons "aaa" '()) "aaa") 1)

(check-expect (count (cons "aaa" (cons "aaa" '())) "aaa") 2)

(check-expect (count (cons "ccc" (cons "aaa" (cons "aaa" '()))) "aaa") 2)

(check-satisfied (set- 1 set123) not-member-1?)