(define (transfer from-account to-account amount)
    ((from-account 'withdraw ) amount)
    ((to-account 'deposit ) amount))

; Louis is wrong. The essential difference between the transfer problem and the exchange problem
;   is that both accounts have to be idle (no other concurrent processes) for the exchange problem. 
;   The exchange process has an unserialized process (difference) that can interleave between other
;   concurrent processes