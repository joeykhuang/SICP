(load "Chapter 2/2.1 Introduction to Data Abstraction/interval_abstractions.scm")
(define (mul-interval-simplified x y)
  (let ((a (lower-bound x))
	    (b (upper-bound x))
	    (c (lower-bound y))
	    (d (upper-bound y)))
    (cond ((and (> a 0) (> b 0))
	       (cond ((and (> c 0) (> d 0))
		            (make-interval (* a c) (* b d)))
		         ((and (< c 0) (> d 0))
		            (make-interval (* b c) (* b d)))
		         ((and (< c 0) (< d 0))
		            (make-interval (* b d) (* a c)))))
	      ((and (< a 0) (> b 0))
	       (cond ((and (> c 0) (> d 0))
		            (make-interval (* a d) (* a c)))
		         ((and (< c 0) (> d 0))
		            (make-interval (min (* a d) (* b c))
				                   (max (* a c) (* b d))))
		         ((and (< c 0) (< d 0))
		            (make-interval (* b d) (* a d)))))
	      ((and (< a 0) (< b 0))
	       (cond ((and (> c 0) (> d 0))
		            (make-interval (* b d) (* a c)))
		         ((and (< c 0) (> d 0))
		            (make-interval (* b d) (* b c)))
		         ((and (< c 0) (< d 0))
                    (make-interval (* a c) (* b d))))))))

; center-width constructor

(define (make-center-width c w)
    (make-interval (- c w) (+ c w)))
(define (center-width z)
    (/ (+ (lower-bound z) (upper-bound z)) 2))
(define (width z)
    (/ (- (upper-bound z) (lower-bound z)) 2))

