(define (is-carmichael? n)
    (= (carmichael-iter 1 n) n))

(define (carmichael-iter a n)
    (if (and (< a n) (is-congruent? a n))
        (carmichael-iter (+ a 1) n)
        a))

(define (is-congruent? a n)
    (= (modulo (fast-expt a n) n) (modulo a n)))

(define (modulo a n)
    (remainder a n))

(define (is-even? n)
    (= (remainder n 2) 0))

(define (square n) (* n n))

(define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((is-even? n) (fast-expt-iter (square b) (/ n 2) a))
          (else (fast-expt-iter b (- n 1) (* a b)))))

(define (fast-expt b n)
    (fast-expt-iter b n 1))