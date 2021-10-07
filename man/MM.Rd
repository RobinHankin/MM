\name{MM}
\alias{MM}
\alias{MM_allsamesum}
\alias{MM_differsums}
\alias{MM_allsamesum_A}
\alias{MM_differsums_A}
\alias{MM_single}
\alias{MM_support}
\title{Various multiplicative multinomial probability utilities}
\description{\loadmathjax
Various multiplicative multinomial probability utilities for different
types of observation
}
\usage{
MM(y,n=NULL,paras)
MM_allsamesum(y, n=NULL, paras)
MM_differsums(y, n=NULL, paras)
MM_allsamesum_A(y, paras)
MM_differsums_A(y, paras)
MM_single(yrow, paras, givelog=FALSE)
MM_support(paras, ss)
}
\arguments{
  \item{y}{Observations: a matrix, each row is a single observation}
  \item{yrow}{A single observation corresponding to one row of
    matrix \code{y}}
  \item{n}{Integer vector with one element for each row of \code{y}.
    Default value of \code{NULL} means to interpret each row of \code{y}
    as being observed once}
  \item{ss}{Sufficient statistics, as returned by \code{suffstats()}}
  \item{givelog}{Boolean in \code{MM_single()} with \code{TRUE} meaning
    to return the log likelihood and default \code{FALSE} meaning to
    return the likelihood}
  \item{paras}{Object of class \code{paras}}
}
\details{

  Consider non-negative integers \mjeqn{y_1,\ldots,y_k}{y_1,...,y_k} with
  \mjeqn{\sum y_i=y}{y_1+...+y_k=y}.  Then suppose the frequency function
  of the distribution \mjeqn{Y_1,\ldots,Y_k}{Y_1,...,Y_k} is
  
  \mjdeqn{C\cdot{y\choose y_1,\ldots,y_k}
    \prod_{i=1}^k p_i^{y_i}
    \prod_{1\leq i < j\leq k}{\theta_{ij}}^{y_iy_j}
    }{omitted; see PDF}

    where \mjeqn{p_i,\ldots,p_k\geq 0}{p_i,...,p_k >= 0}, \mjeqn{\sum
      p_i=1}{p_1+...+p+k=1} correspond to probabilities; and
    \mjeqn{\theta_{ij} > 0}{theta_{ij}>0} for \mjeqn{1\leq i < j\leq k}{1 <= i
      < j <= k} are additional parameters.

    Here \mjseqn{C} stands for a normalization constant:

    \mjdeqn{C=C(p,\theta,Y)=
      \sum_{y_1 + \cdots + y_k=y}
    \prod_{i=1}^k p_i^{y_i}
    \prod_{1\leq i < j\leq k}{\theta_{ij}}^{y_iy_j}
    }{omitted; see PDF}
      
    which is evaluated numerically.  This is expensive.
    
  The usual case is to use function \code{MM()}.
  \itemize{
    \item Function \code{MM()} returns the log of the probability of a
    matrix of rows of independent multinomial observations.  It is a
    wrapper for \code{MM_allsamesum()} and
    \code{MM_differsums()}.  Recall that optional argument \code{n}
    specifies the number of times that each row is observed.  Calls
    \code{NormC()}. 
    \item Function \code{MM_allsamesum()} gives the log of the
    probability of observing a matrix where the rowsums are identical.
    Calls \code{NormC()}. 
    \item Function \code{MM_differsums()} gives the log of the
    probability of observing a matrix where the rowsums are not
    necessarily identical.  \strong{Warning:} This function takes a long
    time to run.  Calls \code{NormC()}, possibly many times.
    \item Functions \code{MM_allsamesum_A()} and
    \code{MM_differsums_A()} are analogous to functions
    \code{MM_allsamesum()} and \code{MM_differsums()} but interpret the
    matrix \code{y} as having rows corresponding to observations; each row
    is observed once, as in \code{data(pollen)}. Both call \code{NormC()}. 
    \item Function \code{MM_single()} gives a likelihood function for a
    \code{paras} object with a single multinomial observation (that is,
    a single line of matrix \code{y}).  Does not call \code{NormC()}. 
    \item Function \code{MM_support()} gives the support (that is, the
    log-likelihood) of a \code{paras} object; argument \code{ss} is the
    sufficient statistic, as returned by \code{suffstats()}.  Does not
    call \code{NormC()}. 
    \item Function \code{dMM()} [documented more fully at \code{rMM.Rd}]
    gives the probability of a single multivariate observation (ie a
    single row of the matrix argument \code{y}).  Calls \code{NormC()}.
  }
}

\author{Robin K. S. Hankin}
\examples{
data(voting)

data(voting)
p <- Lindsey(voting, voting_tally)

MM(voting,voting_tally,p)   #No other value of 'p' gives a bigger value


}
