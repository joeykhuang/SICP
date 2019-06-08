(lambda <vars>
    (let ((u '*unassigned* ) (v '*unassigned* ))
        (let ((a <e1>) (b <e2>))
            (set! u a)
            (set! v b))
        <e3>))

(define (solve f y0 dt)
    (define y (integral (delay dy) y0 dt))
    (define dy (stream-map f y))
    y)

; This procedure will not work if internal definitions are scanned out as shown in the exercise 
;   because both arguments of outer and inner lambda are unassigned. 