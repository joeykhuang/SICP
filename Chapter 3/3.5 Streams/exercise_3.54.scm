(define (mul-streams s1 s2) (stream-map * s1 s2))

(define factorial (cons-stream 1 (mul-streams integers factorial)))