;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 170_10-exercise-replace_phones) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 170:
;
; Here is one way to represent a phone number:
;
; (define-struct phone [area switch four])
; ; A Phone is a structure: 
; ;   (make-phone Three Three Four)
; ; A Three is a Number between 100 and 999. 
; ; A Four is a Number between 1000 and 9999. 
;
; Design the function replace. It consumes and produces a list of Phones. It replaces all occurrence of area code 713 with 281. 
;

(define-struct phone [area switch four])

(define (replace lop)
  (cond [(empty? lop) lop]
        [(cons?  lop)
         (cons (replace_area_code (first lop))
               (replace (rest lop)))]))

(define (replace_area_code p)
  (if (= 713 (phone-area p))
      (make-phone 281 (phone-switch p) (phone-four p))
      p))
  

; Test
(check-expect (legal '()) '())
(check-expect (legal (cons (make-posn 40 40) '()))
              (cons (make-posn 40 40) '()))
(check-expect (legal (cons (make-posn 40 40)(cons (make-posn 30 210) '())))
              (cons (make-posn 40 40) '()))
(check-expect (legal (cons (make-posn 40 40) (cons (make-posn 110 40) '())))
              (cons (make-posn 40 40) '()))
(check-expect (legal (cons (make-posn 110 210)(cons (make-posn -2 -2) '())))
              '())

