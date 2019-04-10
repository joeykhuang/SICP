(define (list-ref items n)
    (if (= n 0)
        (car items)
        (list-ref (cdr items) (- n1))))

; recur length
(define (length items)
    (if (null? items)
        0
        (+ 1 (length (cdr items)))))

; iter length
(define (length items)
    (define (length-iter a count)
        (if (null? a)
            count
            (length-iter (cdr a) (+ 1 count))))
    (length-iter items 0))

(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))