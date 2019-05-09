; This solution does not work... only finds repetitive cycles, not infinite cycles
(define (is-cycle? x)
    (let ((encountered '()))
        (define (helper x)
            (set! encountered (cons x encountered))
            (cond ((null? x) #f)
                  ((memq (cdr x) encountered) #t)
                  (else (helper (cdr x)))))
    (helper x)))