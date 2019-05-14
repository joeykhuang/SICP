# Exercise 3.38

Peter: (set! balance (+ balance 10)) **a**
Paul: (set! balance (- balance 20)) **b**
Mary: (set! balance (- balance (/ balance 2))) **c**

## Sequential Processes

1: a - b - c
    --> balance = 100 + 10 - 20 - (100 + 10 - 20) / 2 = 45
2: a - c - b
    --> balance = 100 + 10 - (100 + 10) / 2 - 20      = 35
3: b - a - c
    --> balance = 100 - 20 + 10 - (100 - 20 + 10) / 2 = 45
4: b - c - a
    --> balance = 100 - 20 - (100 - 20) / 2 + 10      = 50
5: c - a - b
    --> balance = 100 - 100 / 2 + 10 - 20             = 40
6: c - b - a
    --> balance = 100 - 100 / 2 - 20 + 10             = 40

## Interleaved Processes

1: ()