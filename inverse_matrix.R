## data.frame
# Directories
path <- "/Users/sorennonnengart/Coursera/Data_science/Datensätze/C2_week3/ProgrammingAssignment2"
setwd(path)

## The first thing I did was setting the input x as a matrix with a range from 1 to 100 and 25 values
## I then set "replace == True" to tell R that I want to draw a sample with replacement. 
## Lastly I created 5 columns with ncol=5 
## After having done that, I then set the solved value "m" as a null
## And lastly I changed every reference to "mean" to "solve" and "m" to "s"

makeCacheMatrix <- function(x = matrix(sample(1:100,25, replace = TRUE), ncol = 5)) {
    s <- NULL
    set <- function(y) {
      x <<- y
      s <<- NULL
  }
    get <- function() x
    setsolve <- function(solve) s <<- solve
    getsolve <- function() s
    list(set = set, get = get,
        setsolve = setsolve,
        getsolve = getsolve)
}
## Same here, changed "mean" to "solve" 
cacheSolve <- function(x, ...) {
    s <- x$getsolve()
    if(!is.null(s)) {
      message("Getting the inversed matrix")
      return(s)
  }
    data <- x$get()
    s <- solve(data, ...)
    x$setsolve(s)
    s
}