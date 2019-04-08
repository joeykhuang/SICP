(load "Chapter 1/1.3 Formulating Abstractions with Higher-Order Procedures/exercise_1.43.scm")
(define (average a b c)
    (/ (+ a b c) 3.0))

(define dx 0.001)
(define (smooth f)
    (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (n-folded-smooth f n)
    (lambda (x) (repeated (smooth f) n) x))

