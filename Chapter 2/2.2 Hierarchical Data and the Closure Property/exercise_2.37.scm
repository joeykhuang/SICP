(load "Chapter 2/2.2 Hierarchical Data and the Closure Property/exercise_2.36.scm")
(define (dot-product v w)
    (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
    (map (lambda (x) (dot-product v x)) m))

(define (transpose mat)
    (accumulate-n cons (list ) mat))

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (x) (matrix-*-vector cols x)) m)))