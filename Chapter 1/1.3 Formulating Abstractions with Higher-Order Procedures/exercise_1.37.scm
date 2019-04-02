; part a: recursive process
(define (cont-frac n d k)
    (if (= k 1) (/ (n k) (d k)) (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))

(define tolerance 0.00005)
(define (search-phi target k)
    (define (close-enough? target)
        (< (abs (- target 0.6180344478216819)) tolerance))
    (if (close-enough? target)
        k
        (search-phi (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) (+ k 1)) (+ k 1))))

(search-phi 0 1)

; part b: iterative-process
(define (cont-frac n d k)
    (define (cont-frac-iter k result)
        (if (= k 0)
            result
            (cont-frac-iter (- k 1) (/ (n k) (+ (d k) result)))))
    (cont-frac-iter k 0))