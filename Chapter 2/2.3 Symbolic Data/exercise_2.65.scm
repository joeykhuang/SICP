(load "Chapter 2/2.3 Symbolic Data/exercise_2.63.scm")
(load "Chapter 2/2.3 Symbolic Data/exercise_2.64.scm")
(load "Chapter 2/2.3 Symbolic Data/exercise_2.60.scm")
(define (union-tree tree1 tree2)
    (list-tree (union-set (tree-list-1 tree1)
                          (tree-list-1 tree2))))

(define (intersection-tree tree1 tree2)
    (list-tree (intersection-set (tree-list-1 tree1)
                                 (tree-list-1 tree2))))