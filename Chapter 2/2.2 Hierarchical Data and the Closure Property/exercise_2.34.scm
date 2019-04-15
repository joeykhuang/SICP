(load "Chapter 2/2.2 Hierarchical Data and the Closure Property/conventional-interfaces.scm")
(define (horner-eval x coefficient-sequence)
    (accumulate (lambda (this-coeff higher-terms) (+ (* higher-terms x) this-coeff))
                0
                coefficient-sequence))