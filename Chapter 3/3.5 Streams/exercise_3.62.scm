(load "Chapter 3/3.5 Streams/exercise_3.61.scm")
(define (div-series s1 s2)
    (if (= (stream-car s2) 0)
        (error "ERROR: The constant term of the denominator cannot equal to zero: DIV-SERIES" (stream-car s2))
        (mul-series s1 (invert-unit-series s2))))

(define tangent-series (div-series sine-series cosine-series))