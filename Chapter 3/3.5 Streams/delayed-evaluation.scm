(define (solve f y0 dt)
    (define y (integral dy y0 dt))
    (define dy (stream-map f y))
    y)

; Does not work because first call to y requires dy to be defined, and dy requires y to be defined

(define (integral delayed-integrand initial-value dt)
    (define int
        (cons-stream
         initial-value
         (let ((integrand (force delayed-integrand)))
            (add-streams (scale-stream integrand dt) int))))
    int)

(define (solve f y0 dt)
    (define y (integral (delay dy) y0 dt))
    (define dy (stream-map f y))
    y)