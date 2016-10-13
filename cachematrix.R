### The following functions are able to create a 
## matrix that allows its inverse to be cached, so that it
## doesn't need to be calculate everytime repeatedly,but use cached data.

## The function makeCacheMatrix() creates a 
## matrix, which is actually list containing a function to
## a) set the value of the matrix
## b) get the value of the matrix
## c) set the value of the inverse
## d) get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
 m <- NULL
 set <-function(y){
   x <<- y
   m <<- NULL
 }
 get <- fucntion() x
 setInverse <-function(solve) m <<- solve
 getInverse <- function() m
 list(set= set,get =get , setInverse = setInverse , getInverse = getInverse)
}


## The function cacheSolve() calculates the inverse of the matrix
## created by makeCacheMatrix(). However, before this function
## first checks if the inverse has already been
## calculated. If yes, then it gets the inverse from the cache
## without finding inverse. Otherwise, it
## calculates the inverse of the matrix and sets the value
## of the inverse in the cache using the setinverse function.


cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'

m <- x$getInverse()
if(!is.null(m)){
  message("getting ")
  return(m)

}
data <- x$get()
m <- solve(data)
x$setInverse(m)
m
}
