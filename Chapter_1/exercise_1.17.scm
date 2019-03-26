(define (* a b)
    (if (= b 0)
        0
        (+ a (* a (- b 1)))))

(define (mult-iter a b)
    (cond ((= b 1) a)
          ((or (= b 0) (= a 0)) 0)
          ((is-even? b) (mult-iter (double a) (halve b)))
          (else (+ (mult-iter (double a) (halve (- b 1))) a))))

(define (double n) (* n 2))
(define (halve n) (/ n 2))
(define (is-even? n) (= (remainder n 2) 0))