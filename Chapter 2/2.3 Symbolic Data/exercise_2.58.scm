(load "Chapter 2/2.3 Symbolic Data/exercise_2.57.scm")
; part a
(define (sum? x)
    (and (pair? x) (eq? (cadr x) '+)))

(define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2))
           (+ a1 a2))
          (else (list a1 '+ a2))))

(define (addend s)
    (car s))

(define (augend s)
  (if (single-operants s)
      (caddr s)
      (cons (caddr s) (cons '+ (cdddr s)))))

(define (product? x)
    (and (pair? x) (eq? (cadr x) '*)))

(define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list m1 '* m2))))

(define (multiplier p) (car p))
(define (multiplicand p)
  (if (single-operants p)
      (caddr p)
      (cons (caddr p) (cons '* (cdddr p)))))

(define (exponentiation? exp)
    (and (pair? exp) (eq? (cadr exp) '**)))

(define (make-exponentiation base exponent)
    (cond ((=number? base 0) 0)
          ((=number? exponent 0) 1)
          ((=number? exponent 1) base)
          ((and (number? base) (number? exponent))
            (expt base exponent))
          (else (list base '** exponent))))

(define (base exp) (car exp))
(define (exponent exp)
   (if (single-operants exp)
      (caddr exp)
      (cons (caddr exp) (cons '** (cdddr exp)))))

(define (single-operants exp)
    (null? (cdddr exp)))

; part b
