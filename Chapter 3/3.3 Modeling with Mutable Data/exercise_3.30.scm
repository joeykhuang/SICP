(load "Chapter 3/3.3 Modeling with Mutable Data/digital-circuit.scm")
(define (ripple-carry-adder a b s c)
    (let ((c-list (map (lambda (x) (make-wire)) (cdr a)))
          (c-out (make-wire)))
        (map
            full-adder
            a
            b
            (append c-list (list c-out))
            s
            (cons c c-list)))
    'ok )