(define (expt-iter b count product)
    (if (= count 0)
        product
        (expt-iter (* b b) (- count 1) (* product b))))

(define (is-even? n)
    (= (remainder n 2) 0))

(define (calc-expt b n a)
    (if (is-even? n)
        (expt-iter b (/ n 2) a)
        (* (expt-iter b (/ (- n 1) 2) a) b)))
