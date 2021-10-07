\name{suffstats}
\alias{suffstats}
\alias{expected_suffstats}
\alias{print.suffstats}
\alias{summary.suffstats}
\alias{print.summary.suffstats}
\title{
Sufficient statistics for the multiplicative multinomial
}
\description{\loadmathjax
  Calculate, manipulate, and display sufficient statistics of the
  multiplicative multinomial.  Functionality for analysing datasets, and
  distributions specified by their parameters is given; summary and
  print methods are also documented here.
}
\usage{
suffstats(y, n = NULL)
expected_suffstats(L,Y)
\S3method{print}{suffstats}(x, ...)
\S3method{summary}{suffstats}(object, ...)
\S3method{print}{summary.suffstats}(x, ...)
}
\arguments{
  \item{y,n}{In function \code{suffstats()}, argument \code{y} is a
    matrix with each row being a possible observation and \code{n} is
    counts of observations corresponding to rows of \code{y} with
    default \code{NULL} interpreted as each row of \code{y} being
    observed once.  If \code{y} is an object of class \code{gunter},
    this is interpreted sensibly}
  \item{L,Y}{In function \code{expected_suffstats()}, argument \code{L}
    is an object of class \code{Lindsey} [typically returned by function
    \code{Lindsey()}], and \code{Y} is the known constant sum (ie the
    \code{rowSums()} of the observations)}
  \item{x, object}{An object of class \code{suffstats} or
    \code{summary.suffstats}, to be printed or summarized}
  \item{...}{Further arguments to the print or summary methods.
    Currently ignored}
}
\details{

  Function \code{suffstats()} returns a list comprising a set of
  sufficient statistics for the observations \code{y,[n]}.
  
  This function requires that the rowsums of \code{y} are all
  identical.

}
\value{
  Function \code{suffstats()} returns a list of four components:
  \describe{
  \item{Y}{Rowsums of \code{y}}
  \item{nobs}{Number of observations}
  \item{row_sums}{Column sums of \code{y}, counted with multiplicity}
  \item{cross_prods}{Matrix of summed squares}
}

Function \code{summary.suffstats()} provides a summary of a
\code{suffstats} object that is a list with two elements:
\code{row_sums} and \code{cross_prods}, normalized with \code{nobs} and
\code{Y} so that the values are comparable with that returned by
\code{expected_suffstats()}.  In particular, the sum of \code{row_sums}
is the known sum \mjseqn{y}.

}
\author{
Robin Hankin and P. M. E. Altham
}
\examples{
data(voting)
suffstats(voting, voting_tally)

data(wilson)
wilson <- gunter(non_met)
suffstats(wilson)

L <- Lindsey(wilson)

expected_suffstats(L,5)
summary(suffstats(wilson))  ## matches.

summary(suffstats(rMM(10,5,L))) # should be close.




}
