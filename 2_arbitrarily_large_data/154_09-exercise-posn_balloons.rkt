;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 154_09-exercise-posn_balloons) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 154:
;
;   Design two functions: col and row.
;
;   The function col consumes a natural number n and an image img. It produces a column— a vertical arrangement— of n
;   copies of img.
;
;   The function row consumes a natural number n and an image img. It produces a row— a horizontal arrangement— of n
;   copies of img.

(require 2htdp/image)

(define (col n img)
  (cond
    [(zero? n) (empty-scene 0 0)]
    [(positive? n) (above img (col (sub1 n) img))]))

(define (row n img)
  (cond
    [(zero? n) (empty-scene 0 0)]
    [(positive? n) (beside img (row (sub1 n) img))]))

(define (grid c r)
  (cond
    [(zero? r) (empty-scene 0 0)]
    [(positive? r)
     (above (row c (square 10 "outline" "black"))
            (grid c (sub1 r) ))]))

(define bg (grid 15 20))

bg

(define (add_balloons posn_list)
  (cond
    [(empty? (rest posn_list)) (place-image/align
                                              (circle 5 "solid" "red")
                                              (* (posn-x (first posn_list)) 10)
                                              (* (posn-y (first posn_list)) 10)
                                               "center" "center"
                                              bg)]
    [else (place-image/align
             (circle 5 "solid" "red")
             (* (posn-x (first posn_list)) 10)
             (* (posn-y (first posn_list)) 10)
              "center" "center"
             (add_balloons (rest posn_list)))
          ]))
                                               

; Test
(check-expect (col 3 (square 10 "outline" "black"))
              (above (square 10 "outline" "black")
                     (square 10 "outline" "black")
                     (square 10 "outline" "black")))

(check-expect (row 3 (square 10 "outline" "black"))
              (beside (square 10 "outline" "black")
                      (square 10 "outline" "black")
                      (square 10 "outline" "black")))

(add_balloons (cons (make-posn 0 0) '()))
(add_balloons (cons (make-posn 3 3) (cons (make-posn 9 3) '())))

(add_balloons (cons (make-posn 0 0)
                    (cons (make-posn 1 2)
                          (cons (make-posn 2 4)
                                (cons (make-posn 3 6)
                                      (cons (make-posn 4 8)
                                             (cons (make-posn 5 10)
                                                    (cons (make-posn 6 12)
                                                       
                                      '()))))))))

