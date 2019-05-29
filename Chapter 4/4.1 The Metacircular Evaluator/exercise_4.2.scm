; Louis's plan

(define (eval exp env)
    (cond ((self-evaluating? exp) exp)
          ; ...
          ((application? exp)
           (apply (eval (operator exp) env)
                  (list-of-values (operands exp) env)))
          ((assignment? exp) (eval-assignment exp env))
          ; ...
          (else
           (error "Unknown expression type: EVAL" exp))))

; Louis's plan will not work because (define x 3) will not establish the correct environment for the 
;   program to run correctly

(define (application? exp) (tagged-list? exp 'call ))
(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))