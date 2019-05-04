(define rand
    (let ((x random-init))
        (lambda (arg)
            (define generate
                    (lambda ()
                        (set! x (rand-update x))
                        x))
            (define reset
                (lambda (init)
                    (set! x init-value)
                    (set! x (rand-update x))))
            (cond ((eq? arg 'generate ) generate)
                  ((eq? arg 'reset ) reset)
                  (else (error "Invalid operation: RAND": arg))))))