(load "Chapter 3/3.3 Modeling with Mutable Data/wire-representation.scm")
(load "Chapter 3/3.3 Modeling with Mutable Data/agenda.scm")
; (define a (make-wire))
; (define b (make-wire))
; (define c (make-wire))
; (define d (make-wire))
; (define e (make-wire))
; (define s (make-wire))

; (or-gate a b d)
; (and-gate a b c)
; (inverter c e)
; (and-gate d e s)

(define (half-adder a b s c)
    (let ((d (make-wire)) (e (make-wire)))
        (or-gate a b d)
        (and-gate a b c)
        (inverter c e)
        (and-gate d e s)
        'ok ))

(define (full-adder a b c-in sum c-out)
    (let ((s (make-wire)) (c1 (make-wire)) (c2 (make-wire)))
        (half-adder b c-in s c1)
        (half-adder a s sum c2)
        (or-gate c1 c2 c-out)
        'ok ))

(define (inverter input output)
    (define (inver-input)
        (let ((new-value (logical-not (get-signal input))))
            (after-delay inverter-delay
                (lambda () (set-signal! output new-value)))))
    (add-action! input inver-input) 
    'ok )

(define (logical-not s)
    (cond ((= s 0) 1)
          ((= s 1) 0)
          (else (error "Invalid signal" s))))

(define (logical-and a b)
    (if (and (= a 1) (= b 1))
        1
        0))

(define (logical-or a b)
    (if (and (= a 0) (= b 0))
        0
        1))

(define (and-gate a1 a2 output)
    (define (and-action-procedure)
        (let ((new-value
                (logical-and (get-signal a1) (get-signal a2))))
            (after-delay
             and-gate-delay
             (lambda () (set-signal! output new-value)))))
    (add-action! a1 and-action-procedure)
    (add-action! a2 and-action-procedure)
    'ok )

(define (or-gate a1 a2 output)
    (define (or-action-procedure)
        (let ((new-value
                (logical-or (get-signal a1) (get-signal a2))))
            (after-delay
             or-gate-delay
             (lambda () (set-signal! output new-value)))))
    (add-action! a1 or-action-procedure)
    (add-action! a2 or-action-procedure)
    'ok )