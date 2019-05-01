(load "Chapter 2/2.5 Systems with Generic Operations/polynomial-arithmetic.scm")
(define (negate x) (mul x -1))

(define (sub p1 p2)
    (add p1 (negate p2)))