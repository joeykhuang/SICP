(define (make-vect x-vec y-vec)
    (cons x-vec y-vec))

(define xcor-vect car)
(define ycor-vect cdr)

(define (add-vect first-vec second-vec)
    (make-vect (+ (xcor-vect first-vec) (xcor-vect second-vec))
               (+ (ycor-vect first-vec) (ycor-vect second-vec))))

(define (sub-vect first-vec second-vec)
    (add-vect first-vec (scale-vec -1 second-vec)))

(define (scale-vec scale-factor vec)
    (make-vect (* scale-factor (xcor-vect vec)) (* scale-factor (ycor-vect vec))))k