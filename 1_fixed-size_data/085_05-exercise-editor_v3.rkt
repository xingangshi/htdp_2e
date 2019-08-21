;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 085_05-exercise-editor_v3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 85:
;
;  Define the function run. It consumes a string— the pre field of an editor— and
;  then launches an interactive editor, using render and edit from the preceding
;  two exercises for the to-draw and on-key clauses.

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

(define (render editor)
  (place-image/align
   (beside (text (editor-pre editor) font_size font_color)
           Cursor
           (text (editor-post editor) font_size font_color))
   0 y_center
   "left" "center"
   Filed))

(define (edit ed ke)
  (cond
    [(string=? ke "left")    (move_left  ed)]
    [(string=? ke "right")   (move_right ed)]
    [(=(string-length ke) 1) (process_key ed ke)]
    [else ed]))

(define (move_left ed)
  (cond
    [(string=? "" (editor-pre ed)) ed]
    [ else (make-editor (string_remove_last (editor-pre ed)) 
                        (string-append (string_last (editor-pre ed)) 
                                       (editor-post ed)))]))

(define (move_right ed)
  (cond
    [(string=? "" (editor-post ed)) ed]
    [else (make-editor (string-append (editor-pre ed) 
                                      (string_first (editor-post ed)))
                       (string_rest (editor-post ed)))]))

(define (process_key ed ke) 
  (cond
    [(string=? "\b" ke)     (backspace ed)]
    [(or (string=? "\t" ke) (string=? "\r" ke)) ed]
    [(> (string-length ke) 1) ed]
    [else (make-editor (string-append (editor-pre ed) ke)
                       (editor-post ed))]))


(define (backspace ed)
  (cond
   [(string=? "" (editor-pre ed)) ed]
   [ else  (make-editor (string_remove_last (editor-pre ed))
                        (editor-post ed))]))

(define (string_first str)
  (string-ith str 0))

(define (string_last str)
  (string-ith str (- (string-length str) 1)))

(define (string_rest str)
  (substring str 1 (string-length str)))

(define (string_remove_last str) 
  (substring str 0 (- (string-length str) 1)))

; Test
(check-expect (edit (make-editor "hel" "lo") "left")
              (make-editor "he" "llo"))
(check-expect (edit (make-editor "hel" "lo") "right")
              (make-editor "hell" "o"))
(check-expect (edit (make-editor "hel" "o") "l")
              (make-editor "hell" "o"))
(check-expect (edit (make-editor "hello" "world") "up")
              (make-editor "hello" "world"))

(check-expect (move_left (make-editor "hello" ""))
              (make-editor "hell" "o"))
(check-expect (move_left (make-editor "" "hello"))
              (make-editor "" "hello"))


(check-expect (move_right (make-editor "hello" ""))
              (make-editor "hello" ""))
(check-expect (move_right (make-editor "hell" "o"))
              (make-editor "hello" ""))
(check-expect (move_right (make-editor "hello" "world"))
              (make-editor "hellow" "orld"))

(check-expect (process_key (make-editor "hell" "o") "\b")
              (make-editor "hel" "o"))
(check-expect (process_key (make-editor "hell" "o") "\t")
              (make-editor "hell" "o"))
(check-expect (process_key (make-editor "hell" "o") "\r")
              (make-editor "hell" "o"))
(check-expect (process_key (make-editor "hell" "o") "up")
              (make-editor "hell" "o"))
(check-expect (process_key (make-editor "hello wo" "") "r")
              (make-editor "hello wor" ""))
(check-expect (process_key (make-editor "hell" "world") "o")
              (make-editor "hello" "world"))

(check-expect (backspace (make-editor "hell" "o"))
              (make-editor  "hel" "o"))
(check-expect (backspace (make-editor "" "hello"))
              (make-editor "" "hello"))

(check-expect (string_first "hello") "h")
(check-expect (string_last "hello") "o")
(check-expect (string_rest "hello") "ello")
(check-expect (string_remove_last "hello") "hell")

(render (make-editor "hello " "world"))

(check-expect (render (make-editor "hello " "world"))
              (overlay/align "left" "center"
                             (beside (text "hello " font_size font_color)
                                     Cursor
                                     (text "world" font_size font_color))
                             Filed))

; Editor -> Editor
; starts an editor
(define (main eds)
  (big-bang eds
            [to-draw render]
            [on-key  edit]))


; String -> Editor
; accepts a string and starts an editor
(define (run s)
  (main (make-editor s "")))

(run "")