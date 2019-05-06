; #TODO: Find where I went wrong
(define (count-pairs x)
    (let ((num-pairs 0))
        (define new-x (cons (car x) (cdr x)))
        (define (count-pairs-iter new-new-x)
            (if (not (eq? (cdr new-new-x) 'counted ))
                (begin
                    (set! num-pairs (+ num-pairs 1))
                    (set-cdr! new-new-x (cons (cdr new-new-x) 'counted ))
                    (display new-new-x)
                    (newline)
                    (begin (if (pair? (car new-new-x) (count-pairs-iter (car new-new-x))) 0)
                           (if (pair? (cadr new-new-x) (count-pairs-iter (cadr new-new-x))) 0)))
                (begin (if (pair? (car new-new-x) (count-pairs-iter (car new-new-x))) 0)
                       (if (pair? (cadr new-new-x) (count-pairs-iter (cadr new-new-x))) 0))))
        (begin  (count-pairs-iter new-x)
                num-pairs)))

(define (count-pairs x) 
    (let ((encountered '())) 
        (define (helper x) 
            (if (or (not (pair? x)) (memq x encountered)) 
                0 
                (begin 
                    (set! encountered (cons x encountered)) 
                    (+ (helper (car x)) 
                       (helper (cdr x)) 
                       1)))) 
        (helper x))) 