; In the exchange problem, if both accounts 1 and accounts 2 are trying to exchange with each other
;   at the same time, a deadlock is created. However, if we use the deadlock-avoidance method described
;   above, then if both accounts are trying to exchange with each other at the same time, account 1
;   will be exchanged first because 1 is a smaller number. Therefore, the deadlock situation can be
;   avoided.

(define account-tracker 0)
(define (make-account-and-serializer balance)
    (define account-num '())
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                   balance)
            "Insufficient funds"))
    (define (deposit amount)
        (set! balance (+ balance amount))
        balance)
    (let ((balanace-serializer (make-serializer)))
        (define (dispatch m)
            (cond ((eq? m 'withdraw ) withdraw)
                  ((eq? m 'deposit ) deposit)
                  ((eq? m 'balance ) balance)
                  ((eq? m 'account-num )
                    (if (null? account-num)
                        (begin (set! account-num (+ account-tracker 1))
                               (set! account-tracker (+ account-tracker 1))
                               account-num)
                        account-num))
                  ((eq? m 'serializer ) balanace-serializer)
                  (else (error "Unknown request: MAKE-ACCOUNT" m))))
        dispatch))

(define (serialized-exchange account1 account2)
    (let ((serializer1 (account1 'serializer ))
          (serializer2 (account2 'serializer )))
        (if (< (account1 'account-num ) (account2 'account-num ))
            ((serializer1 (serializer2 exchange)) account1 account2)
            ((serializer2 (serializer1 exchange)) account2 account1))))