\name{MB}
\alias{MB}
\alias{MB-class}
\alias{as.array.MB}
\alias{as.array.gunter_MB}
\alias{print.gunter_MB}
\alias{counts,MB-method}
\alias{counts}
\alias{getM,MB-method}
\alias{getM}
\title{Multivariate multiplicative binomial distribution}
\description{\loadmathjax
Various utilities to coerce and manipulate \code{MB} objects
}
\usage{
MB(dep, m, pnames=character(0))
\S3method{as.array}{MB}(x, ...)
\S4method{getM}{MB}(x)
\S3method{print}{gunter_MB}(x, ...)
}
\arguments{
  \item{dep}{
    Primary argument to \code{MB()}.  Typically a matrix with each row
    being an observation (see \sQuote{details} section below for an
    example).  If an object of class \code{Oarray}, function \code{MB()}
    coerces to an \code{MB} object
  }
  \item{m}{
    Vector containing the relative sizes of the various marginal
    binomial distributions
  }
  \item{x}{
    Object of class \code{MB} to be converted to an \code{Oarray} object
  }
  \item{...}{Further arguments to \code{as.array()}, currently ignored
    }
  \item{pnames}{In function \code{MB()}, a character vector of
    names for the entries
  }
}
\details{

  Function \code{MB()} returns an object of class \code{MB}.  This is
  essentially a matrix with one row corresponding to a single
  observation; repeated rows indicate identical observations as shown
  below.  Observational data is typically in this form.  The idea is
  that the user can coerce to a \code{gunter_MB} object, which is then
  analyzable by \code{Lindsey()}.
  
  The multivariate multiplicative binomial distribution is defined by
  \mjdeqn{
    \prod_{i=1}^t
    {m_i\choose x_i\, z_i}p_i^{x_i}q_i^{z_i}\theta_i^{x_iz_i}
    \prod_{i < j}\phi_{ij}^{x_ix_j}
  }{
   Equation 20 of the vignette
  }

 Thus if \mjeqn{\theta=\phi=1}{theta=phi=1} the system reduces to a product of
 independent binomial distributions with probability \mjseqn{p_i} and size
 \mjseqn{m_i} for \mjeqn{i=1,\ldots,t}{1,...,t}.

 There follows a short \R transcript showing the \code{MB} class in use,
 with annotation.

 The first step is to define an \code{m} vector:
 \preformatted{
R> m <- c(2,3,1)
 }

 This means that \mjeqn{m_1=2,m_2=3,m_3=1}{m1=2,m2=3,m3=1}.  So
 \mjeqn{m_1=2}{m1=2} means that \mjseqn{i=1} corresponds to a binomial
 distribution with size 2 [that is, the observation is in the set
 \mjeqn{\{0,1,2\}}{{0,1,2}}]; and \mjeqn{m_2=3}{m2=3} means that \mjseqn{i=2}
 corresponds to a binomial with size 3 [ie the set
 \mjeqn{\{0,1,2,3\}}{{0,1,2,3}}].

 Now we need some observations:

 \preformatted{
R> a <- matrix(c(1,0,0, 1,0,0, 1,1,1, 2,3,1, 2,0,1),5,3,byrow=T)
R> a
     [,1] [,2] [,3]
[1,]    1    0    0
[2,]    1    0    0
[3,]    1    1    1
[4,]    2    3    1
[5,]    2    0    1 
}

In matrix \code{a}, the first observation, viz \code{c(1,0,0)} is
interpreted as \mjeqn{x_1=1,x_2=0,x_3=0}{x1=1,x2=0,x3=0}.  Thus, because
\mjeqn{x_i+z_i=m_i}{xi+zi=mi}, we have \mjeqn{z_1=1,z_2=3,z_3=1}{z1=1,z2=3,z3=1}.  Now
we can create an object of class \code{MB}, using function \code{MB()}:

\preformatted{
R>  mx <- MB(a, m, letters[1:3])   
}

The third argument gives names to the observations corresponding to the
columns of \code{a}.   The values of \mjeqn{m_1, m_2, m_3}{m1,m2,m3} may
be extracted using \code{getM()}:

\preformatted{
R> getM(mx)
a b c 
2 3 1 
R> 
}

The \code{getM()} function returns a named vector, with names
given as the third argument to \code{MB()}.

Now we illustrate the print method:
 \preformatted{
R> mx
     a na     b nb     c nc    
[1,] 1 1      0 3      0 1     
[2,] 1 1      0 3      0 1     
[3,] 1 1      1 2      1 0     
[4,] 2 0      3 0      1 0     
[5,] 2 0      0 3      1 0     
R> 
}

See how the columns are in pairs: the first pair total 2 (because
\mjeqn{m_1=2}{m1=2}), the second pair total 3 (because \mjeqn{m_2=3}{m2=3}),
and the third pair total 1 (because \mjeqn{m_3=1}{m3=1}).  Each pair of
columns has only a single degree of freedom, because \mjeqn{m_i}{mi} is known.

Also observe how the column names are in pairs.  The print method puts
these in place.  Take the first two columns.  These are named
\sQuote{\code{a}} and \sQuote{\code{na}}: this is intented to mean
\sQuote{\code{a}} and \sQuote{not \code{a}}.

We can now coerce to a \code{gunter_MB}:

\preformatted{
R> (gx <- gunter(mx))
$tbl
   a b c
1  0 0 0
2  1 0 0
3  2 0 0
[snip]
24 2 3 1

$d
 [1] 0 2 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 1

$m
a b c 
2 3 1 
}

Take the second line of the element \code{tbl} of \code{gx}, as an
example.  This reads \code{c(1,0,0)} corresponding to the observations
of \code{a,b,c} respectively, and the second line of element \code{d}
[\dQuote{\code{d}} for \dQuote{data}], viz 2, shows that this
observation occurred twice (and in fact these were the first two lines
of \code{a}).

Now we can coerce object \code{mx} to an array:

\preformatted{
R> (ax <- as.array(mx))
, , c = 0

   b
a   0 1 2 3
  0 0 0 0 0
  1 0 0 2 0
  2 0 0 0 0

, , c = 1

   b
a   0 1 2 3
  0 0 1 0 0
  1 0 0 0 0
  2 1 1 0 0
>
}

(actually, \code{ax} is an \code{Oarray} object).  The location of an
element in \code{ax} corresponds to an observation of \code{abc}, and
the entry corresponds to the number of times that observation was made.
For example, \code{ax[1,2,0]=2} shows that \code{c(1,2,0)} occurred
twice (the first two lines of \code{a}).

The Lindsey Poisson device is applicable: see \code{help(danaher)} for
an application to the bivariate case and \code{help(Lindsey)} for an
example where a table is created from scratch.

}
\author{
Robin K. S. Hankin
}
\seealso{
  \code{\link{MM}}, \code{\link{Lindsey}}, \code{\link{danaher}}
}
\examples{

a <- matrix(c(1,0,0, 1,0,0, 1,1,1, 2,3,1, 2,0,1),5,3,byrow=TRUE)
m <- c(2,3,1)
mx <- MB(a, m, letters[1:3])   # mx is of class 'MB'; column headings
                   #  mean "a" and "not a".
ax <- as.array(mx)
gx <- gunter(ax)
ax2 <- as.array(gx)

data(danaher)
summary(Lindsey_MB(danaher))

}
