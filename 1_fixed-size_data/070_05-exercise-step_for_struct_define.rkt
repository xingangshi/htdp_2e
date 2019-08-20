;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 070_05-exercise-step_for_struct_define) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise : 70
;
;   Spell out the laws that the following structure type definitions introduce
;
;   Use these laws to explain how DrRacket arrives at 101 as the value of this expression:
;
;   Show every step of the computation. Confirm them with DrRacket’s stepper.
;

(define-struct centry [name home office cell])

(define-struct phone [area number])

(define-struct entry [name phone email])

; Test

(phone-area (centry-office (make-centry "Shriram Fisler"
             (make-phone 207 "363-2421")
             (make-phone 101 "776-1099")
             (make-phone 208 "112-9981"))))

(define Shriram_Fisler (make-centry "Shriram Fisler"
             (make-phone 207 "363-2421")
             (make-phone 101 "776-1099")
             (make-phone 208 "112-9981")))

(define office_phone (centry-office Shriram_Fisler))
(phone-area office_phone)

(define a_posn (make-posn 7 0))
(define pl (make-entry "Sarah Lee" "666-7771" "lee@gmail.com"))

(check-expect (posn? a_posn) #true)
(check-expect (posn? 42) #false)
(check-expect (posn? (make-posn 3 4)) #true)

(check-expect (entry? pl) #true)
(check-expect (entry? 42) #false)
(check-expect (entry? #true) #false)

