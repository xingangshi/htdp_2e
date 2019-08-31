;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 191_11-exercise-connect_dots) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 191:
;
; Adapt the second example for render-poly to connect-dots.
;

(require 2htdp/image)

(define MT (empty-scene 50 50)) 

(define (connect_dots p) 
  (cond    [(empty? (rest p)) MT]
           [else 
            (render_line  
             (connect_dots (rest p)) (first p) (second p))]))


(define (render_line im p q) 
  (scene+line  
   im (posn-x p) (posn-y p) (posn-x q) (posn-y q) "red"))


; Test
(connect_dots (list (make-posn 20 0)    
                                  (make-posn 10 10)   
                                  (make-posn 30 10)))

(check-expect (connect_dots (list (make-posn 20 0)    
                                  (make-posn 10 10)   
                                  (make-posn 30 10))) 
              (scene+line            
               (scene+line MT 20 0 10 10 "red")     
               10 10 30 10 "red"))

(connect_dots (list (make-posn 10 10) (make-posn 20 10) 
                      (make-posn 20 20) (make-posn 10 20))) 

(check-expect  (connect_dots 
                (list (make-posn 10 10) (make-posn 20 10) 
                      (make-posn 20 20) (make-posn 10 20))) 
               (scene+line
                (scene+line   
                 (scene+line MT 10 10 20 10 "red")
                 20 10 20 20 "red")
                20 20 10 20 "red"))

