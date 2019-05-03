(load "Chapter 2/2.5 Systems with Generic Operations/exercise_2.89.scm")
(define (install-polynomial-sparse-package)
    (define (make-poly variable term-list) (cons variable term-list))
    (define (variable p) (car p))
    (define (term-list p) (cdr p))
    (define (adjoin-term term termlist)
        (if (=zero? (coeff term))
            termlist
            (cons term termlist)))
    (define (first-term termlist) (car (term-list termlist)))
    (define (tag p) (attach-tag 'sparse p))
    (put 'variable '(sparse) variable)
    (put 'term-list '(sparse) term-list)
    (put 'adjoin-term 'sparse
        (lambda (term termlist) (adjoin-term term termlist)))
    (put 'first-term '(sparse) first-term)
    (put 'make 'sparse 
        (lambda (var terms) (tag (make-poly var terms))))
'done )
(define (make-polynomial-sparse var terms)
    ((get 'make 'sparse ) var terms))

(define (install-polynomial-dense-package)
    (define (make-poly variable term-list) (cons variable term-list))
    (define (variable p) (car p))
    (define (term-list p) (cdr p))
    (define (adjoin-term term termlist)
        (cond ((zero? (cadr term)) termlist)
              ((= (order term) (- (length termlist) 1))
               (add term (first-term termlist)))
              (else (cons (first-term termlist
                           (adjoin-term term (cdr termlist)))))))
    (define (first-term termlist) (cons (- (length (term-list termlist)) 1)
                                        (car (term-list termlist))))
    (define (tag p) (attach-tag 'dense p))
    (put 'variable '(dense) variable)
    (put 'term-list '(dense) term-list)
    (put 'adjoin-term 'dense
        (lambda (term term-list) (adjoin-term term term-list)))
    (put 'first-term '(dense) first-term)
    (put 'make 'dense
        (lambda (var terms) (tag (make-poly var terms))))
'done )
(define (make-polynomial-dense var terms)
    ((get 'make 'dense ) var terms))

(install-polynomial-sparse-package)
(install-polynomial-dense-package)

(define (install-polynomial-package)
    (define (make-from-sparse var termlist)
        (make-polynomial-sparse var termlist))
    
    (define (make-from-dense var termlist)
        (make-polynomial-dense var termlist))
    ;; internal procedures
    ;; representation of poly
    (define (variable p)
        (apply-generic 'variable p))
    (define (term-list p)
        (apply-generic 'term-list p))

    (define (variable? x)
        (symbol? x))
    (define (same-variable? v1 v2)
        (and (variable? v1) (variable? v2) (eq? v1 v2)))

    (define (=zero? n)
        (define (poly? n)
            (eq? (type-tag n) 'polynomial ))
        (define (zero-terms? termlist) 
            (or (empty-termlist? termlist) 
                (and (=zero? (coeff (first-term termlist))) 
                    (zero-terms? (rest-terms termlist)))))
        (if (poly? n)
            (zero-terms? n)
            (zero? n)))

    ;; representation of terms and term lists
    (define (adjoin-term terms)
        (apply-generic 'adjoin-term (car terms) (cdr terms)))
    (define (the-empty-termlist) '())
    (define (first-term termlist)
        (apply-generic 'first-term termlist))
    (define (rest-terms termlist) (cdr termlist))
    (define (empty-termlist? termlist) (null? (cddr termlist)))
    (define (make-term order coeff) (list order coeff))
    (define (order term) (car term))
    (define (coeff term) (cadr term))
    ;; procedure to add and multiply term lists
    (define (add-terms L1 L2)
        (cond ((empty-termlist? L1) L2)
              ((empty-termlist? L2) L1)
              (else
                (let ((t1 (first-term L1))
                      (t2 (first-term L2)))
                    (cond ((> (order t1) (order t2))
                           (adjoin-term
                            (attach-tag (type-tag L1)
                                        (cons t1 (add-terms (attach-tag (type-tag L1) 
                                                                (rest-terms (term-list L1))) L2)))))
                          ((< (order t1) (order t2))
                           (adjoin-term
                            (attach-tag (type-tag L2)
                                        (cons t2 (add-terms L1 (attach-tag (type-tag L2)
                                                                (rest-terms (term-list L2))))))))
                          (else
                            (adjoin-term
                             (attach-tag (type-tag L1)
                                (cons
                                    (make-term (order t1)
                                        (add (coeff t1) (coeff t2)))
                                    (add-terms (attach-tag (type-tag L1)
                                                        (rest-terms (term-list L1)))
                                            (attach-tag (type-tag L2)
                                                        (rest-terms (term-list L2)))))))))))))
    (define (mul-terms L1 L2)
        (if (empty-termlist? L1)
            (the-empty-termlist)
            (add-terms (mul-term-by-all-terms (first-term L1) L2)
                       (mul-terms (rest-terms L1) L2))))
    (define (mul-term-by-all-terms t1 L)
        (if (empty-termlist? L)
            (the-empty-termlist)
            (let ((t2 (first-term L)))
                (adjoin-term
                 (make-term (+ (order t1) (order t2))
                            (mul (coeff t1) (coeff t2)))
                 (mul-term-by-all-terms t1 (rest-terms L))))))

    (define (add-poly p1 p2)
        (if (same-variable? (variable p1) (variable p2))
            (make-poly (variable p1)
                (add-terms p1 p2))
            (error "Polys not in same var: ADD-POLY" (list p1 p2))))
    (define (mul-poly p1 p2)
        (if (same-variable? (variable p1) (variable p2))
            (make-poly (variable p1)
                    (mul-terms (term-list p1) (term-list p2)))
            (error "Polys not in same var: MUL-POLY" (list p1 p2))))

    ;; interface to rest of the system
    (define (tag p) (attach-tag 'polynomial p))
    (put 'add '(polynomial polynomial)
        (lambda (p1 p2) (tag (add-poly p1 p2))))
    (put 'mul '(polynomial polynomial)
        (lambda (p1 p2) (tag (mul-poly p1 p2))))
    (put 'mul '(polynomial scheme-number)
        (lambda (p n) (tag (mul-poly p (make-poly 
                                        (variable p)
                                        (list (list 0 n)))))))
    (put 'make-sparse 'polynomial
        (lambda (var terms) (tag (make-from-sparse var terms))))
    (put 'make-dense 'polynomial
        (lambda (var terms) (tag (make-from-dense var terms))))
    (put '=zero? 'polynomial =zero?)
'done )

(install-polynomial-package)

(define (make-sparse var terms)
    ((get 'make-sparse 'polynomial ) var terms))
(define (make-dense var terms)
    ((get 'make-dense 'polynomial ) var terms))