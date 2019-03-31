(load "Chapter 1/1.2 Procedures and the Processes They Generate/exercise_1.24.scm")
(load "Chapter 1/1.1 The Elements of Programming/euclid_algorithm.scm")
(define (filtered-accumulate combiner null-value filter term a next b)
    (if (> a b)
        null-value
        (if (filter a)
            (combiner (term a)
                (filtered-accumulate combiner null-value filter term (next a) next b))
            (filtered-accumulate combiner null-value filter term (next a) next b))))

; part a: sum of primes
(define (prime? n) (fast-prime? n (- n 1)))
(define (add x y) (+ x y))
(define (inc x) (+ x 1))
(define (sum-square-prime a b)
    (filtered-accumulate add 0 prime? square a inc b))

; part b: product of relative primes
(define (multiply x y) (* x y))
(define (identity x) x)
(define (product-relative-prime n)
    (define (relative-prime? a) (= (gcd a n) 1))
    (filtered-accumulate multiply 1 relative-prime? identity 1 inc n))