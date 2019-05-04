(define (make-simplified-withdraw balance)
    (lambda (amount)
        (set! balance (- balance amount))
        balance))

(define W (make-simplified-withdraw 25))

(define (make-decremeter balance)
    (lambda (amount)
        (- balance amount)))

(define D (make-decremeter 25))

(define D1 (make-decremeter 25))
(define D2 (make-decremeter 25))
; here, D1 and D2 have the same computational behavior, so D1 and D2 are the same

(define W1 (make-simplified-withdraw 25))
(define W2 (make-simplified-withdraw 25))
; however, W1 and W2 do not have the same computational behavior because they have
;   different local state variables, so W1 and W2 are not the same

; imperative programming way of factorial
(define (factorial n)
    (let ((product 1)
          (counter 1))
        (define (iter)
            (if (> counter n)
                product
                (begin (set! product (* counter product))
                       (set! counter (+ counter 1))
                       (iter))))
        (iter)))