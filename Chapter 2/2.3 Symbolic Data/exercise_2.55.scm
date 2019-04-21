(car ''abracadabra)
; the compiler believes the input (car ''abracadabra) as a list that is interpreted as
; (' (abracadabra))
; therefore, the first element (car) of the list is a quote literal " ' "