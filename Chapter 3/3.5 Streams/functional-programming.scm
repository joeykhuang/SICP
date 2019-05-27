(define (stream-withdraw balance amount-stream)
    (cons-stream
     balance
     (stream-withdraw (- balance (stream-car amount-stream))
                      (stream-cdr amount-stream))))