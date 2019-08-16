;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 01_05-example-booleans) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(and #true #false)
(and #true #true)
(and #false #true)
(and #false #false)

 
(or  #true #false)
(or  #false #true)
(or  #true #true)
(or  #false #false)

(not #true)
(not #false)