\name{rMM}
\alias{rMM}
\alias{dMM}
\title{
Random samples from the multiplicative multinomial
}
\description{
Density, and random samples drawn from, the 
multiplicative multinomial
}
\usage{
rMM(n, Y, paras, burnin = 4*Y, every = 4*Y, start = NULL)
dMM(Y, paras)
}
\arguments{
  \item{n}{Number of observations to make
  }
  \item{Y}{
    Sum of each observation (for example, 100 for the \code{pollen} dataset,
    4 for \code{voting})
  }
  \item{paras}{
    Parameters of the MM distribution; an object of class \code{paras}
  }
  \item{every}{
    Each row is recorded every \code{every} steps through the Markov
    chain.  Thus \code{every=10} means every tenth row is written to the
    returned matrix during  MH process (and the other nine
    values are discarded)
  }
  \item{burnin}{  
    Number of initial observations to ignore
  }
  \item{start}{
    Observation to start simulation, with default \code{NULL}
    corresponding to using a random start vector
  }
}
\details{
  Function \code{rMM()} uses standard Metropolis-Hastings simulation.

  Function \code{dMM()} is documented here for convenience; see
  \code{help(MM)} for related functionality.
}
\value{
  Returns a matrix with \code{n} rows and \code{length(paras)} columns.
  Each row is an observation.
}
\author{
  Robin K. S. Hankin
}
\seealso{\code{\link{MM}}}
\examples{
data(voting)
rMM(10,4,Lindsey(voting,voting_tally))

p <- paras(3)
theta(p) <- 2
dMM(1:3,p)

}
