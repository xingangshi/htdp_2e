;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-11_04-generate_functions_v2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;
;

; a Polygon is one of:
;
; - (list Posn Posn Posn)
; - (cons Posn Polygon)

; a Polygon is one of:
;
; - (cons Posn (cons Posn (cons Posn '())))
; - (cons Posn Polygon)

(require 2htdp/image)
(require 2htdp/universe)

(define MT (empty-scene 50 50))


(define (render_poly p)
  (render_line (connect_dots p) (first p) (last p)))

(define (render_line im p q) 
  (scene+line  
   im (posn-x p) (posn-y p) (posn-x q) (posn-y q) "red"))
  
(define (connect_dots p) 
  (cond    [(empty? (rest p)) MT]
           [else 
            (render_line  
             (connect_dots (rest p)) (first p) (second p))]))

(define (last p) 
  (cond  
    [(empty? (rest (rest (rest p)))) (third p)] 
    [else (last (rest p))]))

; Test
(last (list (make-posn 10 10) (make-posn 20 10) (make-posn 30 10)))
(check-expect (last (list (make-posn 10 10)
                          (make-posn 20 10)
                          (make-posn 30 10))) (make-posn 30 10))


(check-expect  (render_poly   
                (list (make-posn 20 0) 
                      (make-posn 10 10)
                      (make-posn 30 10))) 
               (scene+line (scene+line   
                               (scene+line MT 20 0 10 10 "red")
                                               10 10 30 10 "red")   
                              30 10 20 0 "red"))

(check-expect  (render_poly   
                (list (make-posn 10 10) (make-posn 20 10) 
                      (make-posn 20 20) (make-posn 10 20))) 
               (scene+line   
                (scene+line  
                 (scene+line   
                  (scene+line MT 10 10 20 10 "red")    
                  20 10 20 20 "red")      20 20 10 20 "red")  
                10 20 10 10 "red"))
 