\name{sweets}
\alias{sweets}
\alias{sweets_tally}
\alias{sweets_table}
\alias{sweets_array}
\docType{data}
\title{
Synthetic dataset due to Hankin
}
\description{\loadmathjax
  Four objects:
  \itemize{
    \item\code{sweets} is a \mjeqn{2\times 3\times 21}{2x3x21} array
    \item\code{sweets_tally} is a length 37 vector
    \item\code{sweets_array} is a \mjeqn{2\times 3\times 37}{2x3x37}
    vector
    \item\code{sweets_table} is a \mjeqn{37\times 6}{37x6} matrix
    }
}
\usage{data(sweets)}
\details{

  Object \code{sweets} is the raw dataset; objects \code{sweets_table}
  and \code{sweets_tally} are processed versions which are easier to
  analyze.

  The father of a certain family brings home nine sweets of type
  \code{mm} and nine sweets of type \code{jb} each day for 21 days to
  his children, \code{AMH}, \code{ZJH}, and \code{AGH}.

  The children share the sweets amongst themselves in such a way that
  each child receives exactly 6 sweets.

  \itemize{

  \item Array \code{sweets} has dimension \code{c(2,3,21)}: 2 types of
  sweets, 3 children, and 21 days. Thus \code{sweets[,,1]} shows that on
  the first day, \code{AMH} chose 0 sweets of type \code{mm} and 6
  sweets of type \code{jb}; child \code{ZJH} chose 3 of each, and child
  \code{AGH} chose 6 sweets of type \code{mm} and 0 sweets of type
  \code{jb}.

  Observe the constant marginal totals: the kids have the same overall
  number of sweets each, and there are a fixed number of each kind of
  sweet.

  \item Array \code{sweets_array} has dimension \code{c(2,3,37)}: 2
  sweets, 3 children, and 37 possible ways of arranging a matrix with
  the specified marginal totals.  This can be produced by
  \code{allboards()} of the \pkg{aylmer} package.
  
  \item \code{sweets_table} is a dataframe with six columns, one for
   each combination of child and sweet, and 37 rows, each row showing a
   permissible arrangement.  All possibilities are present.  The six
   entries of \code{sweets[,,1]} correspond to the six elements of
   \code{sweets_table[1,]}; the column names are mnemonics.

   \item\code{sweets_tally} shows how often each of the arrangements in
   \code{sweets_tally} was observed (that is, it's a table of the 21
   observations in \code{sweets})
 } 
}
\source{
The Hankin family
}
\examples{
data(sweets)

# show correspondence between sweets_table and sweets_tally:
cbind(sweets_table, sweets_tally)

# Sum the data, by sweet and child and test:
fisher.test(apply(sweets,1:2,sum))
# Not significant!




# Now test for overdispersion.
# First set up the regressors:

jj1 <- apply(sweets_array,3,tcrossprod)
jj2 <- apply(sweets_array,3, crossprod)
dim(jj1) <- c(2,2,37)
dim(jj2) <- c(3,3,37)

theta_xy <- jj1[1,2,]
  phi_ab <- jj2[1,2,]
  phi_ac <- jj2[1,3,]
  phi_bc <- jj2[2,3,]

# Now the offset:
Off <- apply(sweets_array,3,function(x){-sum(lfactorial(x))})

# Now the formula:
f <- formula(sweets_tally~ -1 + theta_xy + phi_ab + phi_ac + phi_bc)

# Now the Lindsey Poisson device:
out <- glm(formula=f, offset=Off, family=poisson)

summary(out)
#  See how the residual deviance is comparable with the degrees of freedom  

}
\keyword{datasets}
