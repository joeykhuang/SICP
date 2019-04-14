(define (fringe items)
    (define (fringe-iter a append-list)
        (if (null? a)
            append-list
            (if (not (pair? (car a)))
                (append append-list (list (car a)) (fringe-iter (cdr a) append-list))
                (append append-list (fringe-iter (car a) append-list) (fringe-iter (cdr a) append-list)))))
    (fringe-iter items (list )))