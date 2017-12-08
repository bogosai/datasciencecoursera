\name{rankall}
\alias{rankall}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
rankall(outcome, num = "best")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
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
function (outcome, num = "best") 
{
    outcome <- tolower(outcome)
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
    fstate <- levels(factor(readData[, 7]))
    lstate <- length(fstate)
    Hospital.Name <- data.frame()
    for (k in 1:lstate) {
        areadData <- readData[readData[, "State"] == fstate[k] & 
            !is.na(readData[, i]) & readData[, i] != "Not Available", 
            ]
        lens <- length(areadData[, i])
        areadData <- areadData[order(as.numeric(areadData[, i]), 
            areadData[, "Hospital.Name"]), ]
        areadData <- cbind(seq_along(1:lens), areadData)
        anum <- tolower(num)
        if (sum(anum == c("best", "worst")) >= 1) {
            if (anum == "best") {
                anum <- 1
            }
            else if (anum == "worst") {
                anum <- lens
            }
            else if (is.character(num)) {
                anum <- lens + 1
            }
        }
        else if (is.character(num)) {
            anum <- lens + 1
        }
        else {
            anum <- num
        }
        if (lens >= anum) {
            f <- data.frame()
            f <- areadData[areadData[, 1] == anum, ]
            f <- f$Hospital.Name
        }
        else {
            f <- "NA"
        }
        Hospital.Name <- rbind.data.frame(Hospital.Name, data.frame(f, 
            fstate[k]))
    }
    colnames(Hospital.Name) <- c("hospital", "state")
    print(Hospital.Name)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
