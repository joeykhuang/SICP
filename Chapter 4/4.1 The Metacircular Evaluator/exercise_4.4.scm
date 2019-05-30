(load "Chapter 4/4.1 The Metacircular Evaluator/exercise_4.3.scm")

; --- boolean operations

(define (and? exp) (tagged-list? exp 'and ))
(define (eval-and exp env)
    (define (eval-and-helper exp)
        (cond ((last-exp? exp) (eval (first-exp exp) env))
              ((not (eval (first-exp exp) env)) true)
              (else (eval-and env (rest-exps exp)))))
    (eval-and-helper (cdr exp) env))

(define (or? exp) (tagged-list? exp 'or ))
(define (eval-or exp env)
    (define (eval-or-helper exp)
        (cond ((last-exp? exp) (eval (first-exp exp) env))
              ((eval (first-exp exp) env) true)
              (else (eval-or env (rest-exps exp)))))
    (eval-or-helper (cdr exp) env))

(put-syntax! 'and eval-and)
(put-syntax! 'or eval-or)