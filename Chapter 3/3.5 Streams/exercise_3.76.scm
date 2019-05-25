(define (smooth smooth-stream)
    (cons-stream
     (/ (+ (stream-car smooth-stream)
           (stream-car (stream-cdr smooth-stream))) 2)
     (smooth (stream-cdr smooth-stream))))

(define (make-zero-crossings input-stream)
    (stream-map sign-change-detector input-stream (stream-cdr input-stream)))

(define (smoothed-zero-crossings input-stream)
    (make-zero-crossings (smooth input-stream)))