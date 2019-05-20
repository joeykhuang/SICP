(load "Chapter 3/3.5 Streams/infinite-streams.scm")
(define (integrate-series coefficient-stream)
    (define (integrate-helper coefficient-stream term)
        (cons-stream (/ (stream-car coefficient-stream) term)
                     (integrate-helper (stream-cdr coefficient-stream) (+ term 1))))
    (integrate-helper coefficient-stream 1))

(define exp-series (cons-stream 1 (integrate-series exp-series)))

(define cosine-series (cons-stream 1 (integrate-series (scale-stream sine-series -1))))
(define sine-series (cons-stream 0 (integrate-series cosine-series)))