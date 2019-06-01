(load "Chapter 4/4.1 The Metacircular Evaluator/exercise_4.7.scm")

(define (let? exp) (tagged-list? exp 'let ))
(define (named-let? expr)
  (and (let? expr) (symbol? (cadr expr))))  

(define (named-let-name expr) (cadr expr))
(define (named-let-body expr) (cdddr expr))
(define (named-let-parameters expr) (map car (caddr expr)))
(define (named-let-exp expr) (map cadr (caddr expr)))


(define (named-let->func expr)
  (list 'define
    (cons (named-let-name epxr)
          (named-let-parameters expr))
    (named-let-body expr)))

(define (let->combination expr)
  (if (named-let? expr)
      (sequence->exp
       (list (named-let->func expr)
         (cons (named-let-name expr) 
           (named-let-exp expr))))
      (cons (make-lambda (let-vars expr)
             (list (let-body expr)))
        (let-exp expr))))

(define (eval-let exp env) (eval (let->combination exp) env))

(put-syntax! 'let eval-let)