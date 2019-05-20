# Exercise 3.57

How many additions are performed when we compute the nth Fibonacci number using the definition of fibs
based on the add-streams procedure? Show that the number of additions would be exponentially greater
if we had implemented (delay ⟨exp⟩) simply as (lambda () ⟨exp⟩), without using the optimization provided
by the memo-proc procedure described in Section 3.5.1.64

To compute the nth fibonacci number, the add-streams procedure only needs to calculate n calculations
with memoization Φ^n th calculations without memoization.