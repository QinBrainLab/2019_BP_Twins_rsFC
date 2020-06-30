#
#   Copyright 2007-2016 The OpenMx Project
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
# 
#        http://www.apache.org/licenses/LICENSE-2.0
# 
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

# -----------------------------------------------------------------------------
# Program: UnivariateTwinAnalysis_PathRaw.R  
# Author: Hermine Maes
# Date: 2009.08.01
#
# ModelType: ACE
# DataType: Twin
# Field: Human Behavior Genetics 
#
# Purpose: 
#      Univariate Twin Analysis model to estimate causes of variation 
#      Path style model input - Raw data input
#
# RevisionHistory:
#      Hermine Maes -- 2009.10.08 updated & reformatted
#      Ross Gore -- 2011.06.06	added Model, Data & Field metadata
#      Hermine Maes -- 2014.11.04 piecewise specification
# -----------------------------------------------------------------------------

require(OpenMx)
require(foreign)
require(psych)
# Load Library
# -----------------------------------------------------------------------------
setwd("F://R2/scripts")
getwd()


# Load Data
data <- read.spss("178MZDZ0507-demo.sav", to.data.frame = TRUE)

# Select Variables for Analysis
selVars   <- c('ZRlamy14','ZRlamy142')
aceVars   <- c("A1","C1","E1","A2","C2","E2")

# Select Data for Analysis
mzData    <- subset(data, type=="1", selVars)
dzData    <- subset(data, type=="2", selVars)

# Generate Descriptive Statistics
colMeans(mzData,na.rm=TRUE)
colMeans(dzData,na.rm=TRUE)
cov(mzData,use="complete")
cov(dzData,use="complete")
# Prepare Data
# -----------------------------------------------------------------------------

# Path objects for Multiple Groups
manifestVars=selVars
latentVars=aceVars
# variances of latent variables
latVariances <- mxPath( from=aceVars, arrows=2, 
                        free=FALSE, values=1 )
# means of latent variables
latMeans     <- mxPath( from="one", to=aceVars, arrows=1, 
                        free=FALSE, values=0 )
# means of observed variables
obsMeans     <- mxPath( from="one", to=selVars, arrows=1, 
                        free=TRUE, values=1, labels="mean" )
# path coefficients for twin 1
pathAceT1    <- mxPath( from=c("A1","C1","E1"), to=selVars[1], arrows=1, 
                        free=TRUE, values=.5,  label=c("a","c","e") )
# path coefficients for twin 2
pathAceT2    <- mxPath( from=c("A2","C2","E2"), to=selVars[2], arrows=1, 
                        free=TRUE, values=.5,  label=c("a","c","e") )
# covariance between C1 & C2
covC1C2      <- mxPath( from="C1", to="C2", arrows=2, 
                        free=FALSE, values=1 )
# covariance between A1 & A2 in MZ twins
covA1A2_MZ   <- mxPath( from="A1", to="A2", arrows=2, 
                        free=FALSE, values=1 )
# covariance between A1 & A2 in DZ twins
covA1A2_DZ   <- mxPath( from="A1", to="A2", arrows=2, 
                        free=FALSE, values=.5 )

# Data objects for Multiple Groups
dataMZ       <- mxData( observed=mzData, type="raw" )
dataDZ       <- mxData( observed=dzData, type="raw" )

# Combine Groups
paths        <- list( latVariances, latMeans, obsMeans, 
                      pathAceT1, pathAceT2, covC1C2 )

aceMat <- mxMatrix(type="Full",nrow=3,ncol=1,free=T,values=.5,labels=c("a","c","e"),name="ace")
StdVarCompAlg <- mxAlgebra( (ace%^%2) %x% solve(t(ace)%*%ace), name="StdVarComp", dimnames=list(c("a2","c2","e2"),NULL) )
mxCI("StdVarComp")

modelMZ      <- mxModel(model="MZ", type="RAM", manifestVars=selVars, 
                        latentVars=aceVars, paths, covA1A2_MZ, dataMZ )
modelDZ      <- mxModel(model="DZ", type="RAM", manifestVars=selVars, 
                        latentVars=aceVars, paths, covA1A2_DZ, dataDZ )
minus2ll     <- mxAlgebra( expression=MZ.fitfunction + DZ.fitfunction, 
                           name="minus2loglikelihood" )
