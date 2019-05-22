(load "Chapter 3/3.5 Streams/stream-pairs.scm")
(define (merge-weighted s t weight)
    (cond ((stream-null? s) t)
          ((stream-null? t) s)
          (else
            (let ((s-car (stream-car s))
                  (t-car (stream-car t)))
                (cond ((< (weight s-car) (weight t-car))
                       (cons-stream s-car (merge-weighted (stream-cdr s) t weight)))
                      ((> (weight s-car) (weight t-car))
                       (cons-stream t-car (merge-weighted s (stream-cdr t) weight)))
                      (else
                       (cons-stream s-car (cons-stream t-car
                                    (merge-weighted (stream-cdr s)
                                                    (stream-cdr t)
                                                    weight)))))))))

(define (weighted-pairs s t weight)
    (cons-stream
        (list (stream-car s) (stream-car t))
        (merge-weighted
            (stream-map (lambda (x) (list (stream-car s) x))
                        (stream-cdr t))
            (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
            weight)))
; Part a

(define (a-weight p)
    (+ (car p) (cadr p)))

(define a-stream (weighted-pairs integers integers a-weight))

; Part b

(define (b-weight p)
    (+ (* 2 (car p)) (* 3 (cadr p)) (* 5 (car p) (cadr p))))

(define b-stream (stream-filter
                  (lambda (x) (not (or (= (remainder (car x) 2) 0)
                                  (= (remainder (car x) 3) 0)
                                  (= (remainder (car x) 5) 0)
                                  (= (remainder (cadr x) 2) 0)
                                  (= (remainder (cadr x) 3) 0)
                                  (= (remainder (cadr x) 5) 0))))
                 (weighted-pairs integers integers b-weight)))