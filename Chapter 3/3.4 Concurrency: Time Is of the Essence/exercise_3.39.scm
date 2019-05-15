(define x 10)
(define s (make-serializer))
(parallel-execute
    (lambda () (set! x ((s (lambda () (* x x))))))) ; P1 -- two processes, (set! x)
                                                    ;                      (s (lambda () (* x x)))
    (s (lambda () (set! x (+ x 1))))                ; P2 -- one process (s (lambda () (set! x (+ x 1))))

; results that can remain 
; 101: P1 sets x to 100 and P2 adds 1
; 121: P2 runs first to set x to 11, then P1 squares 11 to get 121
; 100: P2 sets x in between P1's second process calculating square x and setting x, so
;      P2's assignment is ignored()