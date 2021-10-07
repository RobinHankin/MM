\name{skellam}
\alias{skellam}
\alias{Skellam}
\alias{skellam_counts}
\alias{Catcheside}
\alias{catcheside}
\docType{data}
\title{
Brassica Dataset due to Catcheside
}
\description{
Dataset due to Catcheside, used by Skellam (1948) and subsequently by
Altham (1978).
}
\usage{data(skellam)}
\format{
A frequency table of counts of association data.
}
\source{
  \itemize{
    \item J. G. Skellam 1948.  \dQuote{A probability distribution
      derived from the binomial distribution by regarding the
      probability of success as variable between the sets of trials}.
      \emph{Journal of the Royal Statistical Society, series B
	(Methodological)}.  Volume 10, number 2, pp257-248.
      \item D. Catcheside 1937.  Cytologia, Fujii Jub. Vol.
      }
}
\examples{
data(skellam)
Lindsey(skellam, skellam_counts)

}
\keyword{datasets}
