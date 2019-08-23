;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 133_09-exercise-contains_flatt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 133:
;
; Use DrRacket to run contains-flatt? in this example:
;
; What answer do you expect? 


(define To_checked "Flatt")

(define checked_list
  (cons "Fagan"
        (cons "Findler"
              (cons "Fisler"
                    (cons "Flanagan"
                          (cons "Flatt"
                                (cons "Felleisen"
                                      (cons "Friedman" '()))))))))


; List-of-names -> Boolean
;
; determines whether "Flatt" is on a-list-of-names
;
(define (contains_flatt? a_list_of_names)
  (cond
    [(empty? a_list_of_names) #false]
    [(cons? a_list_of_names) (or (string=? (first a_list_of_names) To_checked)
                                 (contains_flatt? (rest a_list_of_names)))]))

; Test
(check-expect (contains_flatt? '()) #false)

(check-expect (contains_flatt? (cons "Find" '())) #false)

(check-expect (contains_flatt? (cons "Flatt" '())) #true)

(check-expect (contains_flatt? checked_list) #true)