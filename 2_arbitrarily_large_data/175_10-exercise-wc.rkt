;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 175_10-exercise-wc) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 175:
;
;  Design a BSL program that simulates the Unix command wc. The purpose of the command is
;  to count the number of 1Strings, words, and lines in a given file. That is, the command
;  consumes the name of a file and produces a value that consists of three numbers. 

(require 2htdp/batch-io)

(define-struct summary [chars words lines])
; A Summary is a structure: (make-structure Number Number Number)
; interpretation: (make-structure c w l) is a combination of the
; number of characters (c), words (w) and lines (l) in a file.


(define (wc fn)
  (make-summary (length (read-1strings fn))
                (length (read-words    fn))
                (length (read-lines    fn))))


; Test
(check-expect (wc "./temp_files/ttt.txt")
              (make-summary 180 33 10))