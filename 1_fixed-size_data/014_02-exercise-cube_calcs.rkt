;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 014_02-exercise-cube_calcs) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define (cube_volume sider_lenght)(expt sider_lenght 3))
(define (cube_surface sider_lenght)(* 6 (expt sider_lenght 2)))

(cube_volume 2)
(cube_surface 2)