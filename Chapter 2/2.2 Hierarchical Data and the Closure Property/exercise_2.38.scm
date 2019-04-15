(load "Chapter 2/2.2 Hierarchical Data and the Closure Property/conventional-interfaces.scm")
(define fold-right accumulate)
(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest))
                  (cdr rest))))
    (iter initial sequence))

(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
(fold-right list '() (list 1 2 3))
(fold-left list '() (list 1 2 3))

; op:
; a op b == b op a
(fold-right + 0 (list 1 2 3))
(fold-left + 0 (list 1 2 3))
(fold-right * 1 (list 1 2 3))
(fold-left * 1 (list 1 2 3))