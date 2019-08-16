;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-02_05-file_opt) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/batch-io)

(define root_path "./temp_files/")


(define (file_with_path file_name)
  (string-append root_path file_name))

(define file_name (file_with_path "sample.dat"))

(write-file file_name "212")

(read-file file_name)

(write-file 'stdout "212\n")


(define (f2c f)
  (* 5/9 (- f 32)))


(define (convert in out)
  (write-file out
              (string-append
               (number->string
                (f2c
                 (string->number
                  (read-file in))))
               "\n")))

(write-file file_name "212")

(convert file_name 'stdout)

(define out_file_name (file_with_path "out.dat"))

(convert file_name out_file_name)

(read-file out_file_name)