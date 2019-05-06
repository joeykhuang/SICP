(define (square x)
    (* x x))
; underlying lambda expression, can be expressed as:
(define square
    (lambda (x) (* x x)))

(define (sum-of-squares x y)    
    (+ (square x) (square y)))
(define (f a)
    (sum-of-squares (+ a 1) (* a 2)))

(define (make-withdraw balance)
    (lambda (amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                   balance)
            "Insufficient funds")))

(define W1 (make-withdraw 100))