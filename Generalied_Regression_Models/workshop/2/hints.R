###############################################
# GRM: Case Study - Linear Models    R code   #
###############################################
#Read data into R
RealEstate <- read.csv(file = "RealEstate.csv")
###############################################
# Explore the data                            #
###############################################
#EDA: Price vs other variables
par(mfrow=c(3,2))
plot(RealEstate[, "Size"], RealEstate[, "Price"], xlab = "Size (sq-ft)", ylab = "Price($,000s)", cex.lab=1.5)
boxplot(RealEstate[, "Price"] ~ RealEstate[, "Bedroom"], xlab = "Num. Bedrooms", ylab = "Price($,000s)", cex.lab=1.5)
boxplot(RealEstate[, "Price"] ~ RealEstate[, "Bathroom"], xlab = "Num. Bathrooms", ylab = "Price($,000s)", cex.lab=1.5)
boxplot(RealEstate[, "Price"] ~ RealEstate[, "Pool"], xlab = "Pool?", ylab = "Price($,000s)", cex.lab=1.5)
boxplot(RealEstate[, "Price"] ~ RealEstate[, "Garage"], xlab = "Garage?", ylab = "Price($,000s)", cex.lab=1.5)
boxplot(RealEstate[, "Price"] ~ RealEstate[, "Township"], xlab = "Township", ylab = "Price($,000s)", cex.lab=1.5)
cor(RealEstate[,"Price"], RealEstate[,"Size"])
#EDA: Size vs other variables
par(mfrow=c(3,2))
boxplot(RealEstate[, "Size"] ~ RealEstate[, "Bedroom"], xlab = "Num. Bedrooms", ylab = "Size (sq-ft)", cex.lab=1.5)
boxplot(RealEstate[, "Size"] ~ RealEstate[, "Bathroom"], xlab = "Num. Bathrooms", ylab = "Size (sq-ft)", cex.lab=1.5)
boxplot(RealEstate[, "Size"] ~ RealEstate[, "Pool"], xlab = "Pool?", ylab = "Size (sq-ft)", cex.lab=1.5)
boxplot(RealEstate[, "Size"] ~ RealEstate[, "Garage"], xlab = "Garage?", ylab = "Size (sq-ft)", cex.lab=1.5)
boxplot(RealEstate[, "Size"] ~ RealEstate[, "Township"], xlab = "Township", ylab = "Size (sq-ft)", cex.lab=1.5)
plot(1, 1, type = "n", xlab = "", ylab = "", xaxt = "n", yaxt = "n", frame = FALSE) #Add blank plot in 6th slot
table(RealEstate[,"Garage"], RealEstate[,"Pool"])
###############################################
# Building the linear regression model        #
###############################################
#Simple linear regession model based on size
Model1 <- lm(formula = Price ~ Size, data = RealEstate)
summary(Model1)
#Multiple linear regession model based on size & pool
Model2 <- lm(formula = Price ~ Size + Pool, data = RealEstate)
summary(Model2)
#Full multiple linear regression model
ModelAll <- lm(formula = Price ~ ., data = RealEstate)
summary(ModelAll)
#Automated variable selection (removes bedroom and bathroom variables)
ModelBest <- step(ModelAll, trace = 0)  #Suppress printout
summary(ModelBest)
###############################################
# Validating assumptions                      #
###############################################
#Validation of linear regression modelling assumptions
par(mfrow = c(2, 2))
plot(ModelBest)