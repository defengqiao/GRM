###############################################
# GRM: Case Study - GLMMs             R code  #
###############################################
#Read data into R
dental <- read.csv(file = "dental.csv")
###############################################
# Initial R analysis                          #
###############################################
#Fit simple linear regression model with age as covariate
model_initial <- lm(formula = distance ~ age, data = dental)
summary(model_initial)
#Repeat above but for just child with ID08
dental_ID08 <- dental[dental[,"id"] == "ID08", ]
model_ID08 <- lm(formula = distance ~ age, data = dental_ID08)
summary(model_ID08)
#Repeat above for selected children, storing the estimates and 
#  creating a plot of fitted lines
plot(dental[, "age"], dental[,"distance"], xlab = "Age (years)", 
     ylab = "Distance (mm)", cex.lab = 1.5,xlim = c(7, 15), ylim = c(15, 35))
abline(a = 16.7611, b = 0.6602,col = "grey", lwd = 3, lty = 2)
Selected_IDs <- c("ID08","ID10","ID15","ID21","ID24")
Estimates <- matrix(0, nrow = 2, ncol = length(Selected_IDs))
for(i in seq_along(Selected_IDs)){
  dental_ID <- dental[dental[,"id"] == Selected_IDs[i], ]
  model_ID  <- lm(formula = distance ~ age, data = dental_ID)
  Estimates[,i] <- coef(model_ID)
  abline(a = Estimates[1,i], b = Estimates[2,i], col = i)
}
legend("topleft", legend = Selected_IDs, col = 1:5, lty=1)
Estimates
###############################################
# Fitting a linear mixed model                #
###############################################
#Load lme4 package
# install.packages("lme4") #NOTE: run only once if lme4 package is not installed
library(lme4)
#fit linear mixed model with random slope on age for each child
model_lmm <- lmer(formula = distance ~ age + (-1 + age | id), data = dental)
summary(model_lmm)
#Compare linear mixed model with simple linear regression model
anova(model_lmm,model_initial)
#fit linear mixed model with random intercept and slope
model_lmm2 <- lmer(formula = distance ~ age + (age | id), data = dental)
#Compare the two linear mixed models
anova(model_lmm2,model_lmm)