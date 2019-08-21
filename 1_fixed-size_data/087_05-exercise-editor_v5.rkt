;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 087_05-exercise-editor_v5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 87:
;
;  Develop a data representation based on our first idea, using
;  a string and an index. Then solve exercises exercise 83 through exercise 86 again.


(require 2htdp/image)
(require 2htdp/universe)

(define width      200)
(define height     20)
(define y_center   (/ height 2))
(define font_size  16)
(define font_color "black")

(define Filed  (empty-scene width height))
(define Cursor (rectangle 1 height "solid" "red"))

(define-struct editor [text index])
; Editor = (make-editor String Number)
;
; Interpetation:
;
;   (make-editor text index)
;
; means the text in the editor is displayed with a cursor positioned at the given index
;

(define (move_left_new editor) 
  (if  (= (editor-index editor) 0)
        editor
       (make-editor (editor-text editor) (- (editor-index editor) 1))))

(define (move_right_new editor)
    (if (< (editor-index editor) (string-length (editor-text editor)))
      (make-editor (editor-text editor) (+ (editor-index editor) 1))
      editor))

(define (backspace_new editor) 
  (cond
    [(= 0 (editor-index editor)) editor]
    [else 
     (make-editor 
      (string-append (string_remove_last 
                       (substring (editor-text editor) 0 (editor-index editor)))
                     (substring (editor-text editor) (editor-index editor)
                                (string-length (editor-text editor))))
                  (- (editor-index editor) 1))]))

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
    [(string=? ke "left")     (move_left_new  ed)]
    [(string=? ke "right")    (move_right_new ed)]
    [(= (string-length ke) 1) 
     (if (length_ok_new ed) (process_key_new ed ke) ed)]
    [else ed]))

; Editor -> Boolean
; returns true if adding a character will not exceed field width
(define (length_ok_new ed)
  (> width
     (image-width (text (string-append (editor-text ed) "  ")
                        font_size font_color))))

(define (process_key_new ed ke) 
  (cond
    [(string=? "\b" ke)     (backspace_new ed)]
    [(or (string=? "\t" ke)
         (string=? "\r" ke)
         (string=? "\u007F" ke)) ed] ; tab, return and delete keys
    [(> (string-length ke) 1) ed]
    [else
     (make-editor (string-append 
                   (substring (editor-text ed) 0 (editor-index ed))
                   ke 
                   (substring (editor-text ed) (editor-index ed)
                              (string-length (editor-text ed))))
                  (+ 1 (editor-index ed)))]))

(define (pre_text editor)
  (text (substring (editor-text editor) 0 (editor-index editor)) font_size font_color))

(define (post_text editor)
  (text (substring (editor-text editor) 
                   (editor-index editor) 
                   (string-length (editor-text editor))) 
        font_size font_color))

(define (render_new editor)
  (place-image/align
   (beside (pre_text editor)
           Cursor
           (post_text editor))
   0 y_center
   "left" "center"
   Filed))

; Test
(check-expect (edit_new (make-editor "hello" 3) "left")
              (make-editor "hello" 2))
(check-expect (edit_new (make-editor "hello" 3) "right")
              (make-editor "hello" 4))
(check-expect (edit_new (make-editor "tomorrow is another day, not!" 5) "a")
              (make-editor "tomorrow is another day, not!" 5))
(check-expect (edit_new (make-editor "hello" 5) "!")
              (make-editor "hello!" 6))


(check-expect (move_left_new (make-editor "hello" 0))
              (make-editor "hello" 0))
(check-expect (move_left_new (make-editor "hello" 3))
              (make-editor "hello" 2))


(check-expect (move_right_new (make-editor "hello" 4))
              (make-editor "hello" 5))
(check-expect (move_right_new (make-editor "hello" 3))
              (make-editor "hello" 4))

(check-expect (process_key_new (make-editor "helllo" 3) "\b")
              (make-editor "hello" 2))
(check-expect (process_key_new (make-editor "hello" 3)  "\u007F")
              (make-editor "hello" 3))
(check-expect (process_key_new (make-editor "hello" 3) "\t")
              (make-editor "hello" 3))
(check-expect (process_key_new (make-editor "hello" 3) "\r")
              (make-editor "hello" 3))
(check-expect (process_key_new (make-editor "hello" 3) "up")
              (make-editor "hello" 3))
(check-expect (process_key_new (make-editor "helo" 3) "l")
              (make-editor "hello" 4))

(check-expect (backspace_new (make-editor "hello" 3))
              (make-editor "helo" 2))
(check-expect (backspace_new (make-editor "hello" 0))
              (make-editor "hello" 0))

(check-expect (string_first "hello") "h")
(check-expect (string_last "hello") "o")
(check-expect (string_rest "hello") "ello")
(check-expect (string_remove_last "hello") "hell")

(check-expect (render_new (make-editor "hello world" 6))
              (overlay/align "left" "center"
                             (beside (text "hello " font_size font_color)
                                     Cursor
                                     (text "world" font_size font_color))
                             Filed))

; Editor -> Editor
; starts an editor
(define (main eds)
  (big-bang eds
            [to-draw render_new]
            [on-key  edit_new]))


; String -> Editor
; accepts a string and starts an editor
(define (run s)
  (main (make-editor s 0)))

(run "")