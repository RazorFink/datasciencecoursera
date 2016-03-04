## Subsetting ##
There are a number of operators that can be used ot extract subsets of R objects.
* `[` always returns an object of the same class as the original; can be used to select more than on element (there is one exception)
* `[[` is used to extract elements of a list or a data frame; it can only be used to extract a single element and the clasee of the returned object will not necessarily be a list or data frame
* $ is used to extract elements of a list or a data frame by name; semantics are similar to that of `[[`.

Numerical Index:
'''
> x <- c("a", "b", "c", "c", "d", "a")
> x[1]
[1] "a"
> x[2]
[1] "b"
> x[1:4]
[1] "a" "b" "c" "c"
'''

Logical Index or Vector:
'''
> x <- c("a", "b", "c", "c", "d", "a")
> x[x > "a"]
[1] "b" "c" "c" "d"
> u <- x > "a"
> u
[1] FALSE  TRUE  TRUE  TRUE  TRUE FALSE
> x[u]
[1] "b" "c" "c" "d"
'''
## Subsetting Lists ##
> x <- list(foo = 1:4, bar = 0.6)
> x[1]
$foo
[1] 1 2 3 4

> x[[1]]
[1] 1 2 3 4
> attributes(x[1])
$names
[1] "foo"

> attributes(x[[1]])
NULL
> x$foo
[1] 1 2 3 4
> x$bar
[1] 0.6
> x["bar"]
$bar
[1] 0.6

> x[["bar"]]
[1] 0.6
'''
Get multiple elements
'''
> x <- list("foo" = 1:5, "bar" = 0.6, "baz" = "forty-two")
> x[c(1,3)]
$foo
[1] 1 2 3 4 5

$baz
[1] "forty-two"

> x[c("foo", "bar")]
$foo
[1] 1 2 3 4 5

$bar
[1] 0.6
'''
`[[` operator can use a computed value for an index.
`$` can only be used with literal names.
'''
> x <- list("foo" = 1:5, "bar" = 0.6, "baz" = "forty-two")
> name <- "foo"
> x[[name]]
[1] 1 2 3 4 5
> x$name
NULL
> x$foo
[1] 1 2 3 4 5
'''

## Subsetting Nested Elements ##
`[[` can take an integer sequence.
'''
> x <- list(a = c(10, 12, 14), b = c(3.14, 2.72))
> x[[c(1, 3)]]
[1] 14
> x[[c(1, 1)]]
[1] 10
> x[[c(2, 1)]]
[1] 3.14
> x[[1]]
[1] 10 12 14
> x[[1]][[2]]
[1] 12
'''

## Subsetting Matrices ##
Matrices can be subsetted in the usual way with (i, j) type indices.
'''
> x <- matrix(1:6, 2, 3)
> x
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
> x[1, 2]
[1] 3
> x[2, 1]
[1] 2
'''
Indices can also be missing.
'''
> x[1,]
[1] 1 3 5
> x[,2]
[1] 3 4
'''
By default, when a single element of a matrix is retrieved, it is returned as a vector of length = 1 rather than a 1 x 1 matrix.  This behavior can be turned off by setting drop = FALSE.
'''
> x[1,3]
[1] 5
> x[1,3, drop = F]
     [,1]
[1,]    5
'''
Similarly, subsetting a single column or row will return a vector, not a matrix.
'''
> x[1,]
[1] 1 3 5
> x[1,,drop = F]
     [,1] [,2] [,3]
[1,]    1    3    5
'''

## Partial Matching ##
You can match partial names with `$` and `[[`.
'''
> x <- list(aardvark = 145, aqua = 22)
> x$a
NULL
> x$aa
[1] 145
> x[["aa"]]
NULL
> x[["aa", exact = F]]
[1] 145
'''

## Removing NA Values ##
A logical vector can work like a bit mask.
'''
> x <- c(1, 2, NA, 4, 5, NA, 7)
> bad <- is.na(x)
> bad
[1] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE
> x[bad]
[1] NA NA
> x[!bad]
[1] 1 2 4 5 7
> m <- c(T, T, T, F, F, F, F)
> m
[1]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
> x[m]
[1]  1  2 NA
> !m
[1] FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
> x[!m]
[1]  4  5 NA  7
'''
`complete.cases()`
