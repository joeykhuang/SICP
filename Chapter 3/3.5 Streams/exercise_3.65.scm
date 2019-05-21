(load "Chapter 3/3.5 Streams/stream-iteration.scm")
(load "Chapter 3/3.5 Streams/exercise_3.64.scm)")
; 1st approximation
(define (ln-summands n)
    (cons-stream (/ 1.0 n)
                 (stream-map - (pi-summands (+ n 1)))))

(define ln-stream-1
    (partial-sums (ln-summands 1)))

; 2nd approximation
(define ln-stream-2 (euler-transform ln-stream-1))

; 3rd approximation
(define ln-stream-3 (accelerated-sequence euler-transform ln-stream-1))

; #TODO: Fix this bit: needs dynamic programming algorithm to check for convergence

(define (convergence-test str1 str2 str3)
    (define (close-enough? n1 n2 n3 tolerance)
        (if (and (< (abs (- n2 n1)) tolerance)
                 (< (abs (- n3 n1)) tolerance)
                 (< (abs (- n3 n2)) tolerance))
            true
            false))
    (define (convergence-helper s1 s2 s3 n)
        (cond ((close-enough? (stream-car s1) (stream-car s2) (stream-car s3) 0.1)
               n)
              ((and (< (stream-car s1) (stream-car s2)) (< (stream-car s1) (stream-car s3)))
               (convergence-helper (stream-cdr s1) s2 s3 (+ n 1)))
              ((and (> (stream-car s3) (stream-car s1)) (> (stream-car s3) (stream-car s2)))
               (convergence-helper s1 s2 (stream-cdr s3) (+ n 1)))
              (else (convergence-helper s1 (stream-cdr s2) s2 (+ n 1)))))
    (convergence-helper str1 str2 str3 1))