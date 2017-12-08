\name{rankhospital}
\alias{rankhospital}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
rankhospital(state, outcome, num = "best")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{state}{
%%     ~~Describe \code{state} here~~
}
  \item{outcome}{
%%     ~~Describe \code{outcome} here~~
}
  \item{num}{
%%     ~~Describe \code{num} here~~
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
function (state, outcome, num = "best") 
{
    outcome <- tolower(outcome)
    state <- toupper(state)
    if (outcome == "heart attack") {
        i <- 11
    }
    else if (outcome == "heart failure") {
        i <- 17
    }
    else if (outcome == "pneumonia") {
        i <- 23
    }
    else {
        stop("invalid outcome")
    }
    readData <- data.frame()
    readData <- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE)
    if (nrow(readData[readData[, "State"] == state, ]) == 0) 
        stop("Invalid state")
    readData <- readData[readData[, "State"] == state & !is.na(readData[, 
        i]) & readData[, i] != "Not Available", ]
    lens <- length(readData[, i])
    readData <- readData[order(as.numeric(readData[, i]), readData[, 
        "Hospital.Name"]), ]
    readData <- cbind(seq_along(1:lens), readData)
    if (sum(num == c("best", "worst")) >= 1) {
        if (num == "best") {
            num <- 1
        }
        else if (num == "worst") {
            num <- lens
        }
        else if (is.character(num)) {
            num <- lens + 1
        }
    }
    else if (is.character(num)) {
        num <- lens + 1
    }
    if (lens >= num) {
        f <- data.frame()
        f <- readData[readData[, 1] == num, ]
        f <- f$Hospital.Name
    }
    else {
        f <- "NA"
    }
    Hospital.Name <<- f
    Hospital.Name
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
