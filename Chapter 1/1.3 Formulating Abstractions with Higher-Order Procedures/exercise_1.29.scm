(load "sigma_notation.scm")

(define (integral f a b n)
    (define h (/ (- b a) (* 1.0 n)))
    (define (next x) (+ x (* 2 h)))
    (* (/ h 3) (+ (f a) 
                  (f b) 
                  (* 4 (sum f (+ a h) next b))
                  (* 2 (sum f (+ a (* 2 h)) next b))))
)