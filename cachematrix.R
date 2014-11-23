## makeCacheMatrix function creates a special "matrix", which is
## a list containing a function to:
## 1. set the matrix
## 2. get the matrix
## 3. set the inverse of matrix
## 4. get the inverse of matrix


makeCacheMatrix <- function(x = matrix()) 
{
        m <- NULL
        set <- function (y)
        {        
        ## assigning value to object in an environment that is
        ## is different from the current environment using <<- operator

                x <<- y
                m <<- NULL
        }

        get <- function () x
        setMtrx <- function (solve) m <<- solve
        getMtrx <- function () m
        list (set = set, get = get,
                setMtrx = setMtrx
                getMtrx = getMtrx)
}




## cacheSolve function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix.
## Note: If the inverse has already been calculated (and the matrix
## has not changed), then the cacheSolve should retrieve the inverse
## from the cache.

cacheSolve <- function(x, ...) 
{
        ## Return a matrix that is the inverse of 'x'
        m <- x$getMtrx ()

        ## In case inverse has been calculated         
        if (!is.null (m))
        {
                message ("getting cached data")
                return (m)
        }

        ## In case inverse has not yet been calculated
        MtrxData <- x$get ()
        m <- solve (MtrxData, ...)
        x$setMtrx (m)
        m
}
