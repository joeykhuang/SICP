(define x 10)
(parallel-execute
    (lambda () (set! x (* x x)))
    (lambda () (set! x (+ x 1))))

; running the two processes concurrently can return the following values

; 101: P1 sets x to 100 and then P2 increments x to 101.
; 121: P2 incrementsxto 11 and then P1 sets x to x*x.
; 110: P2 changes x from 10 to 11 between the two times that
;      P1 accesses the value of x during the evaluation of (* x x).
; 11:  P2 accesses x, then P1 sets x to 100, then P2 sets x.
; 100: P1 accesses x (twice), then P2 sets x to 11, then P1 sets x.

; serializer
(define x 10)
(define s (make-serializer))
(parallel-execute
    (s (lambda () (set! x (* x x))))
    (s (lambda () (set! x (+ x 1)))))
; can only retun 101 or 121

(define (make-account balance)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                   balance)
            "Insufficient funds"))
    (define (deposit amount)
        (set! balance (+ balance amount))
         balance)
    (let ((protected (make-serializer)))
        (define (dispatch m)
            (cond ((eq? m 'withdraw ) (protected withdraw))
                  ((eq? m 'deposit ) (protected deposit))
                  ((eq? m 'balance ) balance)
                  (else (error "Unknown request: MAKE-ACCOUNT" m))))
        dispatch))
