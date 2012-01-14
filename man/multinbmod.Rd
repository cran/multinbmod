\name{multinbmod}


\alias{multinbmod}

\title{Regression analysis of overdispersed correlated count data
}
\description{ This function fits a multivariate negative binomial model by Maximum Likelihood and calculates robust standard errors
of the regression coefficients.
}
\usage{multinbmod(formula, data, id, offset, start.coef = NULL, start.phi = NULL,control=list())
}
\arguments{
  \item{formula}{A symbolic description of the model to be fit.
}
  \item{data}{An optional data frame containing the variables in the model. If not found in "data", the variables are taken from "environment(formula)", typically
  the environment from which "multinbfit" is called.
}
  \item{id}{A vector which identifies correlated subjects. The length of "id" should be the same as the number of observations.
          Data are assumed to be sorted so that observations on a cluster are contiguous rows for all entities in the formula.
}
  \item{offset}{Optional vector of offset values.
}
  \item{start.coef}{Vector of starting values for the parameters in the linear predictor. Dafaults are set to zero.
}
  \item{start.phi}{Overdispersion parameter. This value must be positive. Default is set to 0.5.}
  \item{control}{A list of parameters that control the convergence criteria. See "nlminb" for details.}
}
\details{The marginal distribution of the \eqn{j}-th observation from a cluster \eqn{i} is assummed to be Negative Binomial with mean \eqn{mu_{ij}} and variance \eqn{mu_{ij} + phi*mu_{ij}^2}. The covariance of two observations is phi times the product of their means. The function provides robust estimates of the regression parameters.
}
\value{ The return values is a list, an object of class "multinbfit". The componets are:
\item{converged}{Logical.}
\item{coefficients}{Estimated regression coefficients.}
\item{model.coef.se}{Their standard errors.}
\item{robust.coef.se}{Robust estimates of standard errors.}
\item{robust.t.values}{Robust t-values.}
\item{mle.phi}{Estimated overdispersion parameter.}
\item{phi.se}{Its standard error.}
\item{minus2.loglik}{-2 x log-likelihood.}
\item{call}{The function call.}

}
\references{
Solis-Trapala, I.L. and Farewell, V.T. (2005) Regression analysis of overdispersed correlated count data with subject specific covariates. Statistics
in Medicine, 24: 2557-2575.
}
\author{Ivonne Solis-Trapala
}

\examples{
id <- factor(rep(1:20, rep(5, 20)))
y <- rnbinom(100, mu = rexp(100,1)+rep(rexp(20,.3),rep(5,20)),size=2.5)
x<-rbinom(100,1,.5)
dat <- data.frame(y = y, x = x, id = id)
multinbmod(y~x,data=dat,id=id)
summary(multinbmod(y~x,data=dat,id=id,control=list(iter.max=100)))
}
\keyword{count data}
\keyword{multivariate}
\keyword{negative binomial}
\keyword{Clustered}

