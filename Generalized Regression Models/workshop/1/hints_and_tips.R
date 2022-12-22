#####################################################
# GRM - Chapter 1: Statistical modelling - R code   #
#####################################################
## The data sets are available on Learn under:
## 
##     Course Materials >  Lecture Notes > Datasets 
## 
## To download files in Learn you can right-click on the file name 
## and select the save option, e.g. in Firefox select Save Link As... 
## 
## Plot the data and fit suitable models to the datasets in 
## Sections 1.1 to 1.3 of the Course Notes.
###############################################
# 1.1 January flows on the Kootenai river     #
###############################################
# While planning a hydro-electric scheme on the Kootenai River in the USA, engineers examined
# records of the January river flow at Newgate, where a dam was to be built, and at Libby, a place
# about 50 miles downstream. The records for Libby went back 19 years but those for Newgate
# existed for only 13, so they wanted to use the earlier records at Libby to estimate the flow at
# Newgate for the six earlier years. The January flows at the two places are given in the
# file Riverflow.txt: the plot shows the flows for the 13 later years.
riverflow <- read.table('Riverflow.txt',head=T)
plot(riverflow$Flow_at_Libby,riverflow$Flow_at_Newgate)
title("River flow")
riverflow.lm <- lm(Flow_at_Newgate ~ Flow_at_Libby, data = riverflow)
summary(riverflow.lm)
abline(riverflow.lm)
# QUIZ 1.1a:
# State an odd looking feature of the data set!
# State the model being fitted
# predict missing values at Newgate:
Flow_at_Libby_with_missing_Newgate <- c(42.0,24.0,38.0,49.4,24.6,24.2)
new <- data.frame(Flow_at_Libby= Flow_at_Libby_with_missing_Newgate)
predict(riverflow.lm,newdata=new,interval = "confidence")
Newgate.ests <- predict(riverflow.lm,newdata=new)
plot(riverflow$Flow_at_Libby,riverflow$Flow_at_Newgate)
points(Flow_at_Libby_with_missing_Newgate,Newgate.ests,pch=2)
title("River flow with Newgate estimates")
abline(riverflow.lm)
# QUIZ 1.1b:
# What are the predicted values at Newgate for the missing values in the data set?
###############################################
# 1.2 Calibration of a flame photometer       #
###############################################
# A flame photometer is an instrument that can be used to measure the concentration of sodium
# in chemical samples. It needs to be calibrated before analysing unknown concentrations, and so
# standard samples are tested first to provide a ‘calibration curve’ for converting further
# measurements into estimates of concentration. The results of such a calibration trial are
# given in Flame.txt.
flame <- read.table('Flame.txt',head=T)
plot(flame$Sodium_concentration,flame$Photometer_reading)
title("Flame photometer")
flame.lm <- lm(Photometer_reading ~ Sodium_concentration, data = flame)
summary(flame.lm)
abline(flame.lm)
# QUIZ 1.2:
# State the model being fitted
# Is the slope parameter significantly different from zero? 
# Is the intercept parameter significantly different from zero?
###############################################
# 1.3 Comparison of two methods for measuring #
#      the bitterness of beer                 #
###############################################
# The bitterness of a beer is a function of the concentration of iso-alpha acids; the standard method
# of measuring this concentration is the optical density (OD) method. The research department of
# a brewery conducted an experiment to compare this method with a new and more convenient one
# based on high-pressure liquid chromatography (HPLC). Fifteen samples of beer were prepared
# with different degrees of bitterness intended to cover the range of interest, and each was split into
# two sub-samples. The concentration of iso-alpha acids in each sub-sample was measured using
# both methods: the results are given in Beer.txt. [For the sake of commercial
# confidentiality, linear transformations have been applied to the measurements.]
beer <- read.table('Beer.txt',head=T)
plot(beer$OD_concentration, beer$HPLC_concentration)
title("Bitterness of beer") 
beer.lm <- lm(HPLC_concentration ~ OD_concentration, data = beer)
summary(beer.lm)
abline(beer.lm)
# QUIZ 1.3:
# State the model being fitted
# Is the slope parameter significantly different from zero? 
# Is the intercept parameter significantly different from zero?