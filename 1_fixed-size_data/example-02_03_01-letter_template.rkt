;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 02_03-example-letter_template) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/batch-io)

(define (letter fst lst signature_name)
  (string-append
   (opening fst)
   "\n\n"
   (body fst lst)
   "\n\n"
   (closing signature_name)))

(define (opening fst)
  (string-append "Dear " fst ","))

(define (body fst lst)
  (string-append
   "We have discovered that all people with the last name " "\n"
   lst " have won our lottery. So, " fst ", " "\n"
   "hurry and pick up your prize."))


(define (closing signature_name)
  (string-append
   "Sincerely,\n\n" signature_name "\n"))

; test
(letter "Matthew" "Fisler" "Felleisen")

(letter "Kathi" "Felleisen" "Findler")

(write-file 'stdout (letter "Matthew" "Fisler" "Felleisen"))