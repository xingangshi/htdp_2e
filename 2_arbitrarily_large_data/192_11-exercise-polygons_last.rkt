;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 192_11-exercise-polygons_last) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 192:
;
; Argue why it is acceptable to use last on Polygons. Also argue why you may reuse the template for connect-dots for last:
;
; Finally, develop examples for last, turn them into tests, and ensure that the definition of last in figure 50 works on your examples.
;


(require 2htdp/image)


(define MT (empty-scene 50 50)) 

; Image Polygon -> Image 
; adds an image of p to MT
(define (render_polygon img p)
  (render_line (connect_dots img p) (first p) (last p)))
 
; Image NELoP -> Image
; connects the Posns in p in an image
(define (connect_dots img p)
  (cond
    [(empty? (rest p)) MT]
    [else (render_line (connect_dots img (rest p))
                       (first p)
                       (second p))]))
 
; Image Posn Posn -> Image 
; draws a red line from Posn p to Posn q into im
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
(render_polygon MT (list (make-posn 20 0)
                          (make-posn 10 10)
                          (make-posn 30 10)))

(connect_dots  MT (list (make-posn 10 10) (make-posn 20 10)
                        (make-posn 20 20) (make-posn 10 20)))

(check-expect (last (list (make-posn 10 10)
                          (make-posn 20 10)
                          (make-posn 30 10))) (make-posn 30 10))

(check-expect (last (list (make-posn 10 10)
                          (make-posn 20 10)
                          (make-posn 20 20)
                          (make-posn 10 20))) (make-posn 10 20))