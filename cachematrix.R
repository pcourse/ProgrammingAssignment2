## These functions will create a "special" matrix and return it´s inverse.


## Thus function creates a special matrix which basically: sets the value of a matrix, gets the value of a matrix, sets the value of the inverse and gets the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set =set, get=get,
         setsolve = setsolve,
         getsolve=getsolve)
}
  


## This function calculates the inverse of the special "matrix". However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation.

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}

