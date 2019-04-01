(load "Chapter 1/1.3 Formulating Abstractions with Higher-Order Procedures/fixed_points.scm")
(define phi (fixed-point (lambda (x) (+ 1 (/ 1.0 x))) 1.0))