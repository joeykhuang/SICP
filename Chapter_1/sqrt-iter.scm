(define (sqrt-iter guess x)
    (if (guess_good? guess x)
        guess
        (sqrt-iter (improve_guess guess x) x)))

(define (guess_good? guess x)
    (< (abs(- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (improve_guess guess x)
    (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

(define (sqrt x) (sqrt-iter 1.0 x))