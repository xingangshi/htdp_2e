;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 174_10-exercise-encode_file) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
 ; Exercise 174:
;
;  Design a program that encodes text files numerically. Each letter in a word should be encoded as a numeric
;  three-letter string with a value between 0 and 256. Here is our encoding function for letters:
;
;  Before you start, explain this function. Also recall how a string can be converted into a list of 1Strings.
;  Again, use read-words/line to preserve the organization of the file into lines and words.
;

; 1String -> String
; converts the given 1string into a three-letter numeric string

; 1String -> String
; auxiliary for stating tests

(require 2htdp/batch-io)

(define (code_1 c)
  (number->string (string->int c)))

(define (encode_letter s)
  (cond
    [(< (string->int s) 10) (string-append "00" (code_1 s))]
    [(< (string->int s) 100) (string-append "0" (code_1 s))]
    [else (code_1 s)]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (encode_file fn)
  (encode_lls (read-words/line fn)))

(define (encode_lls lls)
  (cond
    [(empty? lls) ""]
    [(cons? lls)
     (string-append (encode_los (first lls)) "\n"
                                (cond
                                  [(empty? (rest lls)) ""]
                                  [else (encode_lls (rest lls))]))]))


(define (encode_los los)
  (cond
    [(empty? los) ""]
    [(cons? los)
     (cond
       [(empty? (rest los)) (encode_loc (explode (first los)))]
       [else (string-append (encode_loc (explode (first los)))
                            " "
                            (encode_los (rest los)))])]))


(define (encode_loc loc)
  (cond
    [(empty? loc) ""]
    [(cons?  loc)
     (string-append (encode_letter (first loc))
                    (encode_loc (rest loc)))]))


; Test
(check-expect (encode_letter "\t") (string-append "00" (code_1 "\t")))
(check-expect (encode_letter "a")  (string-append "0" (code_1 "a")))
(check-expect (encode_letter "z")  (code_1 "z"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define los1 (cons "the"(cons "cat" '())))
(define los2 (cons "in"(cons "the" (cons "hat" '()))))
(define lls1 (cons los1 (cons los2 '())))

(check-expect (encode_lls lls1)
              "116104101 099097116\n105110 116104101 104097116\n")

(check-expect (encode_los (cons "the"(cons "cat" '())))
              (string-append (encode_letter "t")
                             (encode_letter "h")
                             (encode_letter "e")
                             " "
                             (encode_letter "c")
                             (encode_letter "a")
                             (encode_letter "t")))

(check-expect (encode_loc (explode "cat"))
              (string-append (encode_letter "c")
                             (encode_letter "a")
                             (encode_letter "t")))


(encode_file "./temp_files/ttt.txt")
