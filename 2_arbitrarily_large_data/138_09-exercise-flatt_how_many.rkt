;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 138_09-exercise-flatt_how_many) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 138:
;
; Compare the template for contains-flatt? with the one for how-many. Ignoring the function name, they are the same. Explain the similarity.
;


; List_of_string -> Number
;
; return how many strings alos contains
(define (how_many alos)
  (cond
    [(empty? alos) 0]
    [(cons? alos) (+ 1 (how_many (rest alos)))]
    [else (error "alos must be a cons")]))


; List-of-names -> Boolean
;
; determines whether "Flatt" is on a-list-of-names
;
(define To_checked "Flatt")

(define (contains_flatt? a_list_of_names)
  (cond
    [(empty? a_list_of_names) #false]
    [(cons? a_list_of_names)
     (cond
       [(string=? (first a_list_of_names) To_checked) #true]
       [else (contains_flatt? (rest a_list_of_names))])]))


; Test
(check-expect (how_many '()) 0)
(check-expect (how_many (cons "a" '())) 1)
(check-expect (how_many (cons "b" (cons "a" '()))) 2)
(check-error (how_many "a") "alos must be a cons")