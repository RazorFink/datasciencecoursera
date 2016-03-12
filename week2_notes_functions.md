## Functions ##
* functions are created with the `function()` directive
* automatically return the output of the last expression
* default value can be specified in the argument list
* functions are objects of the class function

## Arguments ##
Functions have named arguments which may have default values assigned
* Formal Arguments are those included in the function definition
* The `formals` function returns a list of all the formal arguments in the function
* Not every function call in R uses all the formal arguments
* Function arguments can be missing or have default values.

## Argument Matching ##
can be matched positionally or by name
can be matched with a partial name as long as it's unique in the arg list

## Lazy Evaluation ##
Function arguments are only evaluated once they are used. 
So a missing argument won't cause an error until it is evaluated.

## The "..." Argument ##
Indicates a variable number of arguments
Often used to pass along a list of arguments to an inner function call
Necessary when number of arguments cannot be known in advance.
`paste()` and `cat()` functions is a good example.  Accepts an arbitrary number of arguments along with some named arguments
Partial matching cannot be used with `...` argument
