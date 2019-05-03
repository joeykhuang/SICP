(load "Chapter 2/2.5 Systems with Generic Operations/exercise_2.88.scm")
(define (install-polynomial-package)
    ;; ...
    ;; representation of terms and term lists
    (define (adjoin-term term term-list)
        (cond ((=zero? term) term-list)
              ((= (order term) (- (length termlist) 1))
               (add term (first-term termlist)))
              (else (cons (first-term termlist
                           (adjoin-term term (cdr termlist)))))))
    (define (the-empty-termlist) '())
    (define (first-term termlist) (list (- (length termlist) 1)
                                        (car termlist)))
    (define (rest-terms termlist) (cdr termlist))
    (define (empty-termlist? termlist) (null? termlist))
    (define (make-term order coeff) (list order coeff))
    (define (order term) (car term))
    (define (coeff term) (cadr term))
    ;; ...
'done )