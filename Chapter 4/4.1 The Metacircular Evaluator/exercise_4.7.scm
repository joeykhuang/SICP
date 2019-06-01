(load "Chapter 4/4.1 The Metacircular Evaluator/exercise_4.6.scm")
(define (let*? exp) (tagged-list? exp 'let* ))
(define (let*-clauses exp) (cadr exp))
(define (let*-body exp) (cddr exp))
(define (make-let clause body) (cons 'let (cons clause body)))

(define (let*->nested-lets exp)
    (define (let*->nested-lets-helper clauses body)
        (if (null? clauses)
            body
            (make-let (car clauses)
                      (let*->nested-lets-helper (cdr clauses) body))))
    (let*->nested-lets-helper (let*-clauses exp)
                              (let*-body exp)))

; It is enough to extend the evaluator to handle let* with
;   (eval (let*->nested-lets exp) env)

(define (eval-let* exp env)
    (eval (let*->nested-lets exp) env))

(put-syntax! 'let* eval-let*)