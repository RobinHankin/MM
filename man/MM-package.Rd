\name{MM-package}
\alias{MM-package}
\docType{package}
\title{
The Multiplicative Multivariate distribution, and the Multivariate
Multiplicative Binomial Distribution
}
\description{
Two generalizations of the Multiplicative Binomial distribution of
Altham (1978).
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{MM}
\packageIndices{MM}

}
\author{
Robin K. S. Hankin and P. M. E. Altham

Maintainer: \packageMaintainer{MM}

}
\references{
P. M. E. Altham 1978.  \dQuote{Two Generalizations of the Binomial
  Distribution}.  \emph{Applied Statistics} 27:162--167

P. M. E. Altham and Robin K. S. Hankin 2012. \dQuote{Multivariate
Generalizations of the Multiplicative Binomial Distribution: Introducing
the MM Package}, \emph{Journal of Statistical Software}, 46(12),
1-23. \doi{10.18637/jss.v046.i12}
}
\examples{
data(voting)
Lindsey(voting, voting_tally)

jj <- paras(3)
rMM(10,4,jj)

}
