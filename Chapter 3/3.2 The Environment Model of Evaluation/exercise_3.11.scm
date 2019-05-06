(define (make-account balance)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                   balance)
            "Insufficient funds"))
    (define (deposit amount)
        (set! balance (+ balance amount))
        balance)
    (define (dispatch m)
        (cond ((eq? m 'withdraw ) withdraw)
              ((eq? m 'deposit ) deposit)
              (else
                (error "Unknown request: MAKE-ACCOUNT" m))))
    dispatch)

(define acc (make-account 50))
((acc 'deposit ) 40)
((acc 'withdraw ) 60)

; the local state for acc is kept in an environment E1 created by the call
;   (make-account 50)

(define acc2 (make-account 100))
; the local states for the two accounts are kept distinct by having two different environments
;   E1 and E2 that each contain the local variables and procedures for acc and acc2

; the shared environment structure by acc and acc2 is the environemnt where the variables names
;   acc and acc2 are stored