;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 155_09-exercise-russian_colors) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 155:
;
;   Design the function colors. It consumes a Russian doll and produces a string of all colors, separate by a
;   comma and a space. Thus our example should produce
;
;     "yellow, green, red"

(define-struct layer [color doll])

 (define (colors an-rd) 
  (cond    [(string? an-rd) an-rd]  
           [(layer? an-rd) (string-append (layer-color an-rd) ", "
                                          (colors (layer-doll an-rd)))]))

; Test
(colors "red")
(check-expect (colors "red") "red")


(colors (make-layer "yellow" (make-layer "green" "red")))

(check-expect (colors (make-layer "yellow" (make-layer "green" "red"))) 
              "yellow, green, red")


