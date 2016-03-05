## if else ##
`if` can be used for an assignment predicate, or in typical procedural fashion.

'''
> y <- if(10 < 9){ "a" } else { "b" }
> y
[1] "b"
> if(10 < 9){ "a" } else { "b" }
[1] "b"
'''

## for (in) ##
loop over sequences or vectors
curly braces not needed for single line
'''
> x <- c("a", "b", "c", "d")
> for(i in 1:4){ print(x[i]) }
[1] "a"
[1] "b"
[1] "c"
[1] "d"
> for (i in seq_along(x)){print(i)}
[1] 1
[1] 2
[1] 3
[1] 4
> for (l in x){ print(l) }
[1] "a"
[1] "b"
[1] "c"
[1] "d"
'''

## while loop ##
takes a logical expression
loops while expression is true

## repeat, next, break ##
`repeat` loops until `break`
`next` jump to next iteration
`return` exits a loop if inside a function

