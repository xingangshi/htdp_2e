;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1_4-exercise-hello_world_3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define str "hello_wolrd")
(define i 6)

(define (sub_string string index)
  (string-append (substring string 0 (- index 1)) (substring string (- (+ (string-length string) 1) index) (string-length string))))

(sub_string str i)