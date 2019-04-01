(define (f g) (g 2))
(f square)
(f (lambda (z) (* z (+ z 1))))
(f f) ; the interpreter cannot evaluate (f f) because of normative order