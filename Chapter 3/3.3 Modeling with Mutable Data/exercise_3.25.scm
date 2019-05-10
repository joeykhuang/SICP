(load "Chapter 3/3.3 Modeling with Mutable Data/table-representation.scm")
(define (make-table)
    (let ((local-table (list '*table* )))
        (define (lookup keys)
            (define (lookup-helper keys table)
                (if (= (length keys) 1)
                    (let ((record (assoc (car keys) (cdr table))))
                        (if record
                            (cdr record)
                            false))
                    (let ((subtable
                            (assoc (car keys) (cdr table))))
                        (lookup-helper (cdr keys) subtable))))
            (lookup-helper keys local-table))

        (define (insert! keys value)
            (define (insert-helper keys table)
                (cond 
                    ((null? table)
                        (if (null? (cdr keys))
                            (cons (car keys) value)
                            (list (car keys) (insert-helper (cdr keys) '()))))
                    ((null? (cdr keys))
                        (let ((record (assoc (car keys) (cdr table))))
                            (if record
                                (set-cdr! record value)
                                (set-cdr! table
                                        (cons (cons (car keys) value)
                                                (cdr table))))))
                    (else 
                        (let ((subtable (assoc (car keys) (cdr table))))
                            (if subtable
                                (insert-helper (cdr keys) subtable)
                                (set-cdr! table 
                                        (cons (list (car keys)
                                                    (insert-helper (cdr keys) '()))
                                                (cdr table))))))))
            (insert-helper keys local-table)
            'ok )
        (define (dispatch m)
            (cond ((eq? m 'lookup-proc ) lookup)
                  ((eq? m 'insert-proc! ) insert!)
                  (else (error "Unknown operation: TABLE" m))))
        dispatch))