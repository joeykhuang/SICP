(load "Chapter 2/2.3 Symbolic Data/exercise_2.56.scm")

(define (addend s) (cadr s))
(define (augend s)
  (if (single-operants s)
      (caddr s)
      (cons '+ (cons (caddr s) (cdddr s)))))

(define (multiplier p) (cadr p))
(define (multiplicand p)
  (if (single-operants p)
      (caddr p)
      (cons '* (cons (caddr p) (cdddr p)))))

(define (single-operants exp)
    (null? (cdddr exp)))