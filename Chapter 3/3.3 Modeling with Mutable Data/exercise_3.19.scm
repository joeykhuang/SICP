; Tortoise and hare solution (Floyd 1967)
(define (is-cycle? x)
    (let ((hare x)
          (tort x))
        (define (loop)
            (set! hare (cdr hare))
            (if (null? hare)
                #f
                (if (eq? hare tort)
                    #t
                    (begin (set! hare (cdr hare))
                        (if (null? hare)
                            #f
                            (if (eq? hare tort)
                                #t
                                (begin (set! tort (cdr tort))
                                    (loop))))))))
    (loop)))