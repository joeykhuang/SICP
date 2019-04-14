(load "Chapter 2/2.2 Hierarchical Data and the Closure Property/tree-operations.scm")
(define (make-mobile left right)
    (list left right))
(define (make-branch length structure)
    (list length structure))

; part a
(define (left-branch mobile)
    (car mobile))
(define (right-branch mobile)
    (car (cdr mobile)))
(define (branch-length branch)
    (car branch))
(define (branch-structure branch)
    (car (cdr branch)))

; part b
(define (calculate-weight branch total-weight)
        (if (pair? (branch-structure branch))
            (+ (calculate-weight (left-branch branch)) (calculate-weight (right-branch branch)))
            (+ total-weight (branch-structure branch))))

(define (total-weight mobile)
    (+ (calculate-weight (left-branch mobile) 0) (calculate-weight (right-branch mobile) 0)))

; part c
(define (is-balanced? mobile)
    (= (* (branch-length (left-branch mobile))
            (calculate-weight (left-branch mobile) 0))
        (* (branch-length (right-branch mobile))
            (calculate-weight (right-branch mobile) 0))))

; part d
(define (make-mobile left right) (cons left right))
(define (make-branch length structure) (cons length structure))
(define left-branch car)
(define right-branch cdr)
(define branch-length car)
(define branch-structure cdr)