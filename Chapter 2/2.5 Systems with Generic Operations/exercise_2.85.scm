(load "Chapter 2/2.5 Systems with Generic Operations/exercise_2.84.scm")
(define (install-scheme-number-package) 
;; ... 
    (put 'project '(scheme-number) false)
'done ) 

(define (install-real-package)
;; ... 
    (put 'project '(real) (lambda (x) (make-rational (round x) 1))) 
'done )

(define (install-rational-package) 
;; ... 
    (put 'project '(rational) (lambda (x) (make-scheme-number (round x))))
'done ) 

(define (install-complex-package) 
;; ... 
    (put 'project '(complex) (lambda (x) (make-real (real-part x))))
'done ) 

(define (project n) (apply-generic 'project n))
;----------------------------------------------------------------------
(define (drop n)
    (cond ((eq? (type-tag n) 'scheme-number ) n)
          ((equ? (raise (project n)) n)
            (drop (project n)))
          (else n)))
;----------------------------------------------------------------------
; # TODO: Add support for multiple arguments
(define (apply-generic-new op . args)
    (drop (apply-generic op (car args) (cadr args))))