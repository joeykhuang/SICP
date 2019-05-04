(define function
    (let ((secret -1)) 
        (lambda (arg)
            (if (eq? secret -1)
                (begin
                    (set! secret arg)
                    secret)
                0))))
(define f function)