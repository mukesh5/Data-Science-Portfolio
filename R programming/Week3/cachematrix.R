## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#Input: A matrix x
#Functionality: set matrix value, get matrix, set matrix iinverse value & get matrix inverse value
#Return: returns a list of functions to get set matrix & it's inverse
makeCacheMatrix <- function(x = matrix()) {

  inv <- NULL
  
  get <- function() x
  
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  
  setinv <- function(mat) inv <<- mat 
  getinv <- function()  inv
  
  list(set=set, get=get, setinv=setinv, getinv=getinv)
  
}



## Write a short comment describing this function
#Input: A matrix x
#Functionality: calculate inverse of a matrix if not already calculated else return cached inverse
#Return: Inverse of a matrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  
  
  if(!is.null(inv))
  {
    print("Getting cached data")
    return(inv)
  }
  
  mat = x$get()
  inv = solve(mat,...)
  x$setinv(inv)
  
  inv
  
  
}

## Testing

testMatrix <- matrix(1:8,3,3)
cacheMatrix <- makeCacheMatrix(testMatrix)

cacheSolve(cacheMatrix)
cacheSolve(cacheMatrix)
