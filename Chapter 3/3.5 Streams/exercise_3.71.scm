(load "Chapter 3/3.5 Streams/exercise_3.70.scm")
(define (ramanujan-weight p)
    (+ (* (car p) (car p) (car p))
       (* (cadr p) (cadr p) (cadr p))))

(define ramanujan-raw-stream (weighted-pairs integers integers ramanujan-weight))

(define (search-for-consecutive stream weight)
    (if (= (weight (stream-car stream))
           (weight (stream-car (stream-cdr stream))))
        (cons-stream (weight (stream-car stream))
                     (search-for-consecutive (stream-cdr stream) weight))
        (search-for-consecutive (stream-cdr stream) weight)))

(define ramanujan-stream (search-for-consecutive ramanujan-raw-stream ramanujan-weight))

; (1729 4104 13832 20683 32832 39312 ...)