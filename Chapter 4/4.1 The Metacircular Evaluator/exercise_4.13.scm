(load "Chapter 4/4.1 The Metacircular Evaluator/exercise_4.12.scm")
(define (make-unbound! var env)
    (env-loop env var '() (lambda (x) (set! x (cdr x))))
    'ok )