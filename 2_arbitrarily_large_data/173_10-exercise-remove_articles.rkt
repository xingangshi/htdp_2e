;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 173_10-exercise-remove_articles) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 173:
;
; Design a program that removes all articles from a text file. The program consumes the name n of a file,
; reads the file, removes the articles, and writes the result out to a file whose name is the result of concatenating "noarticles-"
; with n. For this exercise, an article is one of the following three words: "a", "an", and "the".
;
; Use read-words/line so that the transformation retains the organization of the original text into lines and words. When
; the program is designed, run it on the Piet Hein poem.
; (require 2htdp/batch-io)

(require 2htdp/batch-io)

(define (no_articles fn)
  (write-file (string-append "no-articles-" fn)
              (remove_articles_from_lls (read-words/line fn))))

; LLS -> LLS
; remove the articles "a", "an", "the" from all strings in the given LLS            
(define (remove_articles_from_lls lls) 
  (cond [(empty? lls) ""]
        [(cons?  lls)
         (string-append (remove_articles_from_los (first lls)) "\n"
                        (cond [(empty? (rest lls)) ""]
                              [else (remove_articles_from_lls (rest lls))]))]))
         
; LOS -> LOS
; remove the articles "a", "an", "the" from a list of strings
(define (remove_articles_from_los los)
  (cond [(empty? los) ""]
        [(cons?  los)
         (cond [(is_article? (first los)) 
                (remove_articles_from_los (rest los))]
               [else (string-append (first los) " "
                           (remove_articles_from_los (rest los)))])]))

; String -> Boolean
; return true if the string is one of "a", "an" or "the"      
(define (is_article? str)
  (or (string=? "a"   str)
      (string=? "an"  str)
      (string=? "the" str)))


; Test
(define los_1 (cons "the"(cons "man"(cons "in" (cons "the" (cons "moon" '()))))))
(define los_2 (cons "a"(cons "cat" '())))
(define los_3 (cons "an" '()))
(define lls_1 (cons los_1 (cons los_2 (cons los_3 '()))))

(define los_4 (cons "man" (cons "in" (cons "moon" '()))))
(define los_5 (cons "cat" '()))

;
(check-expect (remove_articles_from_los 
               (cons "a"(cons "bad" (cons "apple" '()))))
              "bad apple ")

(check-expect (remove_articles_from_lls lls_1)
              "man in moon \ncat \n\n")

(check-expect (remove_articles_from_lls '()) "")

(check-expect (is_article? "a")   true)
(check-expect (is_article? "an")  true)
(check-expect (is_article? "the") true)
(check-expect (is_article? "yes") false)