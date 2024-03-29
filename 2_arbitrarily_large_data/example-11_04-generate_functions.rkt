;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname example-11_04-generate_functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;
;

(list (make-posn 10 10)
      (make-posn 60 60)
      (make-posn 10 60))


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
  (cond    
    [(empty? (rest (rest (rest p))))
     (render_line 
      (render_line  
       (render_line MT (first p) (second p)) 
       (second p) (third p)) (third p) (first p))]
    [else 
     (render_line      
      (render_poly (rest p)) (first p) (second p))]))


(define (render_line im p q) 
  (scene+line
   im (posn-x p) (posn-y p) (posn-x q) (posn-y q) "red"))

; Test
MT

(render_poly  (list (make-posn 20 0)
                     (make-posn 10 10)
                     (make-posn 30 10)))

(check-expect (render_poly
               (list (make-posn 20 0)
                     (make-posn 10 10)
                     (make-posn 30 10)))
              (scene+line
               (scene+line
                (scene+line MT 20 0 10 10 "red")
                10 10 30 10 "red") 30 10 20 0 "red"))


(render_poly  (list (make-posn 10 10) (make-posn 20 10) 
                    (make-posn 20 20) (make-posn 10 20))) 

(check-expect  (render_poly   
                (list (make-posn 10 10) (make-posn 20 10) 
                      (make-posn 20 20) (make-posn 10 20))) 
               (scene+line   
                (scene+line  
                 (scene+line   
                  (scene+line MT 10 10 20 10 "red")
                  20 10 20 20 "red")
                 20 20 10 20 "red")
                10 20 20 10 "red"))
