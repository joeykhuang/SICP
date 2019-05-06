(define (count-pairs x)
    (if (not (pair? x))
        0
        (+ (count-pairs (car x))
           (count-pairs (cdr x))
           1)))

(define three-pairs (list 'a 'b 'c ))
(count-pairs three-pairs) ; 3

(define fp1 (list '() '()))
(define fp2 (list 'a ))
(set-car! fp1 fp2)
(set-car! (cdr fp1) fp2)
(define four-pairs fp1)
(count-pairs four-pairs) ; 4

(define sp1 (list '()))
(define sp2 (list '()))
(define sp3 (list 'a ))
(set-car! sp2 sp3)
(set-car! sp1 sp2)
(set-cdr! sp2 sp3)
(set-cdr! sp1 sp2)
(define seven-pairs sp1)
(count-pairs seven-pairs) ; 7

(define nr1 (list 'a 'b 'c ))
(define never-return (begin (set-cdr! (cdr nr1) nr1) nr1))