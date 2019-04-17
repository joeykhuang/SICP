(load "Chapter 2/2.2 Hierarchical Data and the Closure Property/nested-mappings.scm")
(load "Chapter 2/2.2 Hierarchical Data and the Closure Property/list-operations.scm")
(define (queens board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
             (lambda (positions) (safe? k positions))
             (flatmap
                (lambda (new-row)
                    (map (lambda (rest-of-queens)
                        (adjoin-position
                            new-row k rest-of-queens))
                        (queen-cols (- k 1))))
                (enumerate-interval 1 board-size)))))
    (queen-cols board-size))

(define (adjoin-position row-num col-num board)
    (cons row-num board))

(define empty-board '())

(define (safe? col-num position)
    (let ((this-row (car position))
          (rest-rows (cdr position))
          (board-size (length position)))
        (define (safe-diagonal? position)
            (define (safe-diagonal-iter col-number new-positions)
                (cond ((null? new-positions) #t)
                      ((= (abs (- (car new-positions) this-row))
                          (abs (- col-number 1)))
                       #f)
                      ((> col-number board-size) #t)
                      (else (safe-diagonal-iter (+ col-number 1) (cdr new-positions)))))
            (safe-diagonal-iter 2 rest-rows))
    
        (define (safe-horizontal? position)
            (not (member this-row rest-rows)))
        
        (or (= (length position) 1) 
            (and (safe-horizontal? position)
                 (safe-diagonal? position)))))

; Louis's program would take (8^8)*T time to solve the eight-queens puzzle
; this is a O(n^n) time complexity