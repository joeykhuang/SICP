(define (scheme-number->scheme-number n) n)
(define (complex->complex z) z)
(put-coercion 'scheme-number
              'scheme-number
              scheme-number->scheme-number)
(put-coercion 'complex 'complex complex->complex)

(define (exp x y) (apply-generic 'exp x y))

(put 'exp '(scheme-number scheme-number)
    (lambda (x y) (tag (expt x y))))

; part a:
;   if we call exp with two complex numbers as arguments, then it will return
;   an error "No method for these types: APPLY-GENERIC" because there exists
;   no procedure called 'exp defined for two complex numbers 

; part b:
;   apply-generic will work correctly as is

(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags)))
            (if proc
                (apply proc (map contents args))
                (if (and (= (length args) 2)
                         (not (eq? (car type-tags) 
                                   (cadr type-tags))))
                    (let ((type1 (car type-tags))
                          (type2 (cadr type-tags))
                          (a1 (car args))
                          (a2 (cadr args)))
                        (let ((t1->t2 (get-coercion type1 type2))
                                (t2->t1 (get-coercion type2 type1)))
                            (cond (t1->t2
                                    (apply-generic op (t1->t2 a1) a2))
                                    (t2->t1
                                    (apply-generic op a1 (t2->t1 a2)))
                                (else (error "No method for these types"
                                            (list op type-tags)))))))
                    (error "No method for these types"
                           (list op type-tags))))))