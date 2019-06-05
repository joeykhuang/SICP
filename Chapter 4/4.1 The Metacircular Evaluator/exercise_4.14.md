# Exercise 4.14

When the initial environment is set up we extend the empty environment with a frame
made the primitive procedures we want to be usable in our language. For example the
scheme primitive + is added to the frame with var = ‘+ and value = ‘(primitive +)
and map is the same.

But when the evaluator tries to evaluate, for example '(map + '(1 2) '(3 4)) it
calls:
    (apply (eval (operator exp) env)
    => (list-of-values (operands exp) env)))

(eval (operator exp) env) – returns scheme’s own map procedure, but list-of-values
doesn’t produce a result which scheme’s map can use.

list-of-values returns a list made by calling eval with each operand. The first
operand is ‘+ which eval treats as a variable, since it is a symbol; when it looks
up the value in the environment the value returned is ‘(primitive +) which scheme’s
built in map can’t use.
