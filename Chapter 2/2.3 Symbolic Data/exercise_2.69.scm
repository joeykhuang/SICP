(load "Chapter 2/2.3 Symbolic Data/huffman-encoding.scm")
(define (generate-huffman-tree pairs)
    (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
    (cond ((null? leaf-set) '())
          ((null? (cdr leaf-set)) (car leaf-set))
          (else (successive-merge (adjoin-set 
                                   (make-code-tree (car leaf-set)
                                                   (cadr leaf-set))
                                   (cddr leaf-set))))))