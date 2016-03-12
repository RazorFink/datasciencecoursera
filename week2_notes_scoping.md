## Lexical Scoping ##
A function defined inside another function gets closure on the variables of the "constructor" function.
'''
make.power <- function(n) {
    pow <- function(x) { 
        x^n
    }
    pow
}
'''
`make.power` returns a function as its value.
'''
> cube <- make.power(3)
> square <- make.power(2)
> square(4)
[1] 16
> cube(4)
[1] 64
'''

## Function Closure Environment ##
`cube` and `square` have the same environment, but different values for `n`.
'''
> ls(environment(cube))
[1] "n"   "pow"
> get("n", environment(cube))
[1] 3
> ls(environment(square))
[1] "n"   "pow"
> get("n", environment(square))
[1] 2
'''

## Lexical vs. Dynamic Scoping ##
In Lexical (or Staticc) scoping, the value of a variable is looked up in the environment in which it was defined.
In Dynamic scoping, the value of a variable is looked up in the environment from which it was called.
In R, the calling environment is known as the "Parent Frame".
This is why closures work the way they do.
