;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 116_06-exercise-checked_traffic_light) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise: 116
;
;   Revise light=? so that the error message specifies which of the two arguments aren’t elements of TrafficLight.


; Any -> Boolean
;
; is the given value an element of TrafficLight
(define (light? x)  
  (cond    
    [(string? x) 
     (or (string=? "red"    x) 
         (string=? "green"  x) 
         (string=? "yellow" x))]
    [else #false]))

; Any Any -> Boolean
;
; are the two values elements of TrafficLight and, if so, are they equal
(define (light=? a-value another-value) 
  (if (and (light? a-value) (light? another-value))  
      (string=? a-value another-value)     
      (error "traffic light expected, given some other value")))

; Any -> Boolean
;
; returns true if both values are lights and they represent the same light; otherwise returns an error
(define (light.v2=? arg1 arg2)
  (cond
    [(not (light? arg1)) (error "first argument is not a TrafficLight")]
    [(not (light? arg2)) (error "second argument is not a TrafficLIght")]
    [else (string=? arg1 arg2)]))

; Test

(check-expect (light? "111")    #false)

(check-expect (light=? "red"    "red")    #true)
(check-expect (light=? "red"    "green")  #false)
(check-expect (light=? "green"  "green")  #true)
(check-expect (light=? "yellow" "yellow") #true)

(check-error  (light=? "blue"    "red")   "traffic light expected, given some other value")

(check-expect (light.v2=? "red"    "red")    #true)
(check-expect (light.v2=? "red"    "green")  #false)
(check-expect (light.v2=? "green"  "green")  #true)
(check-expect (light.v2=? "yellow" "yellow") #true)

(check-error  (light.v2=? "blue"   "blue") "first argument is not a TrafficLight")
(check-error  (light.v2=? "red"    "blue") "second argument is not a TrafficLIght")