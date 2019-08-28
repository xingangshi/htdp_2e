;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 179_10-exercise-create_editor_v2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 179:
;
;  Design the functions
;
;   ; Editor -> Editor 
;   ; moves the cursor position one 1String left, if possible
;   (define (editor-lft ed)
;      ed)
;
;   ; Editor -> Editor
;   ; moves the cursor position one 1String right, if possible
;   (define (editor-rgt ed)
;      ed)
;
;   ; Editor -> Editor
;   ; deletes one 1String to the left of the cursor, if possible
;   (define (editor-del ed)
;     ed)
;
;  Again, it is critical that you work through a good range of examples.

(require 2htdp/image)
(require 2htdp/universe)
(require 2htdp/batch-io)

(define HEIGHT 20)          ; the height of the editor 
(define WIDTH 200)          ; its width 
(define FONT-SIZE 16)       ; the font size 
(define FONT-COLOR "black") ; the font color

(define MT (empty-scene WIDTH HEIGHT))
(define CURSOR (rectangle 1 HEIGHT "solid" "red"))

(define-struct editor [pre post])

(define (create_editor s1 s2)
  (make-editor (reverse (explode s1)) (explode s2)))

(define (editor_render e)  MT)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (editor_kh ed k)  
  (cond   
    [(key=? k "left")  (editor_lft ed)] 
    [(key=? k "right") (editor_rgt ed)] 
    [(key=? k "\b")    (editor_del ed)]  
    [(key=? k "\t")    ed]                
    [(key=? k "\r")    ed]   
    [(= (string-length k) 1) (editor_ins ed k)]  
    [else ed]))

(define (editor_lft ed) 
  (cond [(empty? (editor-pre ed))
         (make-editor '() (editor-post ed))]
        [else (make-editor  (rest (editor-pre ed))
                            (cons (first (editor-pre ed)) (editor-post ed)))]))

(define (editor_rgt ed) 
  (cond [(empty? (editor-post ed)) ed]
        [(empty? (editor-pre ed))
         (make-editor (cons (first (editor-post ed)) '())
                      (rest (editor-post ed)))]
        [else (make-editor (cons (first (editor-post ed)) 
                                 (editor-pre ed))
               (rest (editor-post ed)))]))


(define (editor_del ed) 
  (cond [(empty? (editor-pre ed)) ed]
        [else (make-editor (rest (editor-pre ed)) (editor-post ed))]))

(define (editor_ins ed k)  
  (make-editor (cons k (editor-pre ed)) (editor-post ed)))


(define (main s)  
  (big-bang (create_editor s "goodddd")      
            (on-key        editor_kh)         
            (to-draw       editor_render)))


; main : String -> Editor
; launches the editor given some initial string
(main "all")