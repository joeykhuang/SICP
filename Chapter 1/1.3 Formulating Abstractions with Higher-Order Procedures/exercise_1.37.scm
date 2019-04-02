; part a: recursive process
(define (cont-frac-recur n d k)
    (if (= k 0)
        0
        (/ (n k) (+ (d k)
                 (cont-frac-recur n d (- k 1))))))

(define tolerance 0.00005)
(define (search-phi target k)
    (define (close-enough? target)
        (< (abs (- target 0.6180344478216819)) tolerance))
    (if (close-enough? target)
        k
        (search-phi (cont-frac-recur (lambda (i) 1.0) (lambda (i) 1.0) (+ k 1)) (+ k 1))))

(search-phi 0 1)

; part b: iterative-process
(define (cont-frac-iter n d k)
    (define (iter k result)
        (if (= k 0)
            result
            (iter (- k 1) (/ (n k) (+ (d k) result)))))
    (iter k 0))