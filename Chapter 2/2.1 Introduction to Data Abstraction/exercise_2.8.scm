(load "Chapter 2/2.1 Introduction to Data Abstraction/interval_abstractions.scm")
(define (sub-interval x y)
    (make-interval (- (lower-bound x) (upper-bound y))
                   (- (upper-bound x) (lower-bound y))))