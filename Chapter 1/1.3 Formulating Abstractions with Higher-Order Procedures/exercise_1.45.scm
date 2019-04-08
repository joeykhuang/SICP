(load "Chapter 1/1.3 Formulating Abstractions with Higher-Order Procedures/exercise_1.43.scm")
(load "Chapter 1/1.3 Formulating Abstractions with Higher-Order Procedures/procedures_return_values.scm")
(load "Chapter 1/1.2 Procedures and the Processes They Generate/exponentiation.scm")
(define (n-th-root x n)
    (fixed-point (repeated 
        (average-damp (lambda (y) (/ x (fast-expt y (- n 1)))))
        (floor (/ (log n) (log 2)))) 1.0))