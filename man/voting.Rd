\name{voting}
\alias{voting}
\alias{voting_tally}
\alias{Nvoting_tally}
\docType{data}
\title{
Synthetic dataset of voting behaviour due to Altham
}
\description{
Synthetic dataset of voting behaviour due to Altham
}
\usage{data(voting)}
\format{
\code{voting} is a three-column matrix with each row being a
configuration of voting in a household with four members, and three
choices.  Vector \code{voting_tally} is a list of how many households
voted, and \code{Nvoting_tally} is a more extreme dataset of the same
type, used to uncover bugs in \code{Lindsey()}.
}
\source{
Supplied by P. M. E. Altham
}
\examples{
data(voting)
Lindsey(voting,voting_tally)
}
\keyword{datasets}
