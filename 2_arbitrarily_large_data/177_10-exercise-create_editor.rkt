;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 177_10-exercise-create_editor) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 177:
;
;  Design the function create-editor. The function consumes two strings and produces an Editor.
;  The first string is the text to the left of the cursor and the second string is the text to
;  the right of the cursor. The rest of the section relies on this function.

(require 2htdp/batch-io)

(define-struct editor [pre post])

(define (create_editor s1 s2)
  (make-editor (reverse (explode s1)) (explode s2)))

; Test
(check-expect (create_editor "" "")
              (make-editor '() '()))
(check-expect (create_editor "all" "good")
              (make-editor (cons "l" (cons "l" (cons "a" '())))
                           (cons "g" (cons "o" (cons "o" (cons "d" '()))))))

(define ex1 (create_editor "abc" "def"))
(define ex2 (create_editor "" "def"))
(define ex3 (create_editor "c" "def"))

ex1
ex2
ex3