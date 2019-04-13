(load "Chapter 2/2.2 Hierarchical Data and the Closure Property/map-list.scm")
(define (square-list items)
    (if (null? items)
        '() 
        (cons (square (car items))
              (square-list (cdr items)))))

(define (square-list items)
    (map square items))