;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 193_11-exercise-rener_ploy_v1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 193:
;
; Here are two more ideas for defining render-poly:
;
; 1. render-poly could cons the last item of p onto p and then call connect-dots.
; 2. render-poly could add the first item of p to the end of p via a version of add-at-end that works on Polygons.
;
; Use both ideas to define render-poly; make sure both definitions pass the test cases.
;

(require 2htdp/image)
(define MT (empty-scene 50 50)) 


(define (render_poly_v0 p)  
  (render_line (connect_dots p) (first p) (last p)))

; add last position as first position and connect all dots
(define (render_poly_v1 p)
  (connect_dots (cons (last p) p)))

; add first position as last position and connect all dots
; (requires a helper function)
(define (render_poly p)
  (connect_dots (add_at_end p (first p))))

; Polygon Posn -> NELoP
; add a position to the end of a polygon
(define (add_at_end nelop p) 
  (cond    [(empty? nelop) (cons p '())]  
           [else (cons (first nelop) (add_at_end (rest nelop) p))]))


; Image NELoP -> Image
; connects the Posns in p in an image
(define (connect_dots p) 
  (cond
    [(empty? (rest p)) MT]
    [else (render_line  (connect_dots (rest p)) (first p) (second p))]))

; Image Posn Posn -> Image 
; renders a line from p to q into im
(define (render_line im p q) 
  (scene+line  
   im (posn-x p) (posn-y p) (posn-x q) (posn-y q) "red"))
 
; Polygon -> Posn
; extracts the last item from p
(define (last p) 
  (cond  
    [(empty? (rest (rest (rest p)))) (third p)] 
    [else (last (rest p))]))

; Test
(define list_new (list (make-posn 10 10) (make-posn 20 10) 
                    (make-posn 20 20) (make-posn 10 20)))

(render_poly     list_new)
(render_poly_v0  list_new) 
(render_poly_v1  list_new) 

(connect_dots list_new) 

(check-expect (last (list (make-posn 10 10)
                          (make-posn 20 10)
                          (make-posn 30 10))) (make-posn 30 10))

(check-expect (last list_new)(make-posn 10 20))