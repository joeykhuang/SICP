(define (expmod base exp m)
	(cond ((= exp 0) 1)
		  ((even? exp)
		 		(if (and (not (= base (- exp 1))) 
					(= (remainder (square base) exp) 1)) 
					0
		  			(remainder (square (expmod base (/ exp 2) m)) 
						m)))
          (else
				(remainder (* base (expmod base (- exp 1) m)) 
					m))))

(define (miller-rabin-test n)
	(define (try-it a)
		(and (= (expmod a n n) a) (not (= (expmod a n n) 0))))
	(try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
	(cond ((= times 0) #t)
		  ((miller-rabin-test n) (fast-prime? n (- times 1)))
		  (else #f)))