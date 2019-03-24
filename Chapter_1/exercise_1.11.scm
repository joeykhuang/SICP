; recursive process
(define (f n)
    (cond ((< n 3) n)
          (else (+ (f (- n 1)) 
                   (* 2 (f (- n 2)))
                   (* 3 (f (- n 3)))))))

; iterative process
(define (f1 n)
    (define (fun-iter a b c count)
        (cond ((< n 3) n)
              ((= count 0) c)
              (else (fun-iter b c (+ c (* 2 b) (* 3 a)) (- count 1)))))
    (fun-iter 0 1 2 (- n 2)))