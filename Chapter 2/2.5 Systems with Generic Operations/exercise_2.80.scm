(define (install-scheme-number-package) 
;; ... 
    (put '=zero? '(scheme-number) 
        (lambda (x) (= x 0))) 
'done ) 

(define (install-rational-package) 
;; ... 
    (define (=zero? x)
        (and (= (numer x) 0) (!= (denom x) 0)))
    ;; ... 
    (put '=zero? '(rational) =zero?) 
'done ) 

(define (install-real-package)
;; ... 
    (put '=zero? '(real)
        (lambda (x) (= x 0)))
'done )

(define (install-complex-package) 
;; ... 
    (define (=zero? x) 
        (and (= (real-part x) 0) (= (imag-part x) 0)))
    ;; ... 
    (put '=zero? '(complex) =zero?) 
'done ) 

(define (=zero? x y) (apply-generic '=zero? x y)) 