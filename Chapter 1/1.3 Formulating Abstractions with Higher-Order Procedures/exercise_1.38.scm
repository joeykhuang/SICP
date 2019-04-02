(load "Chapter 1/1.3 Formulating Abstractions with Higher-Order Procedures/exercise_1.37.scm")
(define (euler-d k)
    (cond ((= k 1) 1)
          ((= k 2) 2)
          ((= (remainder k 3) 2) (* 2 (/ (+ k 1) 3)))
          (else 1)))

(+ 2 (cont-frac-recur (lambda (i) 1.0) euler-d 2000))