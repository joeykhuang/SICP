(load "Chapter 2/2.2 Hierarchical Data and the Closure Property/list-operations.scm")
(define (for-each f items)
   (if (not (null? items))
        (f (car items)))
   (if (not (null? items))
        (for-each f (cdr items))))

(for-each (lambda (x) (newline) (display x)) (list 57 321 88))