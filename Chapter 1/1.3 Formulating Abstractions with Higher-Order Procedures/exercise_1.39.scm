(load "Chapter 1/1.3 Formulating Abstractions with Higher-Order Procedures/exercise_1.37.scm")
(define (tan-cf x k)
    (cont-frac-iter (lambda (i) (if (= i 1) 
                                    x 
                                    (* (square x) -1)))
                    (lambda (i) (- (* 2 i) 1))
                    k))