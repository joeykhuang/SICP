(define (attach-tag type-tag contents)
    (cons type-tag contents))

(define (type-tag datum)
    (if (pair? datum)
        (car datum)
        (error "Bad tagged datum: TYPE-TAG" datum)))

(define (contents datum)
    (if (pair? datum)
        (cdr datum)
        (error "Bad tagged datum: TYPE-TAG" datum)))

(define (get-record employee-name personnel-file)
    ((get 'get-record personnel-file) employee-name))

(define (get-salary employee-name personnel-file)
    ((get 'get-salary (get ('get-record personnel-file) employee-name))))

(define (find-employee-record employee-name division-files)
    (apply-generic (get-record (car division-files))
                   (find-employee-record employee-name (cdr division-files))))