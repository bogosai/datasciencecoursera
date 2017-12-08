\name{complete}
\alias{complete}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
complete(directory, ids = 1:332)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{directory}{
%%     ~~Describe \code{directory} here~~
}
  \item{ids}{
%%     ~~Describe \code{ids} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (directory, ids = 1:332) 
{
    rng <- ids
    flist <- list.files(directory)
    data <- data.frame()
    for (i in ids) {
        data <- rbind(data, read.csv(file.path(directory, flist[i]), 
            skip = 1, header = FALSE))
    }
    colnames(data) <- c("Date", "sulfate", "nitrate", "id")
    sbset <- data[data[, "id"] \%in\% rng & !is.na(data[, 2]) & 
        !is.na(data[, 3]), ]
    fctr <- factor(sbset[, "id"], levels = rng)
    dframe <- data.frame(table(fctr))
    colnames(dframe) <- c("id", "nobs")
    dframe
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