obj          <- mxFitFunctionAlgebra( "minus2loglikelihood" )

modelACE <- mxModel(model="ACE", modelMZ, modelDZ, minus2ll, obj, aceMat, StdVarCompAlg, mxCI("StdVarComp"))

# Run Model

ACEFit   <- mxRun(modelACE,intervals=TRUE)
ACESum   <- summary(ACEFit)
ACESum
# Fit ACE Model with RawData and Path-Style Input
# -----------------------------------------------------------------------------

# Generate & Print Output
# mean
M  <- mxEval(mean, ACEFit)
# additive genetic variance, a^2
A  <- mxEval(a*a, ACEFit)
# shared environmental variance, c^2
C  <- mxEval(c*c, ACEFit)
# unique environmental variance, e^2
E  <- mxEval(e*e, ACEFit)
# total variance
V  <- (A+C+E)
# standardized A
a2 <- A/V
# standardized C
c2 <- C/V
# standardized E
e2 <- E/V
# table of estimates
estACE <- rbind(cbind(A,C,E),cbind(a2,c2,e2))
# likelihood of ACE model
LL_ACE <- mxEval(fitfunction, ACEFit)
# Get Model Output
# -----------------------------------------------------------------------------



# Change Path Objects
# path coefficients for twin 1
pathAceT1    <- mxPath( from=c("A1","C1","E1"), to=selVars[1], arrows=1, 
                        free=c(T,F,T), values=c(.6,0,.6),  label=c("a","c","e") )
# path coefficients for twin 2
pathAceT2    <- mxPath( from=c("A2","C2","E2"), to=selVars[2], arrows=1, 
                        free=c(T,F,T), values=c(.6,0,.6),  label=c("a","c","e") )

# Combine Groups
paths        <- list( latVariances, latMeans, obsMeans, 
                        pathAceT1, pathAceT2, covC1C2 )
aceMat <- mxMatrix(type="Full",nrow=3,ncol=1,free=T,values=.5,labels=c("a","c","e"),name="ace")
StdVarCompAlg <- mxAlgebra( (ace%^%2) %x% solve(t(ace)%*%ace), name="StdVarComp", dimnames=list(c("a2","c2","e2"),NULL) )
mxCI("StdVarComp")
modelMZ      <- mxModel(model="MZ", type="RAM", manifestVars=selVars, 
                        latentVars=aceVars, paths, covA1A2_MZ, dataMZ )
modelDZ      <- mxModel(model="DZ", type="RAM", manifestVars=selVars, 
                        latentVars=aceVars, paths, covA1A2_DZ, dataDZ )
minus2ll     <- mxAlgebra( expression=MZ.fitfunction + DZ.fitfunction, 
                           name="minus2loglikelihood" )
obj          <- mxFitFunctionAlgebra( "minus2loglikelihood" )
#modelAE <- mxModel(model="AE", modelMZ, modelDZ, minus2ll, obj, aceMat, StdVarCompAlg, mxCI("StdVarComp"))
modelAE <- omxSetParameters(model=ACEFit,labels="c",free=FALSE,values=0,name="AE")
# Run Model
AEFit    <- mxRun(modelAE,intervals=TRUE)
AESum    <- summary(AEFit)
# Fit AE model
# -----------------------------------------------------------------------------

# Generate & Print Output
M  <- mxEval(mean, AEFit)
A  <- mxEval(a*a, AEFit)
C  <- mxEval(c*c, AEFit)
E  <- mxEval(e*e, AEFit)
V  <- (A+C+E)
a2 <- A/V
c2 <- C/V
e2 <- E/V
estAE <- rbind(cbind(A, C, E),cbind(a2, c2, e2))
LL_AE <- mxEval(fitfunction, AEFit)
LRT_ACE_AE <- LL_AE - LL_ACE
pchisq(q=LRT_ACE_AE,df=1,lower.tail=FALSE)

estACE
estAE
LRT_ACE_AE
pchisq(q=LRT_ACE_AE,df=1,lower.tail=FALSE)
# Get Model Output
# -----------------------------------------------------------------------------

# AE model details

AESum


# 	CE model
pathAceT1    <- mxPath( from=c("A1","C1","E1"), to=selVars[1], arrows=1, 
                        free=c(F,T,T), values=c(0,.6,.6),  label=c("a","c","e") )
