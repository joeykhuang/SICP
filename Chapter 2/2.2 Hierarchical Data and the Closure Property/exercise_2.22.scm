(define (square-list items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                  (cons answer
                        (square (car things))))))
    (iter items '()))

; each iteration takes the list (answer, (square (car things))) and 
; squares both elements, taking both as the car of the next iteration