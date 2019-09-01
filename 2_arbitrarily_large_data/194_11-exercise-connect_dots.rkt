;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 194_11-exercise-connect_dots) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 194:
;
; Modify connect-dots so that it consumes an additional Posn structure to which the last Posn is
; connected. Then modify render-poly to use this new version of connect-dots. Note This new
; version is called an accumulator version.
;

(require 2htdp/image)
(define MT (empty-scene 50 50)) 

; Polygon -> Image
; renders the given polygon p into MT
(define (render_poly p)
  (connect_dots p (first p)))


; NELoP -> Image
; connects the dots in the given list of Posns
(define (connect_dots p ap) 
  (cond    
    [(empty? (rest p)) (render_line MT (first p) ap)]
    [else (render_line (connect_dots (rest p) ap) (first p) (second p))]))


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

(render_poly (list (make-posn 10 10) (make-posn 20 10) 
                   (make-posn 20 20) (make-posn 10 20))) 

(connect_dots  (list (make-posn 10 10) (make-posn 20 10) 
                     (make-posn 20 20) (make-posn 15 30))
                (make-posn 10 20))

(last (list (make-posn 10 10)
                          (make-posn 20 10)
                          (make-posn 20 20)
                          (make-posn 10 20)))