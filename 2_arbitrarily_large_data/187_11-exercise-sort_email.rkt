;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 187_11-exercise-sort_email) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 187:
;
; Design a program that sorts lists of email messages by date:
;
; Also develop a program that sorts lists of email messages by name. To compare two strings alphabetically, use the string<? primitive.
;

(define-struct email [from date message])
; A Email Message is a structure:
; (make-email String Number String)
; interpretation (make-email f d m) represents text m sent by
; f, d seconds after the beginning of time

(define (sort_by_date loe)
  (cond
    [(empty? loe) '()]
    [else (insert_by_date (first loe) (sort_by_date (rest loe)))]))

(define (insert_by_date e loe)
  (cond
    [(empty? loe) (cons e '())]
    [else (if (> (email-date e) (email-date (first loe)))
              (cons e loe)
              (cons (first loe) (insert_by_date e (rest loe))))]))

(define (sort_by_name loe) 
  (cond
    [(empty? loe) '()]
    [else (insert_by_name (first loe) (sort_by_name (rest loe)))]))

(define (insert_by_name e loe)
  (cond
    [(empty? loe) (cons e '())]
    [else (if (string>? (email-from e) (email-from (first loe)))
              (cons e loe)
              (cons (first loe) (insert_by_name e (rest loe))))]))
; Test
(check-expect (sort_by_date (list (make-email "John" 100 "msg")))
              (list (make-email "John" 100 "msg")))

(check-expect (sort_by_date (list (make-email "John" 100 "msg")
                                  (make-email "Paul"  50 "msg")))
              (list (make-email "John" 100 "msg")
                    (make-email "Paul" 50 "msg")))
              
(check-expect (sort_by_date (list (make-email "John" 50 "msg")
                                  (make-email "Paul" 150 "msg")))
              (list (make-email "Paul" 150 "msg")
                    (make-email "John" 50 "msg")))


(check-expect (sort_by_name (list (make-email "John" 100 "msg")))
              (list (make-email "John" 100 "msg")))

(check-expect (sort_by_name (list (make-email "Paul" 50 "msg")
                                  (make-email "John" 150 "msg")))
              (list (make-email "Paul" 50 "msg")
                    (make-email "John" 150 "msg")))

(check-expect (sort_by_name (list (make-email "John" 50 "msg")
                                  (make-email "Paul" 150 "msg")))
              (list (make-email "Paul" 150 "msg")
                    (make-email "John" 50 "msg")))