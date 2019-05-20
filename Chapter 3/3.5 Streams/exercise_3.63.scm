(define (sqrt-stream x)
    (cons-stream 1.0 (stream-map
                      (lambda (guess)
                        (sqrt-improve guess x))
                      (sqrt-stream x))))

; Since this version of sqrt-stream involves a call to sqrt-stream within its inner procedures, 
;   it is inefficient because it has to recalculate all the previous stream elements

; However, with the memo-proc implementation, the procedure isn't inefficient anymore because all the
;   previous computations have been memoized. 