(define (lookup-variable-value var env)
    (define (env-loop env)
        (define (scan vars vals)
            (cond ((null? vars)
                   (env-loop (enclosing-environment env)))
                  ((and (eq? var (car vars))
                        (eq? (car vars) '*unassigned* ))
                   (error "Unassigned variable: LOOKUP-VARIABLE-VALUE"))
                  ((eq? var (car vars)) (car vals))
                  (else (scan (cdr vars) (cdr vals)))))
        (if (eq? env the-empty-environment)
            (error "Unbound variable" var)
            (let ((frame (first-frame env)))
                (scan (frame-variables frame)
                      (frame-values frame)))))
    (env-loop env))

(define (scan-out-defines body)
  (let ((defined-vars (definitions body)))
    (if (null? defined-vars)  
        body
        (list 
         (make-let-seq  
          (unassigned-definitions defined-vars)
          (unassigned-initialisations defined-vars)
          (scanned-body body))))))
 
(define (definitions exp)
  (define (scan-iter body definitions-complete)
    (cond ((null? body) null)
          ((definition? (car body))
           (if definitions-complete
               (error "define cannot appear in an expression context - DEFINITIONS" exp)
               (cons (car body) 
                     (scan-iter (cdr body) #f))))
          (else (scan-iter (cdr body) #t))))
  (scan-iter exp #f))
 
(define (make-let-seq unassigned-vars initial-values body)
  (append (list 'let unassigned-vars)
          initial-values 
          body))
 
(define (unassigned-definitions define-list)
  (map (lambda (def)  
         (list (definition-variable def) 
               '(quote *unassigned*)))
       define-list))
 
(define (unassigned-initialisations define-list)
  (map (lambda (def)  
         (list 'set! (definition-variable def) 
               (definition-value def)))
       define-list))
 
(define (scanned-body body)
  (cond ((null? body) body)
        ((definition? (car body)) (scanned-body (cdr body))) 
        (else (cons (car body) 
                    (scanned-body (cdr body))))))

(define (scan-out-defines body)
  (let ((defined-vars (definitions body)))
    (if (null? defined-vars)  
        body
        (list 
         (make-let-seq  
          (unassigned-definitions defined-vars)
          (unassigned-initialisations defined-vars)
          (scanned-body body))))))
 
(define (definitions exp)
  (define (scan-iter body definitions-complete)
    (cond ((null? body) null)
          ((definition? (car body))
           (if definitions-complete
               (error "define cannot appear in an expression context - DEFINITIONS" exp)
               (cons (car body) 
                     (scan-iter (cdr body) #f))))
          (else (scan-iter (cdr body) #t))))
  (scan-iter exp #f))
 
(define (make-let-seq unassigned-vars initial-values body)
  (append (list 'let unassigned-vars)
          initial-values 
          body))
 
(define (unassigned-definitions define-list)
  (map (lambda (def)  
         (list (definition-variable def) 
               '(quote *unassigned*)))
       define-list))
 
(define (unassigned-initialisations define-list)
  (map (lambda (def)  
         (list 'set! (definition-variable def) 
               (definition-value def)))
       define-list))
 
(define (scanned-body body)
  (cond ((null? body) body)
        ((definition? (car body)) (scanned-body (cdr body))) 
        (else (cons (car body) 
                    (scanned-body (cdr body))))))