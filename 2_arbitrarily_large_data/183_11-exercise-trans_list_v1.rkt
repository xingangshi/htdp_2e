;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 183_11-exercise-trans_list_v1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 183:
;
;  On some occasions lists are formed with cons and list. Reformulate the following lists using cons and '() exclusively:
;
;  Then formulate the lists using only list. Use check-expect to express your answers.
;

(check-expect (cons "a" (cons 0 (cons #false '())))
              (cons "a" (list 0 #false)))


(check-expect (list "a" 0 #false)
              (cons "a" (list 0 #false)))

;;

(check-expect (list (list 1 13))
              (list (cons 1 (cons 13 '()))))

(check-expect (cons (cons 1 (cons 13 '())) '())
              (list (cons 1 (cons 13 '()))))

;;
(check-expect (cons (cons 1 (cons (cons 13 (cons '() '())) '())) '())
              (cons (list 1 (list 13 '())) '()))

(check-expect (list (list 1 (list 13 '())))
              (cons (list 1 (list 13 '())) '()))

;;

(check-expect (cons '() (cons '() (cons (cons 1 '()) '())))
              (list '() '() (cons 1 '())))

(check-expect (list '() '() (list 1))
              (list '() '() (cons 1 '())))

;
(check-expect (cons "a" (cons (cons 1 '()) (cons #false (cons '() '()))))
              (cons "a" (cons (list 1) (list #false '()))))

(check-expect (list "a" (list 1) #false '())
              (cons "a" (cons (list 1) (list #false '()))))