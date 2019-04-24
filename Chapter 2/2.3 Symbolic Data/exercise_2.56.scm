(load "Chapter 2/2.3 Symbolic Data/differentiation.scm")
(define (exponentiation? exp)
    (and (pair? exp) (eq? (car exp) '**)))

(define (base exp)
    (cadr exp))

(define (exponent exp)
    (caddr exp))

(define (make-exponentiation base exponent)
    (cond ((=number? exponent 0) 1)
          ((=number? exponent 1) base)
          ((and (number? base) (number? exponent))
            (expt base exponent))
          (else (list '** base exponent))))
        
(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp) (if (same-variable? exp var) 1 0))
          ((sum? exp) (make-sum (deriv (addend exp) var)
                                (deriv (augend exp) var)))
          ((product? exp)
           (make-sum
                (make-product (multiplier exp)
                              (deriv (multiplicand exp) var))
                (make-product (deriv (multiplier exp) var)
                              (multiplicand exp))))
          ((exponentiation? exp)
            (make-product
                (make-product (exponent exp)
                              (make-exponentiation (base exp) 
                                                   (make-sum (exponent exp) -1)))
                (deriv (base exp) var)))
        (else
            (error "unknown expression type: DERIV" exp))))