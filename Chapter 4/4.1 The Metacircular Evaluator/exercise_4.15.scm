(define (run-forever) (run-forever))
(define (try p)
    (if (halts? p p) (run-forever) 'halted ))

; When (halts? try try) is true, then the result is (run-forever).

; When (halts? try try) is false then the result is 'halted.