; part a: recursive accumulate
(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a)
                  (accumulate combiner null-value term (next a) next b))))

(define (add x y) (+ x y))
(define (sum term a next b)
    (accumulate add 0 term a next b))

(define (multiply x y) (* x y))
(define (product term a next b)
    (accumulate multiply 1 term a next b))

; part b: iterative accumulate
(define (accumulate combiner null-value term a next b)
    (define (iter a result)
        (if (> a b) 
            result
            (iter (next a) (combiner result (term a)))))
    (iter a null-value))