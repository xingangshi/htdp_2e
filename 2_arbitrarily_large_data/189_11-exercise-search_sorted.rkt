;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 189_11-exercise-search_sorted) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 189:
;
; Here is the function search:
;
; it determines whether some number occurs in a list of numbers. The function may have to
; traverse the entire list to find out that the number of interest isn’t contained in the list.
;
; Develop the function search-sorted, which determines whether a number occurs in a sorted list
; of numbers. The function must take advantage of the fact that the list is sorted.
;

; Number List-of-numbers -> Boolean
(define (search n alon)
  (cond
    [(empty? alon) #false]
    [else (or (= (first alon) n) (search n (rest alon)))]))


(define (search_sorted n lon)
  (cond [(empty? lon) #false]
        [(< (first lon) n) #false]
        [else (or (= n (first lon)) (search_sorted n (rest lon)))]))

; Test
(check-expect (search_sorted 1 '())             #false)
(check-expect (search_sorted 1 (list 0 -1))     #false)
(check-expect (search_sorted 1 (list 2 1 0 -1)) #true)
(check-expect (search_sorted 3 (list 3 2 1))    #true)
