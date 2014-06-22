## This code cahces a matrix and its inverse given that the matrix is invertible.

## This function has the basic constructors of the matrix (Setters, getters) 
## plus the the setters and getters of the inverse
makeCacheMatrix <- function(x = matrix()) {
        soln <- NULL
        
        set <- function(y) {
                x <<- y
                soln <<- NULL
        }
        
        get <- function() x
        
        setSolution <- function(solution) soln <<- solution
        
        getSolution <- function() soln
        
        list(set = set, get = get,
             setSolution = setSolution,
             getSolution = getSolution)
}


## This fucntion solves the inverse of the matrix and cahces it inside the object.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        soln <- x$getSolution()
        if(!is.null(soln)) {
                message("getting cached data")
                return(soln)
        }
        
        matrix <- x$get()
        soln <- solve(matrix)
        x$setSolution(soln)
        soln
}

##Test Case
## test <- makeCacheMatrix(matrix(c(2,3,2,2), ncol=2,nrow=2))
## cacheSolve(test)
## Result: 2*2 matrix with values (-1,1,1.5,-1)