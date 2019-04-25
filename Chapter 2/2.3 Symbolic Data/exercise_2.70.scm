(load "Chapter 2/2.3 Symbolic Data/exercise_2.69.scm")
(load "Chapter 2/2.3 Symbolic Data/exercise_2.68.scm")
(define lyric-pairs '((A 2) (GET 2) (SHA 3) (WAH 1)
                      (BOOM 1) (JOB 2) (NA 16) (YIP 9)))
(define lyric-tree (generate-huffman-tree lyric-pairs))
(define message '(Get a job
                  Sha na na na na na na na na
                  Get a job
                  Sha na na na na na na na na
                  Wah yip yip yip yip yip yip yip yip yip
                  Sha boom))

(define encoded-message (encode message lyric-tree))

(length encoded-message) ; 84 bits long