(define (front-ptr deque) (car deque))
(define (rear-ptr deque) (cdr deque))

(define (set-front-ptr! deque item)
    (set-car! deque item))
(define (set-rear-ptr! deque item)
    (set-cdr! deque item))

(define (empty-deque? deque)
    (null? (front-ptr deque)))

(define (make-deque) (cons '() '()))

(define (front-deque deque)
    (if (empty-deque? deque)
        (error "FRONT called with an empty deque" deque)
        (car (front-ptr deque))))
(define (rear-deque deque)
    (if (empty-deque? deque)
        (error "REAE called with an empty deque" deque)
        (car (rear-ptr deque))))

(define (front-insert-deque! deque item)
    (let ((new-pair (cons item '())))
        (cond ((empty-deque? deque)
                (set-front-ptr! deque new-pair)
                (set-rear-ptr! deque new-pair)
                deque)
              (else
                (set-cdr! new-pair (front-ptr deque))
                (set-front-ptr! deque new-pair)
                deque))))

(define (rear-insert-deque! deque item)
    (let ((new-pair (cons item '())))
        (cond ((empty-deque? deque)
                (set-front-ptr! deque new-pair)
                (set-rear-ptr! deque new-pair)
                deque)
              (else
                (set-cdr! (rear-ptr deque) new-pair)
                (set-rear-ptr! deque new-pair)
                deque))))

(define (front-delete-deque! deque)
    (cond ((empty-deque? deque)
            (error "DELETE! called with an empty deque" deque))
          (else
            (set-front-ptr! deque (cdr (front-ptr deque)))
            deque)))

; Can't accomplish this procedure in O(1) steps due to the singly-linked list
;   interpretation of the deque in this assignment
; TODO: create a doubly-linked list implementation
(define (rear-delete-deque! deque)
    (define (set-last! list item)
        (if (null? (cddr list))
            (set-cdr! list item)
            (set-last! (cdr list) item)))
    (cond ((empty-deque? deque)
            (error "DELETE! called with an empty deque" deque))
          ((null? (cdr (front-ptr deque)))
            (set-front-ptr! deque '())
            (set-rear-ptr! deque '())
            deque)
          (else
            (set-last! (front-ptr deque) '())
            (set-rear-ptr! deque (last (front-ptr deque)))
            deque)))