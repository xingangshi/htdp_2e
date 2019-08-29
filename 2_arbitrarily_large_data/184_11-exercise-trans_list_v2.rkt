;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 184_11-exercise-trans_list_v2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 184:
;
;  Determine the values of the following expressions:
;
;  Use check-expect to express your answers.
;

(check-expect (cons #false (cons #true (cons #false '())))
              (list (string=? "a" "b") (string=? "c" "c") #false))


(check-expect (list #false #true #false)
              (list (string=? "a" "b") (string=? "c" "c") #false))

;;
(check-expect (cons 30 (cons 200 (cons 0.5 '())))
              (list (+ 10 20) (* 10 20) (/ 10 20)))

(check-expect (list 30 200 0.5)
              (list (+ 10 20) (* 10 20) (/ 10 20)))

;;
(check-expect (cons "dana" (cons "jane" (cons "mary" (cons "laura" '()))))
              (list "dana" "jane" "mary" "laura"))
