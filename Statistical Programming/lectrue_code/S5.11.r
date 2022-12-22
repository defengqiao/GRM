## apply functions...
a <- array(1:24,c(2,3,4)) ## creating an example 2 by 3 by 4 array

apply(a,1,sum) ## sum all elements for each first index value

## product of elements sharing each combination of index 1 and 3 values... 
apply(a,c(1,3),prod)

## operating on subsets of a vector
x <- 1:10
fac <- factor(c(1,2,2,3,1,2,2,3,1,1)) ## subset labels
tapply(x,fac,sum) ## sum up over each label

## similar but over unique label combinations
fac2 <- factor(rep(c("a","b"),each=5))
tapply(x,list(fac2,fac),sum)

## lapply for lists
b <- list(a=1:5,b=c(4,2,7),c=-10:10)
unlist(lapply(b,function(x) sort(x)[2]))

