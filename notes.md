## Assignment ##
`<-` is the assignment operator
`=` also works, apparently

Numeric Vector with one element:
'''
> x <- 5
> print(x)
[1] 5
'''
String Vector with one element:
'''
> msg <- "hello"
> print(msg)
hello
'''
Numeric (integer) Vector with multiple elements:
'''
> xx <- 1:30
> xx
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
[26] 26 27 28 29 30
'''

## Objects ##
* character
* numeric
* integer
* complex
* logical

A Vector must be composed of objects with the same class.

A List is like a vector but can contain objects with differen classes

Empty vectors can be created with the `vector(class, length)` function

## Numbers ##
Numbers are generally treated as double precision real numbers.

Inf == Infinity

NaN == Not a Number (or missing value)

## Attributes ##

Objects have attributes

* names, dimnames
* dimensions (eg. matrices, arrays)
* class
* length
* Other user-defined attributes

Attributes can be set or defined with the `attributes()` function.

## Creating Vectors ##
c() function can be used to create vectors of objects
'''
> numeric <- c(12, 2, 5, 6, 7, 7.0)
> numeric_f <- c(12, 2, 5, 6, 7, 7.2)
> logical <- c(TRUE, FALSE, T, F)
> character <- c("a", "b", 'd', 'face')
> integer_range <- 9:29
> complex <- c(1+0i, 2+4i)
> logical
[1]  TRUE FALSE  TRUE FALSE
> numeric
[1] 12  2  5  6  7  7
> numeric_f
[1] 12.0  2.0  5.0  6.0  7.0  7.2
> logical
[1]  TRUE FALSE  TRUE FALSE
> character
[1] "a"    "b"    "d"    "face"
> integer_range
 [1]  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29
> complex
[1] 1+0i 2+4i
'''
