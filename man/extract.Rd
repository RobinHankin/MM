\name{Extract.paras}
\alias{[.paras}
\alias{[<-.paras}
\alias{[,paras-method}
\alias{[<-,paras-method}
\alias{extract}
\title{Extract or Replace parameters of a \code{paras} object}
\description{
   Methods for \code{"["} and  \code{"[<-"}, i.e., extraction or
   subsetting of \code{paras} objects.
 }
 \section{Methods}{
   \itemize{
     \item x[i]
     \item x[i] <- value
     \item x[i,j]
     \item x[i,j] <- value
   }
 }
\arguments{
  \item{x}{Object of class \code{paras}}
  \item{i}{Elements to extract or replace}
  \item{value}{Replacement value}
}
\value{
  Always returns an object of class \code{paras}.
}
\author{Robin K. S. Hankin}
\note{
  These methods are included for completeness; it's not clear to me that
  they are likely to be used by anyone.  It might be better to always
  use constructions like \code{x <- paras(4) ; p(x)[2] <- 0.1} instead;
  YMMV.    
}
\examples{
x <- paras(4)
x[2] <- 0.1
x[1,2] <- 0.12
x

}
\keyword{math}
