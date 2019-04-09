(define (cons a b)
    (* (expt 2 a) (expt 3 b)))
(define (car z)
    (define (recur-car n product)
        (if (not (even? product))
            n
            (recur-car (+ n 1) (/ product 2))))
    (recur-car 0 z))
(define (cdr z)
    (define (recur-car n product)
        (if (= product 1)
            n
            (recur-car (+ n 1) (/ product 3))))
    (recur-car 0 (/ z (expt 2 (car z)))))