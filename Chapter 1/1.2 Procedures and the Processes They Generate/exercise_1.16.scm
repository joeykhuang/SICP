(define (is-even? n)
    (= (remainder n 2) 0))

(define (square n) (* n n))

(define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((is-even? n) (fast-expt-iter (square b) (/ n 2) a))
          (else (fast-expt-iter b (- n 1) (* a b)))))

(define (fast-expt b n)
    (fast-expt-iter b n 1))