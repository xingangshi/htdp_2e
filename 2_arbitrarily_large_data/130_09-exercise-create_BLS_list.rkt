;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 130_09-exercise-create_BLS_list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 130:
;
;   Create BSL lists that represent
;     1. a list of celestial bodies, say, at least all the planets in our solar system;
;     2. a list of items for a meal, for example, steak, french fries, beans, bread, water, Brie cheese, and ice cream; and
;     3. a list of colors.
;
;   Sketch some box representations of these lists, similar to those in figures 44 and 45. Which of the sketches do you like better? 


(cons "sun"
      (cons "moon"
            (cons "mercury"
                  (cons "venus"
                        (cons "mars"
                              (cons "jupiter"
                                    (cons "sature"
                                          (cons "uranus"
                                                (cons "nepture"
                                                      (cons "pluto"
                                                            '()))))))))))

(cons "steak"
      (cons "french fries"
            (cons "beans"
                  (cons "bread"
                        (cons "water"
                              (cons "Brie cheese"
                                    (cons "ice cream"
                                          '())))))))

(cons "red"
      (cons "blue"
            (cons "green"
                  (cons "yellow"
                        (cons "violet"
                              (cons "cyan"
                                    '()))))))
                              

