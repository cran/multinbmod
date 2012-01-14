\name{multinbmod-package}
\alias{multinbmod-package}
\docType{package}
\title{
Regression analysis of overdispersed correlated count data
}
\description{
This is a robust likelihood approach for the regression analyis of overdispersed correlated counts data with cluster varying
covariates. The approach fits a multivariate negative binomial model by maximum likelihood and provides robust estimates of the regression
coefficients.
}
\details{
\tabular{ll}{
Package: \tab multinbmod\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-01-14\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}
Use function multinbmod to fit a multivariate negative binomial model by maximum likelihood. Robust estimates of regression parameters are provided.
}
\author{
Ivonne Solis-Trapala

Maintainer: Ivonne Solis-Trapala <i.solis-trapala@mrc-hnr.cam.ac.uk>
}
\references{
Solis-Trapala, I.L. and Farewell, V.T. (2005) Regression analysis of overdispersed correlated count data with subject specific covariates. Statistics
in Medicine, 24: 2557-2575.
}
\keyword{multivariate negative binomial model, overdispersed correlated count data}
\examples{
id <- factor(rep(1:20, rep(5, 20)))
y <- rnbinom(100, mu = rexp(100,1)+rep(rexp(20,.3),rep(5,20)),size=2.5)
x<-rbinom(100,1,.5)
dat <- data.frame(y = y, x = x, id = id)
multinbmod(y~x,data=dat,id=id)
summary(multinbmod(y~x,data=dat,id=id))
}
