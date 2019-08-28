;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 182_11-exercise-use_cons) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 182:
;
;  Use cons and '() to construct the equivalent of the following lists:
;
;  Use check-expect to express your answers.
;

; (list 0 1 2 3 4 5)
; (list (list "adam" 0) (list "eve" 1) (list "louisXIV" 2))
; (list 1 (list 1 2) (list 1 2 3))

(check-expect (cons 0 (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 '()))))))
              (list 0 1 2 3 4 5))


(check-expect (cons (cons "adam" (cons 0 '()))
                    (cons
                     (cons "eve" (cons 1 '()))
                     (cons
                      (cons "louisXIV" (cons 2 '())) '())))
              (list (list "adam" 0) (list "eve" 1) (list "louisXIV" 2)))

(check-expect (cons 1
                    (cons
                     (cons 1 (cons 2 '()))
                     (cons
                      (cons 1 (cons 2 (cons 3 '()))) '())))
              (list 1 (list 1 2) (list 1 2 3)))