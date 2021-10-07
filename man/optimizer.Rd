\name{optimizer}
\alias{optimizer}
\alias{optimizer_allsamesum}
\alias{optimizer_differsums}
\title{Maximum likelihood estimator for the MM}
\description{
  Maximum likelihood estimator for the MM
  }
\usage{
optimizer(y, n = NULL, start = NULL, method = "nlm",
            printing = FALSE, give_fit=FALSE, ...)
optimizer_allsamesum(y, n = NULL, start = NULL, method = "nlm",
            printing = FALSE, give_fit=FALSE, ...)
optimizer_differsums(y, n = NULL, start = NULL, method = "nlm",
            printing = FALSE, give_fit=FALSE, ...)
}
\arguments{
  \item{y}{
Matrix with each row being a possible observation
}
  \item{n}{
Counts of observations corresponding to rows of \code{y}
}
\item{start}{
    Start value for optimization routine, taken to be an object of class
    \code{paras}.  Default value of \code{NULL} means to start with
    \code{Lindsey(y,n)}, which theoretically should be the maximum
    likelihood estimate
  }
  \item{method}{String giving which optimization method to use.  Default
    of \code{Nelder} means to use  \code{optim()} with the Nelder-Mead
    method; the other supported option is \code{nlm}
  }
  \item{printing}{
    Boolean, with \code{TRUE} meaning to print information as the
    optimization progresses and default \code{FALSE} meaning to print
    nothing
  }
  \item{give_fit}{Boolean, with default \code{FALSE} meaning to return
    the maximum likelihood estimate in the form of a \code{paras}
    object, and \code{TRUE} meaning to return a two-element list, the
    first being the output of \code{nlm()} or \code{optim()} and the
    second being the MLE
  }
  \item{\dots}{
    Further arguments passed to the optimization routine.  In
    particular,  note that \code{hessian=TRUE} is useful in conjunction
    with \code{give_fit=TRUE}
  }
}
\details{
  Function \code{optimizer()} is the user-friendly version: it is a wrapper for
  \code{optimizer_samesum()} and \code{optimizer_differsums()}; it
  dispatches according to whether the rowsums are identical or not.

  These functions are slow because they need to evaluate \code{NormC()}
  repeatedly, which is expensive.

  Function \code{optimizer_samesum()} nominally produces the same output
  as \code{Lindsey()}, but is more computationally intensive.
  }

\author{
  Robin K. S. Hankin
}
\seealso{\code{\link{Lindsey}}}
\examples{
data(voting)
p1 <- Lindsey(voting,voting_tally)
p2 <- optimizer(voting,voting_tally,start=p1)

theta(p1) - theta(p2)   # Should be zero

\dontrun{
data(pollen)
p1 <- optimizer(pollen)
p2 <- Lindsey(pollen)
theta(p1) - theta(p2)   #  Isn't zero...numerical scruff...
}

}
