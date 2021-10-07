\name{Lindsey}
\alias{Lindsey}
\alias{Lindsey_MB}
\alias{print.Lindsey_output}
\alias{bioChemists}
\title{
The Poisson device of Lindsey and Mersch (1992).
}
\description{

Function \code{Lindsey()} returns a maximum likelihood fit of the
multiplicative multinomial using the Poisson device of Lindsey and
Mersch (1992), and in the context of the multiplicative multinomial by
Altham and Lindsey (1998).

Function \code{Lindsey_MB()} returns a maximum likelihood fit for the
multivariate multiplicative binomial, for the special case of a
bivariate distribution.  An example of coercing a table to the correct
form for use with \code{Lindsey_MB()} is given in the examples section
below.  Also, see \code{danaher} for another example.

}
\usage{
Lindsey(obs, n = NULL, give_fit = FALSE)
Lindsey_MB(a)
\S3method{print}{Lindsey_output}(x, ...)
}
\arguments{
  \item{obs}{
    In \code{Lindsey()}, an integer matrix with each row corresponding to
    an observation.  All row sums must match}
  \item{n}{
    Vector with elements corresponding to the rows of \code{obs};
    default of \code{NULL} corresponds to observing each row of
    \code{obs} once}
  \item{a}{
    In \code{Lindsey_MB()}, an object that is coerced to one of class
    \code{gunter_MB}.  Typically, the user supplies an \code{Oarray}
    object or an \code{MB} object}
  \item{give_fit}{Boolean, with default \code{FALSE} meaning to return
    just the fit, coerced to an object of class \code{paras} and
    \code{TRUE} meaning to return a list with two elements, the first
    being a \code{paras} object and the second being the fit returned by
    \code{glm()}
  }
  \item{x}{In the print method, object of class \code{Lindsey_output}}
  \item{...}{In the print method, further arguments, currently ignored}
}
\details{
  Uses the device first described by Lindsey in 1992; the \sQuote{meat}
  of which has \R idiom

  \code{Off <- -rowSums(lfactorial(jj$tbl))}
  
  \code{glm(jj$d ~ -1 + offset(Off) + (.)^2, data=data, family=poisson)}

  Function \code{Lindsey(..., give_fit=TRUE)} returns an object of class
  \code{Lindsey_output}, which has its own print method (which 
  prints the summary of the fit rather than use the default method).

  Function \code{Lindsey(..., give_fit=FALSE)} returns an object of
  class \code{paras}, which can then be passed on to functions such as
  \code{rMM()}, which take a \code{paras} object.

  Function \code{Lindsey_MB()} returns an object of class \code{glm}.
  
}
\references{
  \itemize{
    \item
    J. K. Lindsey and G. Mersch 1992. \dQuote{Fitting and comparing
      probability distributions with log linear models}, \emph{Computational
      Statistics and Data Analysis}, 13(4):373--384
    \item P. M. E. Altham and J. K. Lindsey, 1998.  \dQuote{Analysis of the
      human sex ratio using overdispersion models}, \emph{Applied
      Statistics}, 47:149--157
  }
}
\author{
  P. M. E. Altham and Robin  K. S. Hankin
}
\seealso{
  \code{\link{gunter}},  \code{\link{danaher}}
}
\examples{
data(voting)
(o <- Lindsey(voting, voting_tally))
rMM(10,5,o)

data(danaher)
Lindsey_MB(danaher)

\dontrun{  #(takes a long time)
data(pollen)
Lindsey(pollen)
}

# Example of Lindsey_MB() in use follows.
 
a <- matrix(c(63,40,26,7,69,42,19,5,48,21,16,2,33,11,9,1,21,8,9,0,
    7,8,1,0,5,3,1,0,9,2,0,0),byrow=TRUE,ncol=4)

# Alternatively, you can get this from the pscl package as follows:
# library(pscl); data(bioChemists)
# a <- table(subset(bioChemists, fem == 'Men' & art < 8))

dimnames(a) <- list(papers=0:7,children=0:3)
require(Oarray)
a <- as.Oarray(a,offset=0)
# thus a[3,1]==11 means that 11 subjects had 3 papers and 1 child

summary(Lindsey_MB(a))
}
