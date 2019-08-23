;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-08_03-program_with_list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 

; List-of-names -> Boolean
;
; determines whether "Flatt" is on a-list-of-names
;
(define (contains-flatt? a_list_of_names) #false)

; Test
(check-expect (contains-flatt? '()) #false)

(check-expect (contains-flatt? (cons "Find" '())) #false)

(check-expect (contains-flatt? (cons "Flatt" '())) #true)