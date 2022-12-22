

marks <- data.frame(name=rep(c("george","anna","heike"),each=3),
          d.o.b.=rep(c("11/2/01","15/6/00","12/12/02"),each=3),
	   nationality=rep(c("GB","GB","DE"),each=3),
	   week=rep(1:3,3),grade=c("B","C","A","A","B","A","D","B","A"))
marks

student <- unique(marks[,c("name","d.o.b.","nationality")])
student


library(mgcv)
student <- uniquecombs(marks[,c("name","d.o.b.","nationality")])
ind <- attr(student,"index")
marks[3,];student[ind[3],]

setwd("~sw283/lnotes/StatProg")
raw <- readLines("homicides.txt")
raw <- readLines("https://michaelgastner.com/DAVisR_data/homicides.txt")

raw[1]

rl <- strsplit(raw,",")
rl[1:2]
lat <- as.numeric(sapply(rl,function(x) x[1]))
lon <- as.numeric(sapply(rl,function(x) x[2]))

raw[453]

raw[300]

## Regular expressions...
#?regex
txt <- "He scribbled a note on his clipboard and clicked his heels as he clinched the deal."

grep("c.i",strsplit(txt," ")[[1]])

txt1 <- "To flunk this exam would be disaster, thought Phil, picking up his fork to eat "

grep("f.*k",strsplit(txt1," ")[[1]])

txt2 <- "Flunk this exam and I’ll be toast, thought Farouk, forking beans into his mouth."

grep("f.*k",strsplit(txt2," ")[[1]])

grep("\\b[Ff].*k\\b",strsplit(txt2," ")[[1]])

## homicide victim names...

get.name <- function(x) {
  x1 <- gsub(".*<dt>","",x) ## strip out everything to <dt>
  x1 <- gsub("</dt>.*","",x1) ## strip out everything after </dt>
  x1 <- gsub("<a.*\">","",x1) ## strip out any web addresses
  sub("</.*","",x1) ## strip out any further tags
}
name <- sapply(raw,get.name,USE.NAMES=FALSE)

head(name)

## homicide victim race...

rl <- strsplit(raw,"<dd>") ## split so race info second element of each record
race <- sapply(rl,function(x) sub("<.*","",x[2]) ) ## strip trailing tags
ii <- grep("Race:",race) ## locate ’Race:’ cases
race[ii] <- gsub("Race: ","",race[ii]) ## extract race info for ’Race:’ cases
race[-ii] <- gsub(" .*","",race[-ii]) ## drop rest of text in other cases

## create data frame...
dat <- data.frame(lon=lon,lat=lat,name=name,race=tolower(race))
head(dat)

## A depressing plot...

with(dat,plot(lon,lat,pch=19,cex=.5))
ii <- dat$race=="white"
points(dat$lon[ii],dat$lat[ii],col="pink",pch=19,cex=.6)
ii <- dat$race=="hispanic"
points(dat$lon[ii],dat$lat[ii],col="brown",pch=19,cex=.6)
ii <- !(dat$race=="black"|dat$race=="white"|dat$race=="hispanic")
points(dat$lon[ii],dat$lat[ii],pch=19,cex=.5,col="green")



