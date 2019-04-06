(load "Chapter 1/1.3 Formulating Abstractions with Higher-Order Procedures/procedures_return_values.scm")
(define (cubic a b c)
    (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

(define (calculate-cubic-zero a b c)
    (newtons-method (cubic a b c) 1))