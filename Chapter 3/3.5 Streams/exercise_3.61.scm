(load "Chapter 3/3.5 Streams/exercise_3.60.scm")
(define (invert-unit-series series)
    (define new-series 
        (cons-stream 1 (scale-stream (mul-series new-series
                                                 (stream-cdr series))
                       -1)))
    new-series)