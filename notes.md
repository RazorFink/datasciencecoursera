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
vector() function initializes an empty vector
'''

## Mixing Objects ##

Coercion is used to force mixed types to be the same when used in the same vector.
'''
> v <- c(1.7, "a")
> v
[1] "1.7" "a"
> y <- c(TRUE, 2)
> y
[1] 1 2
> y <- c("a", TRUE)
> y
[1] "a"    "TRUE"
'''

## Explicit Coercion ##
Explicity coersce using the `as.*()` function
Show type using `class()` function
'''
> x <- 0:6
> class(x)
[1] "integer"
> as.numeric(x)
[1] 0 1 2 3 4 5 6
> as.logical(x)
[1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
> as.character(x)
[1] "0" "1" "2" "3" "4" "5" "6"
'''
Nonsensical coercion results in NA (and a warning)
## Lists ##
Lists are a special kind of vector that can contain different object types.
Lists have double-brackets

```
> x <- list(1, 2, "a", TRUE, 1 + 4i)
> x
[[1]]
[1] 1

[[2]]
[1] 2

[[3]]
[1] "a"

[[4]]
[1] TRUE

[[5]]
[1] 1+4i
```

## Matrices ##

A special type of vector.
Have dimension attribute.
Dimension attribute is itself an integer vector of length 2 (nrow, ncol)

'''
> m <- matrix(nrow = 2, ncol = 3)
> m
     [,1] [,2] [,3]
[1,]   NA   NA   NA
[2,]   NA   NA   NA
> dim(m)
[1] 2 3
> attributes(m)
$dim
[1] 2 3
'''

Matricies are filled column-wise.  So each column of the first row is filled,
then the remaining data overflows into the columns of subsequent rows.
'''
> m <- matrix(1:6, nrow = 2, ncol = 3)
> m
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
> m <- matrix(1:6)
> m
     [,1]
[1,]    1
[2,]    2
[3,]    3
[4,]    4
[5,]    5
[6,]    6
> m <- matrix(1:6, nrow = 2)
> m
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
> m <- matrix(1:6, nrow = 3)
> m
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
> m <- matrix(1:7, nrow = 3)
Warning message:
In matrix(1:7, nrow = 3) :
  data length [7] is not a sub-multiple or multiple of the number of rows [3]
'''

Matrices can also be created directly from vectors by adding a dimension attribute.
'''
> m <- 1:10
> m
 [1]  1  2  3  4  5  6  7  8  9 10
> dim(m) <- c(2,5)
> m
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    3    5    7    9
[2,]    2    4    6    8   10
'''

Matrices can be created by column_binding or row_binding 
with cbind() and rbind().
'''
> x <- 1:3
> y <- 10:12
> cbind(x, y)
     x  y
[1,] 1 10
[2,] 2 11
[3,] 3 12
> rbind(x,y)
  [,1] [,2] [,3]
x    1    2    3
y   10   11   12
'''

## Factors ##
Used to represent categorical data.  Can be ordered or not.
Like an integer vector where each integer has a label.

Factors are treated specially by modelling functions like `lm()` and `glm()`
Levels appear to just be labels on sequential values.
The Sequence defaults to alphabetical, but can be set with the `levels()`
attribute.
'''
> x <- factor(c("yes", "yes", "no", "yes", "no"))
> x
[1] yes yes no  yes no
Levels: no yes
> table(x)
x
 no yes
  2   3
> class(x)
[1] "factor"
> unclass(x)
[1] 2 2 1 2 1
attr(,"levels")
[1] "no"  "yes"
> attributes(x)
$levels
[1] "no"  "yes"

$class
[1] "factor"
'''

## Missing Values ##
NA on NaN
* `is.na()` tests if object is NA
* `is.nan()` tests if object is NaN

NA values have a class, so there are integer NA, etc.
A NaN value is also NA, but the converse is not true.
'''
> x <- c(1,2,NA, 10, 3)
> x
[1]  1  2 NA 10  3
> is.na(x)
[1] FALSE FALSE  TRUE FALSE FALSE
> is.nan(x)
[1] FALSE FALSE FALSE FALSE FALSE
> x <- c(1,2,NaN, NA, 4)
> is.na(x)
[1] FALSE FALSE  TRUE  TRUE FALSE
> is.nan(x)
[1] FALSE FALSE  TRUE FALSE FALSE
'''

## Data Frames ##
Data Frames store tabular data.
* A special type of list where every element has to have the same length.
* Each element of the list can be thought of as a column and the length of each element of the list is the number of rows.
* Unlike matrices, data frames can store different classes of objects in each column (just like lists); matrices must have every element be the same class.
* Data frames also have a special attributes called row.names
* Data frames are usually created by calling `read.table()` or `read.csv()`
* Can be converted to a matrix by calling `data.matrix()`
'''
> x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
> x
  foo   bar
1   1  TRUE
2   2  TRUE
3   3 FALSE
4   4 FALSE
> nrow(x)
[1] 4
> ncol(x)
[1] 2
'''

## Names ##
Names attribute can be added to objects with `names()`
'''
> x <- 1:3
> names(x)
NULL
> names(x) <- c("one", "twp", "three")
> names(x)
[1] "one"   "twp"   "three"
> x <- list(a = 1, b = 2, c = 34)
> x
$a
[1] 1

$b
[1] 2

$c
[1] 34
> names(x)
[1] "a" "b" "c"
'''
Matrices can have names, called `dimnames()`
'''
> m <- matrix(1:4, nrow = 2, ncol = 2)
> dimnames(m)
NULL
> dimnames(m) <- list(c("a", "b"), c("c","d"))
> m
  c d
a 1 3
b 2 4
'''


