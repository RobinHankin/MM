\name{multinomial}
\alias{multinomial}
\alias{lmultinomial}
\title{
Multinomial function
}
\description{\loadmathjax
The multinomial function and its logarithm
}
\usage{
multinomial(x)
lmultinomial(x)
}
\arguments{
  \item{x}{Numeric vector}
}
\details{
Function \code{multinomial()} returns

\mjdeqn{{n\choose n_1,n_2,\ldots,n_k} = \frac{n!}{n_1!n_2!\cdots
    n_k!}}{omitted; see PDF}

where \mjeqn{\sum_i n_i=n}{n_1+...+n_k=n}, and function
  \code{lmultinomial()} returns the natural logarithm of this.
}
\author{Robin K. S. Hankin}
\note{
Uses logarithmic functions to avoid overflow.
}
\examples{
x <- runif(10)

exp(lmultinomial(x)) - multinomial(x) #should be small 
}
