(define x (list (cons 'a 'b ) 'c 'd ))
(define y (cons 'e 'f ))

(set-car! x y)
; ((e f) c d)

(define z (cons y (cdr x)))

(set-cdr! x y)
; (a b (e f))

(define (cons x y)
    (let ((new (get-new-pair)))
        (set-car! new x)
        (set-cdr! new y)
        new))