;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 171_10-exercise-list_of_list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 171:
;
;   You know what the data definition for List-of-strings looks like. Spell it out. Make sure that you can
;   represent Piet Hein’s poem as an instance of the definition where each line is represented as a string
;   and another instance where each word is a string. Use read-lines and read-words to confirm your representation choices.
;
;   Next develop the data definition for List-of-list-of-strings. Again, represent Piet Hein’s poem as an instance of
;   the definition where each line is represented as a list of strings, one per word, and the entire poem is a list of
;   such line representations. You may use read-words/line to confirm your choice. 

(require 2htdp/batch-io)

; A List-of-Strings is one of:
; - '()
; - (cons String Los)

(cons "TTT"
      (cons ""
            (cons "Put up in a place"
                  (cons "where it's easy to see"
                        (cons "..." '())))))

(cons "TTT"
      (cons "Put"
            (cons "up"
                  (cons "in"
                        (cons "..." '())))))

(read-lines "./temp_files/ttt.txt")
(read-words "./temp_files/ttt.txt")


; A List-of-List-of-Strings is one of:
; - '()
; - (Cons Los LLos)
(define los1 (cons "TTT" '()))
(define los2 (cons "Put" (cons "up" (cons "in" (cons "a" (cons "place" '()))))))
(define los3 (cons "los" (cons "2" '())))

(cons (cons "TTT" '())
      (cons (cons "Put" (cons "up" (cons "in" (cons "a" (cons "place" '())))))
            (cons (cons "los" (cons "2" '()))
                  '())))


(read-words/line "./temp_files/ttt.txt")