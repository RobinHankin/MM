\name{wilson}
\alias{wilson}
\alias{met_area}
\alias{non_met}
\docType{data}
\title{
Housing Dataset due to Wilson
}
\description{
Dataset due to Wilson
}
\usage{data(wilson)}
\format{
  Two objects, \code{met_area} and \code{non_met}, which  have three
  columns and either 17 or 18 rows.  Each row corresponds to a
  neighborhood of five households, each of which votes for one of three
  choices: US, S, or VS.  Each   column corresponds to one of these
  choices.  The rowsums are constant because there are exactly five
  households in each neighborhood.
  
}
\source{
  \itemize{
    \item J. R. Wilson 1989.  \dQuote{Chi-square tests for
      Overdispersion with Multiparameter Estimates}, \emph{Journal of
      the Royal Statistical Society.  Series C (Applied Statistics)},
    38(3):441--453
    \item S. S. Brier 1980. \dQuote{Analysis of Contingency Tables Under
      Cluster Sampling}, \emph{Biometrika} 67(3):591--596
  }
}
\examples{
data(wilson)
Lindsey(non_met)
}
\keyword{datasets}
