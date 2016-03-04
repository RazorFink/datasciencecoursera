## Reading Data ##
* `read.table`, `read.csv`, for reading tabular data.
* `readLines`, for reading lines of a text file.
* `source`, for reading in R code files (inverse of `dump`)
* `dget`, for reading in R code files (inverse of `dput`)
* `load`, for reading in saved workspaces
* `unserialize`, for reading single R objects in binary form.

## Writing Data ##
* write.table
* writeLines
* dump
* dput
* save
* serialize

## Reading Data Files with read.table ##
* `file`, the name of the file, or a connection
* `header`, logical indicating if the file has a header line
* `sep`, a string indicating how the columns are separated
* `colClasses`, a character vector indicating the class of each column in the dataset.
* `nrows`, number of rows in the dataset
* `comment.char`, a character string specifying the comment character
* `skip`, number of lines to skip from the beginning
* `stringsAsFactors`, should character variables be coded as factors?

## read.table ##
For small to moderately sized datasets, you can usually call read.table without specifying any other arguments.  Returns a Data Frame object.
'''
data <- read.table("foo.txt")
'''
 R will automatically
* skip lines that begin with #
* figure out how many rows there are (and how much memory needs to be allocated)
* figure what type of variable is in each column of the table.  Telling R all these things directly makes R run faster and more efficiently.
* `read.csv` is identical to read.table except that the default separator is a comma.


## Reading Large Tables ##
* _Read the help page for `read.table`, which contains many hints_
* Make a rough calculation of the memory required to store your dataset.  If the dataset is larger than the amount of RAM on your computer, you can probably stop right there.
* Set comment.char = "" if there are no comments in your file.

## Reading in Larger Datasets with read.table ##
* Use the `colClasses` argument.  Specifying this option instead of the default can make `read.table` run much faster.  This is useful if you already know the classes of the columns.  A quick way to figure out the column classes:
'''
initial <- read.table("datatable.txt", nrows = 100)
classes <- sapply(inital, class)
tabAll <- read.table("datatable.txt", colClasses = classes)
'''
* Set nrows.  This doesn't make R run faster but helps with memory usage.  A mild overestimate is okay.  You can use the unix tool `wc` to calculate the number of lines in a file.

## Know Thy System ##
* How much RAM
* Other applications?
* Other Users?
* OS?
* 64bit?

## Memory Requirements ##
* Need roughly twice as much RAM as the size of the dataset
* MB = Bytes / 2^20

## Textual Data Formats ##
* dumping and dputing are useful because the resulting textual format is editable, and in the case of corruption, potentially recoverable.
* Unlike writing out a table or csv file, dump and dput preserve the metadata (sacrificing some readability), so that another user doesn't have to specify it all over again.
* Textual formats can work much better with version control programs. which can only track changes meaninfully in text files.
* Textual formats can be longer-lived; if there is corruption somewhere in the file, it can be easier to fix the problem
* Textual formats adhere to the "Unix Philosophy"
* Downside; not space efficient.

## dput-ing R Objects ##
Another way to pass aroudn data is by deparsing the R object with dput and reading it back in using dget.
'''
> y <- data.frame(a = 1, b = "a")
> dput(y)
structure(list(a = 1, b = structure(1L, .Label = "a", class = "factor")), .Names = c("a",
"b"), row.names = c(NA, -1L), class = "data.frame")
> dput(y, file = "y.R")
> new.y <- dget("y.R")
> new.y
  a b
1 1 a
'''

## Dumping R Objects ##
Like dput, but can output multiple objects.
Read back using `source`.
'''
> x <- "foo"
> y <- data.frame(a = 1, b = "a")
> dump(c("x", "y"), file = "data.R")
> help(rm)
>
> rm(x, y)
> x
Error: object 'x' not found
> source ("data.R")
> x
[1] "foo"
> y
  a b
1 1 a
'''

## Interfaces to the Outside World ##
Data are read in using connection interfaces.  Commonly files.
* `file`, opens a connection to a file
* `gzfile`, opens a connection to a gzipped file
* `bzfile`, opens a connection to a bzipped file
* `url`, opens a connection to a webpage

## File Connections ##
'''
> str(file)
function (description = "", open = "", blocking = TRUE, encoding = getOption("encoding"),
    raw = FALSE)
'''
* description is the name of the file
* open is a code indicating:
    * "r" read only
    * "w" writing (and initializing)
    * "a" appending
    * "rb", "wb", "ab" reading, writing, or appending in binary mode (Windows)

## Connections ##
powerful tools that let you navigate files or other external objects. In practice, we don't often need to deal with the connection interface directly.
'''
con <- file("foo.txt", "r")
data <- read.csv(con)
close(con)
'''
is the same as
'''
data <- read.csv("foo.txt")
'''

## Reading Lines of a Text File ##
`readLines(con)`

