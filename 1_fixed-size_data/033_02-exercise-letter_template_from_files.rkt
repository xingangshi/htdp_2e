;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 033_02-exercise-letter_template_from_files) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/batch-io)

; from Composing Functions note of example-02_03_01-letter_template.rkt -- start
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
;; test
;; (write-file 'stdout (letter "Matthew" "Fisler" "Felleisen")

;-- end


(define root_path "./temp_files/")

(define (file_with_path file_name)
  (string-append root_path file_name))


(define (main in_fst in_lst in_signature out)
  (write-file out
              (letter (read-file in_fst)
                      (read-file in_lst)
                      (read-file in_signature))))


;test
; write the three files
(define in_fst (file_with_path "in_fst.dat"))
(define in_lst (file_with_path "in_lst.dat"))
(define in_sig (file_with_path "in_sig.dat"))


(write-file in_fst "Panshi")
(write-file in_lst "Geek")
(write-file in_sig "Xingang Shi")

; create the required letter
(main in_fst in_lst in_sig 'stdout)

