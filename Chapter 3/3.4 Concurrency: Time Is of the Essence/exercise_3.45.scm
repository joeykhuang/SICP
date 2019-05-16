(define (make-account-and-serializer balance)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (= balance amount)) balance)
            "Insufficient funds"))
    (define (deposit amount)
        (set! balance (+ balance amount)) balance)
    (let ((balance-serializer (make-serializer)))
        (define (dispatch m)
            (cond ((eq? m 'withdraw ) (balance-serializer withdraw))
                  ((eq? m 'deposit ) (balance-serializer deposit))
                  ((eq? m 'balance ) balance)
                  ((eq? m 'serializer ) balance-serializer)
                  (else (error "Unknown request: MAKE-ACCOUNT" make))))
        dispatch))

(define (deposit account amount)
    ((account 'deposit ) amount))

; When serialized-exchange is called, a serializer is working inside the same serializer, so the program
; would go into deadlock