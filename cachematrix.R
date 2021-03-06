## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# This is a basic getter/setter object for the matrix. it can get and set the matrix itself and get/set its inverse. This function does not provide a inversion in itself!

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(matrix) {
        x <<- matrix
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing this function
# This function takes a "object" created from the above function and checks if it has a calculated inverse already. If it does it will return that cached matrix. If not it will calculate it and return it after saving it into the cache Object"

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached inverse matrix")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data,...)
    x$setinverse(inv)
    inv
}
