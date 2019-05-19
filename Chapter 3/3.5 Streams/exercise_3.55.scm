(define (partial-sums s)
    (cons-stream (stream-car s)
                 (add-streams (stream-cdr s) (partial-sums s))))

; 1 3 6 10 15 21 28 ...