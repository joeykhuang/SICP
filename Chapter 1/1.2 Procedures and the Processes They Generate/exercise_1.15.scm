(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine (/ angle 3.0)))))

; the procedure p is applied 5 times when (sine 12.15 is evaluated)

; the order of growth is Ξ(log3 a)