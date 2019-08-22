;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 105_06-exercise-zoo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 105:
;
;    Develop a data representation for the following four kinds of zoo animals:
;
;      - spiders, whose relevant attributes are the number of remaining legs (we assume that spiders can lose legs in accidents) and the space they need in case of transport;
;      - elephants, whose only attributes are the space they need in case of transport; boa constrictor, whose attributes include length and girth; and
;      - armadillo, for whom you must determine appropriate attributes; they need to include attributes that determine space needed for transportation.
;
;    Develop a template for functions that consume representations of zoo animals.
;    Design the function fits?. The function consumes a zoo animal and the volume of a cage. It determines whether the cage is large enough for the animal.
;

(define-struct name [first last])
; is (make-name String String)
; interpreation: the first and last name of an individual person
;
;  ( ... (name-first n) ... (name-last n) ... )

(define-struct student [name gpa])
; is (make-student Name Number)
; interpretation: the students name and gpa(grade point average.)
;
;  ( ... (student-name s) ... (student-gpa s) ... )

(define-struct professor [name tenure])
; is (make-professor Name String)
; interpretation: a sprofessors name and tenure status
;
;  ( ... (professor-name p) ... (professor-tenure p) ... )

(define-struct staff [name group])
; is (make-staff Name String)
; interpretation: a staff person's name and salary group
;
;   ( ... (staff-name s) ... (staff-group s) ... )