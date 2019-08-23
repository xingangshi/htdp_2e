;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 131_09-exercise-list_of_names) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 131:
;
;   Create an element of List-of-names that contains five Strings. Sketch a box representation
;   of the list similar to those found in figure 44.
;
;   Explain why
;     (cons "1" (cons "2" '()))
;   is an element of List-of-names and why (cons 2 '()) isn’t. 


; A List-of-names is one of:
;
;   – '()
;   – (cons String List-of-names)
;
; interpretation a List-of-names represents a list of invitees by last name
(cons "zhang"
      (cons "wang"
            (cons "li"
                  (cons "wu"
                        (cons "zhao"
                              (cons "qian"
                                    (cons "sun"
                                          (cons "zheng"
                                                '()))))))))
                            