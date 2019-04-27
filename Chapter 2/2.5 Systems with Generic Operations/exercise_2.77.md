this works because the complex datatype does not explicitly have an operation
called magnitude definied in the table, so the table correlating the types to
the operations must be filled out with the following lines of code

(put 'real-part '(complex) real-part)
(put 'imag-part '(complex) imag-part)
(put 'magnitude '(complex) magnitude)
(put 'angle '(complex) angle)

apply-generic is invoked twice, once to determine the datatype of the numbers
(complex), and the other to determine the rectangular or polar representation
of the complex number z. 