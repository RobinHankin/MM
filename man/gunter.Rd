\name{gunter}
\alias{gunter}
\alias{print.gunter}
\alias{gunter,MB-method}
\alias{gunter,Oarray-method}
\alias{gunter,data.frame-method}
\alias{gunter,matrix-method}
\title{
Convert from multiple multivariate observations to tabular form
}
\description{
Convert from a matrix with rows corresponding to multivariate
observations, to a tabular form listing every possible combination
together with the number of times that combination was observed.
}
\usage{
gunter(obs)
\S3method{print}{gunter}(x, ...)
}
\arguments{
  \item{obs}{
    Argument.  If a matrix, interpret each row as  a
    multivariate observation (so the rowsums are constant).  If an
    object of class \code{MB}, interpret appropriately; if an
    \code{Oarray}, coerce to an \code{MB} object
  }
  \item{x}{Object of class \code{gunter} to be printed by the print method}
  \item{...}{Further arguments, currently ignored}
}
\value{
  For matrices and data frames, function \code{gunter()}
  returns an object of class \code{gunter}: a list of two elments, the
  first being a matrix (\sQuote{\code{obs}}) with rows being possible
  observations, and the second (\sQuote{\code{d}}) a vector with one
  entry for each row of matrix \code{obs}.

  For \code{MB} objects and \code{Oarray} objects, function
  \code{gunter()} returns an object of class \code{gunter_MB}.

  The print method returns its argument, invisibly, after printing it
  coerced to a list.
  
}
\author{
Bert Gunter, with tiny alterations by Robin Hankin
}
\examples{
data(wilson)
gunter(non_met)

data(danaher)
gunter(danaher)  # object of class gunter_MB

}

