(define (squarer a b)
    (multiplier a a b))

; The serious flaw that is present with Louis Reasoner's idea is that you cannot change the value
;   of a once it has been set because the multiplier procedure checks the new value with the value
;   already set in a (the second object). Therefore, although the two "a" objects are the same to the 
;   compiler, the multipler procedure regards the value already set in a (the first object) to be
;   different than the value set in a (the second object) when we try to change the value of a. 