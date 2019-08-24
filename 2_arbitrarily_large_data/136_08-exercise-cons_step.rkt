;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 135_09-exercise-contains) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 136:
;
; Use DrRacket’s stepper to check the calculation for
;
;   (contains-flatt? (cons "Flatt" (cons "C" '())))
;
; Also use the stepper to determine the value of
;
;   (contains-flatt?
;     (cons "A" (cons "Flatt" (cons "C" '()))))
;
; What happens when "Flatt" is replaced with "B"? 

(define To_checked "Flatt")

;
; determines whether "Flatt" is on a-list-of-names
;
(define (contains_flatt? a_list_of_names)
  (cond
    [(empty? a_list_of_names) #false]
    [(cons? a_list_of_names)
     (cond
       [(string=? (first a_list_of_names) To_checked) #true]
       [else (contains_flatt?  (rest a_list_of_names))])]))

; Test
(contains_flatt? (cons "Flatt" (cons "C" '())))

(contains_flatt? (cons "A" (cons "Flatt" (cons "C" '()))))