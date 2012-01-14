\name{summary.multinbmod}

\alias{summary.multinbmod}
\alias{summary}

\title{
Summary of a multinbmod object
}
\description{
It displays the output of multinbmod
}
\usage{\method{summary}{multinbmod}(object,...)}

\arguments{
  \item{object}{
The multinbmod object.
}
\item{...}{Any other arguments}
  }

\value{ A short summary of the object is printed

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
summary(myfit<-multinbmod(y~x,data=dat,id=id,control=list(iter.max=100)))
}
