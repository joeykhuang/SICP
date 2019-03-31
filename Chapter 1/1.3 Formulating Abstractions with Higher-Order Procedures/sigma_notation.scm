(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

(define (inc n) (+ n 1))
(define (cube n) (* n n n))
(define (sum-cubes a b)
    (sum cube a inc b))

(define (identity n) n)
(define (sum-integers a b)
    (sum identity a inc b))

(define (pi-sum a b)
    (define (pi-term n)
        (/ 1.0 (* n (+ n 2))))
    (define (pi-next n)
        (+ n 4))
    (sum pi-term a pi-next b))