# path coefficients for twin 2
pathAceT2    <- mxPath( from=c("A2","C2","E2"), to=selVars[2], arrows=1, 
                        free=c(F,T,T), values=c(0,.6,.6),  label=c("a","c","e") )

# Combine Groups
paths        <- list( latVariances, latMeans, obsMeans, 
                        pathAceT1, pathAceT2, covC1C2 )
aceMat <- mxMatrix(type="Full",nrow=3,ncol=1,free=T,values=.5,labels=c("a","c","e"),name="ace")
StdVarCompAlg <- mxAlgebra( (ace%^%2) %x% solve(t(ace)%*%ace), name="StdVarComp", dimnames=list(c("a2","c2","e2"),NULL) )
mxCI("StdVarComp")
modelMZ      <- mxModel(model="MZ", type="RAM", manifestVars=selVars, 
                        latentVars=aceVars, paths, covA1A2_MZ, dataMZ )
modelDZ      <- mxModel(model="DZ", type="RAM", manifestVars=selVars, 
                        latentVars=aceVars, paths, covA1A2_DZ, dataDZ )
#twinCEModel      <- mxModel(model="CE", modelMZ, modelDZ, minus2ll, obj )
modelCE <- omxSetParameters(model=ACEFit,labels="a",free=FALSE,values=0,name="CE")
# Run Model
CEFit    <- mxRun(modelCE,intervals=TRUE)
CESum    <- summary(CEFit)


M  <- mxEval(mean, CEFit)
A  <- mxEval(a*a, CEFit)
C  <- mxEval(c*c, CEFit)
E  <- mxEval(e*e, CEFit)
V  <- (A+C+E)
a2 <- A/V
c2 <- C/V
e2 <- E/V
estCE <- rbind(cbind(A, C, E),cbind(a2, c2, e2))
LL_CE <- mxEval(fitfunction, CEFit)
LRT_ACE_CE <- LL_CE - LL_ACE
pchisq(q=LRT_ACE_CE,df=1,lower.tail=FALSE)

estACE
estCE
LRT_ACE_CE
pchisq(q=LRT_ACE_CE,df=1,lower.tail=FALSE)
CESum

# 	E model
pathAceT1    <- mxPath( from=c("A1","C1","E1"), to=selVars[1], arrows=1, 
                        free=c(F,T,T), values=c(0,.6,.6),  label=c("a","c","e") )
# path coefficients for twin 2
pathAceT2    <- mxPath( from=c("A2","C2","E2"), to=selVars[2], arrows=1, 
                        free=c(F,T,T), values=c(0,.6,.6),  label=c("a","c","e") )

# Combine Groups
paths        <- list( latVariances, latMeans, obsMeans, 
                      pathAceT1, pathAceT2, covC1C2 )
aceMat <- mxMatrix(type="Full",nrow=3,ncol=1,free=T,values=.5,labels=c("a","c","e"),name="ace")
StdVarCompAlg <- mxAlgebra( (ace%^%2) %x% solve(t(ace)%*%ace), name="StdVarComp", dimnames=list(c("a2","c2","e2"),NULL) )
mxCI("StdVarComp")
modelMZ      <- mxModel(model="MZ", type="RAM", manifestVars=selVars, 
                        latentVars=aceVars, paths, covA1A2_MZ, dataMZ )
modelDZ      <- mxModel(model="DZ", type="RAM", manifestVars=selVars, 
                        latentVars=aceVars, paths, covA1A2_DZ, dataDZ )

modelE <- omxSetParameters(model=ACEFit,labels=c("a","c"),free=FALSE,values=0,name="E")
# Run Model
EFit    <- mxRun(modelE,intervals=TRUE)
ESum    <- summary(EFit)

# Generate & Print Output
M  <- mxEval(mean, EFit)
A  <- mxEval(a*a, EFit)
C  <- mxEval(c*c, EFit)
E  <- mxEval(e*e, EFit)
V  <- (A+C+E)
a2 <- A/V
c2 <- C/V
e2 <- E/V
estE <- rbind(cbind(A, C, E),cbind(a2, c2, e2))
LL_E <- mxEval(fitfunction, EFit)
LRT_ACE_E <- LL_E - LL_ACE
pchisq(q=LRT_ACE_E,df=2,lower.tail=FALSE)

estACE
estE
LRT_ACE_E
pchisq(q=LRT_ACE_E,df=2,lower.tail=FALSE)
ESum