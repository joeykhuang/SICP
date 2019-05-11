(define (accept-action-procedure! proc)
    (set! action-procedures
          (cons proc action-procedures)))