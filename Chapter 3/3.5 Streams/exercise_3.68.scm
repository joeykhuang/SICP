(define (pairs s t)
    (interleave
     (stream-map (lambda (x) (list (stream-car s) x))
                 t)
     (pairs (stream-cdr s) (stream-cdr t))))

; Louis's algorithm does not work because and will recurse infinitely simply because interleave 
; is an ordinary *unction, not a special form like cons-stream, and hence will need to fully 
; evaluate both arguments first

; The second argument to interleave is a recursive call to pairs, and there is no hard-coded base
; case, this implementation will recurse infinitely.