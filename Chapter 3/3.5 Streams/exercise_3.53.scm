(define s (cons-stream 1 (add-streams s s)))

; the elements of s are going to be:
;   1 2 4 8 16 32 64 ... (powers of 2)