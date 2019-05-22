(load "Chapter 3/3.5 Streams/stream-pairs.scm")

(define (triples s t u)
    (cons-stream
     (list (stream-car s) (stream-car t) (stream-car u))
        (interleave
         (stream-map (lambda (x) (cons (stream-car s) x))
                     (stream-cdr (pairs t u)))
         (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define (pythagorean-triples)
    (define int-triples (triples integers integers integers))
    (stream-filter (lambda (x)
                    (= (square (caddr x))
                       (+ (square (car x))
                          (square (cadr x)))))
                    int-triples))

(define pyt (pythagorean-triples))