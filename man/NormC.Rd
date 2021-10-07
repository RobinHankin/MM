\name{NormC}
\alias{NormC}
\title{Normalizing constant for the multiplicative multinomial}
  \description{
    Calculates the normalizing constant for the multiplicative
    multinomial using direct numerical summation
  }
\usage{
NormC(Y, paras, log = FALSE)
}
\arguments{
  \item{Y}{
Total number of observations
}
  \item{paras}{
Object of class \code{paras}
}
  \item{log}{
    Boolean, with default \code{FALSE} meaning to return the value, and
    \code{TRUE} meaning to return the natural logarithm
  }
}
\author{
Robin K. S. Hankin
}
\examples{
jj <- paras(3)
theta(jj) <- 2
NormC(5,jj)

}
