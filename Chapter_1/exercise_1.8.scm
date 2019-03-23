(define (cubert-iter guess x)
    (if (guess_good? guess x)
        guess
        (cubert-iter (improve_guess guess x) x)))

(define (guess_good? guess x)
    (< (abs(- (cube guess) x)) 0.001))

(define (cube x) (* x x x))

(define (improve_guess guess x)
    (/ (+ (/ x (* guess guess))
        (* 2 guess)) 3))

(define (cubert x) (cube-iter 1.0 x))