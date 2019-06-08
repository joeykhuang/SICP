(let ((a 1))
    (define (f x)
        (define b (+ a x))
        (define a 5)
        (+ a b))
    (f 10))

; In theory I agree with Eva – if the principle that internal definitions are truly simultaneous then 
;   Eva’s approach is correct. The problem though is that it’s not such an easy task to find the actual 
;   order to evaluate mutually recursive and dependent definitions.

; So in practise Alyssa’s approach seems the best, or at least the easiest or most convenient.