\name{multinb.fit}

\alias{multinb.fit}

\title{  Multivariate negative binomial model with robust estimation of regression coefficients

}
\description{
This function is called by "multinbmod", but it can also be called directly
}


\usage{
multinb.fit(y, x, offset=1, id, start.par, control=list())
}
\arguments{
  \item{y}{Response vector.

}
  \item{x}{
Design matrix of covariates.
}
  \item{offset}{
Optional vector of offset values.
}
  \item{id}{
Variable indicating which subjects are correlated.
}
  \item{start.par}{
Vector of starting values for the parameters in the linear predictor (defaults to zero) and the overdispersion parameter (default to 0.5).
}
  \item{control}{
A list of parameters that control the convergence criteria. See "nlminb" for details.
}
}
\value{ The return values is a list with components:
\item{estimated regression coefficients}{}
\item{se from model}{Estimated standard errors of regression coefficients. }
\item{robust se }{Robust estimate of standard errors of regression coefficients.}
\item{t-values }{Robust t-values.}
\item{covariance of beta estimates from model}{Estimated covariance of estimated regression parameters.}
\item{robust covariance of beta estimates }{Robust estimate of covariance of estimated regression coefficients}
\item{estimated phi}{ML estimate of overdisperision parameter.}
\item{se(phi)}{Its standard error.}
\item{-2 x log-likelihood}{  }
\item{converged?}{Logical.}
\item{iterations}{Number of iterations required for convergence.}
}
\references{
Solis-Trapala, I.L. and Farewell, V.T. (2005) Regression analysis of overdispersed correlated count data with subject specific covariates. Statistics
in Medicine, 24: 2557-2575.
}
\author{
Ivonne Solis-Trapala
}

\seealso{multinbmod}

\examples{
id <- factor(rep(1:20, rep(5, 20)))
y <- rnbinom(100, mu = rexp(100,1)+rep(rexp(20,.3),rep(5,20)),size=2.5)
x<-rbinom(100,1,.5)
dat <- data.frame(y = y, x = x, id = id)
multinb.fit(y,cbind(1,x),id=id)
}
