;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 134_09-exercise-contains_flatt_v2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 134:
;
; Here is another way of formulating the second cond clause in contains-flatt?:
;
; Explain why this expression produces the same answers as the or expression in the version of figure 47. Which version is clearer to you? Explain. 


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
    [(cons? a_list_of_names)
     (cond
       [(string=? (first a_list_of_names) To_checked) #true]
       [else (contains_flatt? (rest a_list_of_names))])]))

; Test
(check-expect (contains_flatt? '()) #false)

(check-expect (contains_flatt? (cons "Find" '())) #false)

(check-expect (contains_flatt? (cons "Flatt" '())) #true)

(check-expect (contains_flatt? checked_list) #true)