;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-05_04_01-struct_of_entry_infol) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct entry_info [name phone email])


; use struct
(define pl (make-entry_info "Sarah Lee" "666-7771" "lee@classy-university.edu"))

(define bh (make-entry_info "Tara Harper" "666-7770" "harper@small-college.edu"))


; get struct menber
(entry_info-email pl)
(entry_info-phone bh)