(define (sqrt-iter old_guess new_guess x)
    (if (guess_good? old_guess new_guess x)
        new_guess
        (sqrt-iter new_guess (improve_guess new_guess x) x)))

(define (guess_good? old_guess new_guess x)
    (< (/ (abs (- old_guess new_guess)) old_guess) 0.0000001))

(define (square x) (* x x))

(define (improve_guess new_guess x)
    (average new_guess (/ x new_guess)))

(define (average x y) (/ (+ x y) 2))

(define (sqrt x) (sqrt-iter 1.0 1000.0 x))