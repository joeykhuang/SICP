(load "Chapter 2/2.2 Hierarchical Data and the Closure Property/exercise_2.46.scm")
(define (make-segment origin-vector end-vector)
    (cons origin-vector end-vector))

(define start-segment car)
(define end-segment cdr)