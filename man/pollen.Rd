\name{pollen}
\Rdversion{1.1}
\alias{pollen}
\docType{data}
\title{
Pollen data from Mosimann 1962
}
\description{
Data from Mosimann 1962 detailing forest pollen counts 
}
\usage{data(pollen)}
\format{
A matrix with four columns and 76 rows.
}
\details{
  The rows each sum to 100; the values are counts of four different
  types of pollen.  Each row corresponds to a different level in the
  core; the levels are in sequence with the first row being most
  recent and the last row being the oldest.
}
\references{
J. E. Mosimann 1962.  \dQuote{On the compound multinomial distribution,
  the multivariate \eqn{\beta}{beta}-distribution, and correlations
  among proportions}.  \emph{Biometrika}, volume 49, numbers 1 and 2,
pp65-82.
}
\examples{

\dontrun{
data(pollen)
Lindsey(pollen)
}

}
\keyword{datasets}
