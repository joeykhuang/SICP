(define (queens board-size)
    (define (queens-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
             (lambda (positions) (safe? k positions))
             (flatmap
                (lambda (rest-of-queens)
                    (map (lambda (new-row)
                            (adjoin-position
                             new-row k rest-of-queens))
                         (enumerate-interval 1 board-size)))
                (queen-cols (- k 1))))))
    (queen-cols board-size))

(define (adjoin-position row-num col-num board)
    (cons row-num board))

(define empty-board '())

(define (safe? column positions)
    (not (or (filter (lambda (x)
                        (= column x)) (map cadr positions))
             (filter (lambda (x)
                        (= (- ))))))