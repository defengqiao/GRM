###############################################
# GRM: Case Study - GLMs              R code  #
###############################################
#Read data into R
Book <- read.table("Book.dat")
###############################################
# Explore the data                            #
###############################################
#Explore relationship of response variable with covariates
par(mfrow = c(2,2))
boxplot(Book[,"books"] ~ Book[,"school"], xlab = "School", ylab = "Num. Books", cex.lab = 1.5)
boxplot(Book[,"books"] ~ Book[,"gender"], xlab = "Identified Gender", ylab = "Num. Books", cex.lab = 1.5)
plot(Book[,"eng"], Book[,"books"], xlab = "English scores", ylab = "Num. Books", cex.lab = 1.5)
plot(Book[,"math"], Book[,"books"], xlab = "Maths scores", ylab = "Num. Books",  cex.lab = 1.5)
#Explore relationship amongst the covariates
par(mfrow = c(2,3))
boxplot(Book[,"eng"] ~ Book[,"school"], xlab = "School", ylab = "English scores", cex.lab = 1.5)
boxplot(Book[,"eng"] ~ Book[,"gender"], xlab = "Identified Gender", ylab = "English scores", cex.lab = 1.5)
plot(Book[,"eng"], Book[,"math"], xlab = "English scores", ylab = "Math scores", cex.lab = 1.5)
boxplot(Book[,"math"] ~ Book[,"school"], xlab = "School", ylab = "Maths scores", cex.lab = 1.5)
boxplot(Book[,"math"] ~ Book[,"gender"], xlab = "Identified Gender", ylab = "Maths scores", cex.lab = 1.5)
plot(1,1,type="n",xaxt="n",yaxt="n",xlab="",ylab="",frame=FALSE) #Blank space
cor(Book[,"eng"], Book[,"math"])
table(Book[,"school"], Book[,"gender"])
chisq.test(table(Book[,"school"], Book[,"gender"])) #Schools & identified genders are independent
###############################################
# Building the Poisson regression model       #
###############################################
#Simple Poisson regression model with maths score covariate
Model1 <- glm(formula = books ~ math, data = Book, family = poisson(link = "log"))
summary(Model1)
#Perform variable selection to find the best model
ModelAll <- glm(formula = books ~ ., data = Book, family = poisson(link = log))
ModelBest <- step(ModelAll, trace = 0)  #trace = 0 suppresses print-out
summary(ModelBest)
# Illustrate fitted regression curves      
par(mfrow = c(1, 1))
plot(Book[,"eng"], Book[,"books"], xlab = "English scores", ylab = "Num. Books",
     cex.lab = 1.5)
x <- seq(from = -3, to = 3, by = 0.1)
lines(x, exp(0.92 + 0.50*x), col = 2, lwd = 2)
lines(x, exp(0.92 - 0.52 + 0.50*x), col = 3, lwd = 2)
lines(x, exp(0.92 + 0.54 + 0.50*x), col = 4, lwd = 2)
legend("topleft", legend = c("Sch1","Sch2","Sch3"), col = c(2,3,4), lty = 1,lwd = 2, cex = 1.5)
# Assess validity of model assumptions
par(mfrow = c(2, 2))
plot(ModelBest)
###############################################
# Prediction                                  #
###############################################
# Construct new data frame for prediction
PredictData <- data.frame(
  school = c("Sch1", "Sch2", "Sch3", "Sch1", "Sch2", "Sch3"),
  gender = c("M", "M", "M", "F", "F", "F"),
  math   = rep(qnorm(0.75), rep = 6),
  eng    = rep(qnorm(0.75), rep = 6)
)
# Evaluate linear predictor
predict(ModelBest, newdata = PredictData)
#Predict expected response
predict(ModelBest, newdata = PredictData, type = "response")
# Illustrate the prediction PMFs for the three pupils
par(mfrow=c(1,3))
barplot(dpois(0:15, 3.522),names = 0:15, ylab = "PMF", cex.lab = 1.5, cex.main = 1.5,
        xlab = "Number of Books", main = "School 1, E[Y] = 3.522", ylim = c(0, 0.3))
barplot(dpois(0:15, 2.095),names = 0:15, ylab = "PMF", cex.lab = 1.5, cex.main = 1.5, 
        xlab = "Number of Books", main = "School 2, E[Y] = 2.095", ylim = c(0, 0.3))
barplot(dpois(0:15, 6.061),names = 0:15, ylab = "PMF", cex.lab = 1.5, cex.main = 1.5,
        xlab = "Number of Books", main = "School 3, E[Y] = 6.061", ylim = c(0, 0.3))
#Predict the expected response for pupil A and pupil B in question
PredictData2 <- data.frame(
  eng = c(qnorm(0.8), qnorm(0.25)), 
  school = c("Sch2","Sch3")
)
predict(ModelBest, newdata = PredictData2, type = "response")
#Pupil B has larger expected response