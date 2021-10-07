\name{paras}
\alias{paras}
\alias{paras-class}
\alias{p}
\alias{p,paras-method}
\alias{p<-}
\alias{p<-,paras-method}
\alias{theta}
\alias{theta<-}
\alias{theta,paras-method}
\alias{theta<-,paras-method}
\alias{pnames}
\alias{pnames,paras-method}
\alias{pnames,MB-method}
\alias{pnames<-}
\alias{pnames<-,paras-method}
\alias{pnames<-,MB-method}
\alias{getVals}
\alias{getVals,paras-method}
\alias{length,paras-method}
\title{Manipulate a paras object}
\description{\loadmathjax
Various utilities to manipulate \code{paras} objects.  Functions
\code{pnames()} and \code{pnames<-()} operate on \code{MB} objects as
expected.
}
\usage{
paras(x, p, theta, pnames = character(0))
p(x) <- value
theta(x) <- value
p(x)
theta(x)
pnames(x)
pnames(x) <- value
getVals(x)
\S4method{length}{paras}(x)
}
\arguments{
  \item{x}{
    Object of class \code{paras}
  }
  \item{p}{
    In function \code{paras()}, a vector of the first \mjseqn{k-1}
    elements of the probabilities
  }
  \item{theta}{
    In function \code{paras()}, a \mjseqn{k} by \mjseqn{k} matrix with
    diagonal composed of ones
  }
  \item{pnames}{In function \code{paras()}, a character vector of
    names for the entries
  }
  \item{value}{Replacement value
  }
}
\details{

  A \code{paras} object contains the parameters needed to specify a
  multiplicative multinomial distribution.
  
  Suppose \code{p} is an object of class \code{paras} object.  Then
  \code{p} is a list of two elements.  The first element, \code{p}, is a
  vector of length \code{length(p)} and the second is an upper-diagonal
  matrix square matrix of size \code{length(p)}.  The vignette gives
  further details.

  The functions documented here allow the user to inspect and change
  \code{paras} objects.


  }
\author{
Robin K. S. Hankin
}
\seealso{
\code{\link{MM}}, \code{\link{MB}}
}
\examples{
jj <- paras(5)
pnames(jj) <- letters[1:5]
p(jj) <- c(0.1, 0.1, 0.3, 0.1)
theta(jj) <- matrix(1:25,5,5)
pnames(jj) <- letters[1:5]
jj

# OK, we've defined jj, now use it with some other functions:
dMM(rep(1,5),jj)
MM_single(1:5,jj)
rMM(2,9,jj)

}
