;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 086_05-exercise-editor_v4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 86:
;
;  Notice that if you type a lot, your editor program does not display all
;  of the text. Instead the text is cut off at the right margin. Modify your
;  function edit from exercise 84 so that it ignores a keystroke if adding
;  it to the end of the pre field would mean the rendered text is too wide for your canvas.


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

(define (edit_new ed ke) 
  (cond
    [(string=? ke "left")     (move_left  ed)]
    [(string=? ke "right")    (move_right ed)]
    [(= (string-length ke) 1) 
     (if (length_ok ed) (process_key_new ed ke) ed)]
    [else ed]))


; Editor -> Boolean
; returns true if adding a character will not exceed field width
(define (length_ok ed)
  (> width
     (image-width (text (string-append (editor-pre ed) (editor-post ed) "  ")
                        font_size font_color))))

(define (process_key_new ed ke) 
  (cond
    [(string=? "\b" ke)     (backspace ed)]
    [(or (string=? "\t" ke) 
         (string=? "\r" ke)
         (string=? "\u007F" ke)) ed]  ; tab, return and delete keys
    [(> (string-length ke) 1) ed]
    [else 
     (make-editor (string-append (editor-pre ed) ke)
                                 (editor-post ed))]))

; Test
(check-expect (edit_new (make-editor "hel" "lo") "left")
              (make-editor "he" "llo"))
(check-expect (edit_new (make-editor "hel" "lo") "right")
              (make-editor "hell" "o"))
(check-expect (edit_new (make-editor "hel" "o") "l")
              (make-editor "hell" "o"))
(check-expect (edit_new (make-editor "hello" "world") "up")
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

(check-expect (process_key_new (make-editor "hell" "o") "\b")
              (make-editor "hel" "o"))
(check-expect (process_key_new (make-editor "hell" "o") "\t")
              (make-editor "hell" "o"))
(check-expect (process_key_new (make-editor "hell" "o") "\r")
              (make-editor "hell" "o"))
(check-expect (process_key_new (make-editor "hell" "o")  "\u007F")
              (make-editor "hell" "o"))              
(check-expect (process_key_new (make-editor "hell" "o") "up")
              (make-editor "hell" "o"))
(check-expect (process_key_new (make-editor "hello wo" "") "r")
              (make-editor "hello wor" ""))
(check-expect (process_key_new (make-editor "hell" "world") "o")
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
            [on-key  edit_new]))


; String -> Editor
; accepts a string and starts an editor
(define (run s)
  (main (make-editor s "")))

(run "")