(define (split first-op second-op)
    (define (split-iter painter-obj n)
        (if (= n 0)
            painter
            (let ((smaller ((split first-op second-op) painter (- n 1))))
                (first-op painter (second-op smaller smaller)))))
    split-iter)