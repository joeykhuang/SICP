(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp)
           (if (same-variable? exp var) 1 0))
          ((sum? exp)
           (make-sum (deriv (addend exp) var)
                     (deriv (augend exp) var))) 248
          ((product? exp)
           (make-sum (make-product
                      (multiplier exp)
                      (deriv (multiplicand exp) var))
                     (make-product
                      (deriv (multiplier exp) var)
                      (multiplicand exp))))
          (else (error "unknown expression type: DERIV" exp))))

(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp)
           (if (same-variable? exp var) 1 0))
          (else ((get 'deriv (operator exp))
                 (operands exp) var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))