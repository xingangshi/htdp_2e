;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 111_06-exercise-finite_state_machine) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 111:
;
;   Design a world program that recognizes a pattern in a sequence of KeyEvents. Specifically,
;   it must accept any sequence that starts with "a", is followed by an arbitrarily long mix
;   of "b" and "c", and ends in "d". As soon as it encounters this "d", the program stops running.
;   If these four keys are out of order or if any other key is hit, the program must also shut down.

(require 2htdp/image)
(require 2htdp/universe)

; -- Graphic Constants
(define WIDTH 100)
(define HEIGHT 100)
(define YELLOW (rectangle WIDTH HEIGHT "solid" "yellow"))
(define GREEN  (rectangle WIDTH HEIGHT "solid" "green"))
(define RED    (rectangle WIDTH HEIGHT "solid" "red"))
(define BG (empty-scene WIDTH HEIGHT))

; -- Structure
; ExpectsToSee is one of: 
; – AA
; – BC
; – DD 
; – ER  
(define AA "start, expect to see an 'a' next")
(define BC "expect to see: 'b', 'c', or 'd'")
(define DD "encountered a 'd', finished")
(define ER "error, user pressed illegal key")

(define-struct fsm [state img])
; An FSM is: (make-fsm String Image)
; where 'state' is one of ExpectsToSee and image is the
; coloured rectangle associated with the state

; -- Functions

; FSM -> Image
; display the state as a coloured rectangle
(check-expect (render (make-fsm AA BG)) (empty-scene WIDTH HEIGHT))
(check-expect (render (make-fsm BC YELLOW))
              (overlay/align "center" "center" YELLOW BG))

(define (render fsm)
  (overlay/align "center" "center" (fsm-img fsm) BG))

; FSM KeyEvent -> FSM
; change the state based on the key event
(check-expect (control (make-fsm AA BG) "k") (make-fsm AA BG))
(check-expect (control (make-fsm AA BG) "a") (make-fsm BC YELLOW))
(check-expect (control (make-fsm BC YELLOW) "b") (make-fsm BC YELLOW))
(check-expect (control (make-fsm BC YELLOW) "c") (make-fsm BC YELLOW))
(check-expect (control (make-fsm BC YELLOW) "d") (make-fsm DD GREEN))
(check-expect (control (make-fsm BC YELLOW) "f") (make-fsm ER RED))
(check-expect (control (make-fsm BC YELLOW) "a") (make-fsm ER RED))

(define (control fsm ke)
  (cond
    [(and (string=? "a" ke) (string=? (fsm-state fsm) AA))
     (make-fsm BC YELLOW)]
    [(and (or (string=? "b" ke) (string=? "c" ke)) 
          (string=? (fsm-state fsm) BC))
     fsm]
    [(and (string=? "d" ke) (string=? (fsm-state fsm) BC))
     (make-fsm DD GREEN)]
    [(string=? (fsm-state fsm) AA) fsm]
    [else (make-fsm ER RED)]))

; FSM -> Boolean
; if the state is DD or ER, we are done
(check-expect (done (make-fsm AA BG))     false)
(check-expect (done (make-fsm DD RED))    true)
(check-expect (done (make-fsm BC YELLOW)) false)
(check-expect (done (make-fsm ER RED))    true)

(define (done fsm)
  (if (or (string=? DD (fsm-state fsm)) (string=? ER (fsm-state fsm)))
      true  false))

; FSM -> FSM
; run a finite state machine
(define (main fsm)
  (big-bang fsm
            [to-draw   render]
            [on-key    control]
            [stop-when done]))

; usage example
(main (make-fsm AA BG))