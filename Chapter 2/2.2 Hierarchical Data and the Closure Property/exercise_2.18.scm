(load "Chapter 2/2.2 Hierarchical Data and the Closure Property/exercise_2.17.scm")
(define (reverse items)
    (define (reverse-append items append-list)
        (if (null? items)
            append-list
            (reverse-append (cdr items) (append (list (car items)) append-list))))
    (reverse-append items (list )))