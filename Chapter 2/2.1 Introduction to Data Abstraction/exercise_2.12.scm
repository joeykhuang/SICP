(load "Chapter 2/2.1 Introduction to Data Abstraction/exercise_2.11.scm")
; center-percent constructor
(define (make-center-percent c e)
    (make-interval (- c (* c e)) (+ c (* c e))))
(define (center-error z)
    (center-width z))
(define (error z)
    (/ (width z) (center-error z)))