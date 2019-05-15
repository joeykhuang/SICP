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
                  ((eq? m 'balance )
                    ((protected
                        (lambda () balance))))
                  (else (error "Unknown request: MAKE-ACCOUNT" m))))
        dispatch))

; I disagree because the access of balance does not change the current value of balance,
;   whereas the other protected processes changed the value of balance, so they cannot be
;   interleaved. If balance is called in the middle of another process, like withdraw or deposit
;   then we can say that the other process has not finished, so the original value of balance
;   that is dispatched is still valid.