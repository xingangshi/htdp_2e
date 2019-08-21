;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 080_05-exercise-consume_instances) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 80: 
;
;  Create templates for functions that consume instances of the following structure types:
;
;  No, you do not need data definitions for this task.
;

(define-struct movie [title director year])

(define (release_new_movie moive)
  100)



(define-struct person [name hair eyes phone])

(define (new_student person)
  100)



(define-struct pet [name number])

(define (pet_info pet)
  100)


(define-struct CD [artist title price])

(define (buy_CD cd_info)
 100)


(define-struct sweater [material size color])

(define (make_sweater sweater)
  100)
