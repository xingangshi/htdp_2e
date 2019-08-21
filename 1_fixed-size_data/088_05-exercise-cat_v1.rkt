;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 088_05-exercise-cat_v1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 88:
;
;  Define a structure type that keeps track of the cat’s x-coordinate
;  and its happiness. Then formulate a data definition for cats, dubbed
;  VCat, including an interpretation with respect to a combined world.

(define-struct vcat [xpos hnum])
; VCat = (make-vcat Number Number)
;
; Interpretation:
;
;   (make-vcat xpos hnums)
;
; means the cat graphic is positioned at xpos along the x-axis and  that
; it's happiness guage is positioned between 0 and 100, at the point indicated by hnum.
;