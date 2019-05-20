(define (sum-primes a b)
    (define (iter count accum)
        (cond ((> count b) accum)
            ((prime? count)
                (iter (+ count 1) (+ count accum)))
            (else (iter (+ count 1) accum))))
    (iter a 0))

(define (sum-primes a b)
    (accumulate +
                0
                (filter prime?
                        (enumerate-interval a b))))

(define (stream-ref s n)
    (if (= n 0)
        (stream-car s)
        (stream-ref (stream-cdr s) (- n 1))))
(define (stream-map proc s)
    (if (stream-null? s)
        the-empty-stream
        (cons-stream (proc (stream-car s))
                     (stream-map proc (stream-cdr s)))))
(define (stream-for-each proc s)
    (if (stream-null? s)
        'done 
        (begin (proc (stream-car s))
               (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
    (stream-for-each display-line s))
(define (display-line x) (newline) (display x))
(define (partial-stream->list stream n) 
    (define (rec str i) 
        (if (= i n) 
            () 
            (cons (stream-car str) 
                  (rec (stream-cdr str) (+ 1 i))))) 
    (rec stream 0)) 

(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))

(define (stream-enumerate-interval low high)
    (if (> low high)
        the-empty-stream
        (cons-stream
            low
            (stream-enumerate-interval (+ low 1) high))))

(define (stream-filter pred stream)
    (cond ((stream-null? stream) the-empty-stream)
          ((pred (stream-car stream))
           (cons-stream (stream-car stream)
                        (stream-filter
                         pred
                         (stream-cdr stream))))
          (else (stream-filter pred (stream-cdr stream)))))

; (delay <exp>) is syntatic sugar for:
;   (lambda () <exp>)

; (define (force delayed-object) (delay-object))

(define (memo-proc proc)
    (let ((already-run? false)
          (result false))
        (lambda ()
            (if (not already-run?)
                (begin (set! result (proc))
                       (set! already-run? true)
                       result)
                result))))

(define (delay x)
    (memo-proc (lambda () x)))

(stream-car
 (stream-cdr
  (stream-filter even?
                 (stream-enumerate-interval
                  10000 1000000))))