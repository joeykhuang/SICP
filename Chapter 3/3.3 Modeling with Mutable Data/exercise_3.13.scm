(define (make-cycle x)
    (set-cdr! (last-pair x) x)
    x)

(define z (make-cycle (list 'a 'b 'c )))

; computing (define z (make-cycle (list 'a 'b 'c))) resulted in an infinite loop