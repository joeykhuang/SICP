(define (type-tag x)
    (if (number? x)
        'scheme-number
        (car x)))
(define (contents x)
    (if (number? x)
        x
        (cdr x)))
(define (attach-tag type-tag contents)
    (if (number? x)
        x
        (cons type-tag contents)))