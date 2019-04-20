(define (segments->painter segment-list)
    (lambda (frame)
        (for-each 
         (lambda (segment) 
            (draw-line 
                ((frame-coord-map frame) 
                 (start-segment segment))
                ((frame-coord-map frame)
                 (end-segment segment))))
        segment-list)))
    
(define (outline-frame-painter frame)
    (segments->painter 
            (list (make-segment (cadr frame))))