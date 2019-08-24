;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 135_09-exercise-contains) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 135:
;
; Develop the contains? function, which determines whether some given string occurs on a given list of strings.
;
; Note BSL actually comes with member?, a function that consumes two values and checks whether the first occurs in the second, a list:
;   > (member? "Flatt" (cons "b" (cons "Flatt" '())))
;   #true
;
; Don’t use member? to define the contains? function. 


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
(define (contains? name a_list_of_names)
  (cond
    [(empty? a_list_of_names) #false]
    [(cons? a_list_of_names)
     (cond
       [(string=? (first a_list_of_names) name) #true]
       [else (contains? name (rest a_list_of_names))])]))

; Test
(check-expect (contains? "Flatt" '())                  #false)
(check-expect (contains? "Flatt" (cons "Findler" '())) #false)
(check-expect (contains? "Flatt" (cons "Flatt" '()))   #true)
(check-expect (contains? "Flatt" (cons "Mur" (cons "Fish"  (cons "Find" '())))) #false)
(check-expect (contains? "Flatt" (cons "A" (cons "Flatt" (cons "C" '()))))      #true)

(contains? "Flatt" checked_list)