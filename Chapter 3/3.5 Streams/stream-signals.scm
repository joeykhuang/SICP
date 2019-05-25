(load "Chapter 3/3.5 Streams/stream-pairs.scm")
(define (integral integrand initial-value dt)
    (define int
        (cons-stream initial-value
                     (add-streams (scale-stream integrand dt)
                                  int)))
    int)