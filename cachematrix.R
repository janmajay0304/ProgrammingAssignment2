#Please make sure to load MASS package
#Use the below command
#library(MASS)

makeCacheMatrix <- function(x=matrix()){
	m <- NULL
	set <- function(y){
		x <<- y
		m <<- NULL
	}
	
	get <- function() x
	setInverse <- function(inpParam) m <<- inpParam
	getInverse <- function() m
	list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)
	
}

cacheSolve <- function(x=matrix()){
	m <- x$getInverse()
	if(!is.null(m)){
		message("Returning cached data")
		return(m)
	}
	data <- x$get()
	m <- ginv(data)       # Necessary to load MASS package to use this function
	x$setInverse(m)
	m
	
}
