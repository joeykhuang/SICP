(load "Chapter 4/4.1 The Metacircular Evaluator/exercise_4.5.scm")

(define (let? exp) (tagged-list? exp 'let ))
(define (let-clauses exp) (cadr exp))
(define (let-body exp) (caddr exp))
(define (let-vars clause) (map car clause))
(define (let-exps clause) (map cadr clause))
(define (let->combination exp)
    (append (list (make-lambda (let-vars (let-clauses exp))
                       (let-body exp)))
            (let-exps (let-clauses exp))))

(define (eval-let exp env) (eval (let->combination exp) env))

(put-syntax 'let eval-let)