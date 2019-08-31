;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 188_11-exercise-sort_by_score) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 188:
;
; Design a program that sorts lists of game players by score:
;

(define-struct gp [name score])
; A GamePlayer is a structure:
; (make-gp String Number)
; interpretation (make-gp p s) represents player p who scored
; a maximum of s points

(define (sort_by_score> logp) 
  (cond [(empty? logp) '()]
        [else (insert_by_score (first logp) (rest logp))]))

(define (insert_by_score g logp)
  (cond [(empty? logp) (cons g '())]
        [else (if (> (gp-score g) (gp-score (first logp)))
                  (cons g logp)
                  (cons (first logp) (insert_by_score g (rest logp))))]))

; Test
(check-expect (sort_by_score> '()) '())
(check-expect (sort_by_score> (list (make-gp "a" 20))) (list (make-gp "a" 20)))
(check-expect (sort_by_score> (list (make-gp "a" 30)
                         (make-gp "b" 10))) (list (make-gp "a" 30)
                                                  (make-gp "b" 10)))
(check-expect (sort_by_score> (list (make-gp "a" 20)
                         (make-gp "b" 30))) (list (make-gp "b" 30)
                                                  (make-gp "a" 20)))