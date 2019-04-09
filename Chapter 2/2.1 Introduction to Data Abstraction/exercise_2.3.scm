(require "exercise_2.2.scm")
; store as points
(define (make-rectangle-points bottom-left top-right)
  (cons bottom-left top-right))

(define (bottom-left-points r)
  (car r))

(define (top-right-points r)
  (cdr r))

; store as segments
(define (makeg-rectangle-segments bottom-left top-right)
  (cons 
   (make-segment ; left side
    bottom-left
    (make-point
     (x-point bottom-left)(y-point top-right)))
   (make-segment ; bottom side
    bottom-left
    (make-point
     (x-point top-right)(y-point bottom-left)))))

(define (bottom-left-segments r)
  (let ((left-side (car r)))
    (start-segment left-side)))

(define (top-right-segments r)
  (let ((left-side (car r))
        (bottom-side (cdr r)))
    (make-point
     (x-point (end-segment bottom-side))
     (y-point (end-segment left-side)))))

(define (square x) (* x x))

(define (length-segment s)
  (let ((x (abs (- (x-point (start-segment s)) (x-point (end-segment s)))))
        (y (abs (- (y-point (start-segment s)) (y-point (end-segment s))))))
    (sqrt (+ (square x) (square y)))))

(define (bottom-side-of-rectangle r)
    (make-segment
     (bottom-left-rectangle r)
     (make-point (x-point (top-right-rectangle r)) (y-point (bottom-left-rectangle r)))))
  
(define (perimeter-rectangle r)
    (+ (* 2 (length-segment (left-side-of-rectangle r)))
       (* 2 (length-segment (bottom-side-of-rectangle r)))))