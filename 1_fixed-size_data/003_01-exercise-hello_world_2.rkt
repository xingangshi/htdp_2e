;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1_3_exe-new_hello) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define str "helloworld")
(define i 5)

(define (split_from_index str index)
  (string-append (substring str 0 index) "_" (substring str (- (string-length str) index) (string-length str))))

(split_from_index str i)