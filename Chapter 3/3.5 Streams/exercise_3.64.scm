(load "Chapter 3/3.5 Streams/stream-iteration.scm")
(define (sqrt x tolerance)
    (stream-limit (sqrt-stream x) tolerance))

(define (stream-limit stream tolerance)
    (let ((s0 (stream-car stream))
          (s1 (stream-car (stream-cdr stream))))
        (if (< (abs (- s0 s1)) tolerance)
            s1
            (stream-limit (stream-cdr stream) tolerance))))