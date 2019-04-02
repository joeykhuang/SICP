(load "Chapter 1/1.3 Formulating Abstractions with Higher-Order Procedures/fixed_points.scm")
(define (average a b) (/ (+ a b) 2))
(define (average-damp f)
    (lambda (x) (average x (f x))))

(define (sqrt x)
    (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(define (cube-root x)
    (fixed-point (average-damp (lambda (y) (/ x (square y)))) 1.0))

(define (deriv g)
    (define dx 0.00001)
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
(define (newton-transform g)
    (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
    (fixed-point (newton-transform g) guess))
(define (sqrt-newton x)
    (newtons-method
        (lambda (y) (- (square y) x)) 1.0))