; interpreter result
; (1 (2 (3 4)))

; box-and-pointer structure
; [1][2 [3   4]]
;    [2] [3   4]
;        [3] [4]

; tree-structure
; (1 (2 (3 4)))
;     / \
;   1  (2 (3 4))
;         / \
;        2 (3 4)
;            / \
;           3   4