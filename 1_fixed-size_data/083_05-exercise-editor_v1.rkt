;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 083_05-exercise-editor_v1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 83:
;
;  Design the function render, which consumes an Editor and produces an image.
;  The purpose of the function is to render the text within an empty scene of 200 x 20 pixels. For the cursor, use a 1 x 20 red rectangle and for the strings, black text of size 16.
;
;  Develop the image for a sample string in DrRacket’s interaction area. We started with this expression:
;
;  You may wish to read up on beside, above, and such functions. When you are happy with the looks of the image, use the
;  expression as a test and as a guide to the design of render.

(require 2htdp/image)
(require 2htdp/universe)

(define width      200)
(define height     20)
(define y_center   (/ height 2))
(define font_size  16)
(define font_color "black")

(define Filed  (empty-scene width height))
(define Cursor (rectangle 1 height "solid" "red"))

(define-struct editor [pre post])
; Editor = (make-editor String String)
;
; Interpetation:
;
;   (make-editor s t)
;
; means the text in the editor is (string-append s t) with the cursor display between s and t
;

(overlay/align "left" "center"
               (text "hello world" 16 "black")
               (empty-scene 200 20))

(define (render editor)
  (place-image/align
   (beside (text (editor-pre editor) font_size font_color)
           Cursor
           (text (editor-post editor) font_size font_color))
   0 y_center
   "left" "center"
   Filed))

(render (make-editor "hello " "world"))

(check-expect (render (make-editor "hello " "world"))
              (overlay/align "left" "center"
                             (beside (text "hello " font_size font_color)
                                     Cursor
                                     (text "world" font_size font_color))
                             Filed))