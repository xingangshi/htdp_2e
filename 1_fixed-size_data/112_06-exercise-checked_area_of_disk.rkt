;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 112_06-exercise-checked_area_of_disk) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise: 112
;
;   A checked version of area-of-disk can also enforce that the arguments to the
;  function are positive numbers, not just arbitrary numbers. Modify checked-area-of-disk in this way.
;


(define (area_of_disk r)
  (* 3.14 (expt r 2)))

(define (check_are_of_disk v)
  (cond
    [(and (number? v) (>= v 0)) (area_of_disk v)]
    [else (error "area_of_disk : number exptected")]))

; Test

(check-expect (area_of_disk 3) (* 3.14 (* 3 3)))

(check-expect (check_are_of_disk 3) 28.26)


(check-error (check_are_of_disk -3) "area_of_disk : number exptected")
(check-error (check_are_of_disk "a") "area_of_disk : number exptected")