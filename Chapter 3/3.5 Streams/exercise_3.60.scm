(load "Chapter 3/3.5 Streams/exercise_3.59.scm")
(define (mul-series s1 s2)
    (cons-stream (* (stream-car s1) (stream-car s2))
                 (add-streams (scale-stream (stream-cdr s2) (stream-car s1))
                              (mul-series (stream-cdr s1) s2))))

(define sine-squared (mul-series sine-series sine-series))
(define cosine-squared (mul-series cosine-series cosine-series))
(add-streams sine-squared cosine-squared)
; 1 0 0 0 0 ...
