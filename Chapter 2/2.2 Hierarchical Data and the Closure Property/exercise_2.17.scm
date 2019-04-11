(load "Chapter 2/2.2 Hierarchical Data and the Closure Property/list-operations.scm")
(define (last-pair items)
    (if (= (length items) 1)
        items
        (last-pair (cdr items))))