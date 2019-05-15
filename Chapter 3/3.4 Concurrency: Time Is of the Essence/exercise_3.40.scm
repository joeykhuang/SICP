(define x 10)
(parallel-execute (lambda () (set! x (* x x))))
(parallel-execute (lambda () (set! x (* x x x))))

; 100:          P1 accesses x (twice), then P2 sets x to 1,000, then P1 sets x
; 1,000:        P2 accesses x (three times), then P1 sets x to 100, then P2 sets x
; 10,000:       P2 changes x from 10 to 1,000 between the two times that 
;    P1 accesses the value of x during the evaluation of (* x x).
;               P1 changes x from 10 to 100 between the first two times that 
;    P2 accesses the value of x during the evaluation of (* x x x).
; 100,000:      P1 changes x from 10 to 1,000 between the second and third times that 
;    P2 accesses the value of x during the evaluation of (* x x x).
; 1,000,000:    P1 sets x to 100 and then P2 sets x 1o 1,000,000
;               P2 sets x to 1,000 and then P1 sets x 1o 1,000,000

(define x 10)
(define s (make-serializer))
(parallel-execute
    (s (lambda () (set! x (* x x))))
    (s (lambda () (set! x (* x x x)))))

; only 1,000,000 is possible because the make-serializer prevents interleaving between the processes
;   of squaring and cubing