(load "Chapter 2/2.1 Introduction to Data Abstraction/exercise_2.8.scm")
; defining width after arithmetic
(define (width x)
    (/ (- (upper-bound x) (lower-bound x)) 2.0))

(define (add-then-width x y)
    (width (add-interval x y)))

(define (sub-then-width x y)
    (width (sub-interval x y)))

(define (mul-then-width x y)
    (width (mul-interval x y)))

(define (div-then-width x y)
    (width (div-interval x y)))

; defining width before arithmetic

(define (width-then-add x y)
    (let ((x-width (width x))
          (y-width (width y)))
    (+ x-width y-width)))

(define (width-then-sub x y)
    (let ((x-width (width x))
          (y-width (width y)))
    (- x-width y-width)))

(define (width-then-mul x y)
    (let ((x-width (width x))
          (y-width (width y)))
    (* x-width y-width)))

(define (width-then-div x y)
    (let ((x-width (width x))
          (y-width (width y)))
    (/ x-width y-width)))