; part a: recursive product
(define (product term a next b)
    (if (> a b)
        1
        (* (term a)
           (product term (next a) next b))))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (factorial n)
    (product identity 1 inc n))

(define (double-inc x) (+ x 2))
(define (pi-product n)
    (* 4 (/ (* 2.0 (/ (product square 4 double-inc (* 2 n)) (* 2 n)))
            (* 1.0 (product square 3 double-inc (* 2 n))))))

; part b: iterative product            
(define (product term a next b)
    (define (iter a result)
        (if (> a b) 
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))