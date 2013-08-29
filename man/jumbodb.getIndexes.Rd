\name{jumbodb.getIndexes}
\alias{jumbodb.getIndexes}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
jumbodb.getIndexes(host, collection, user = NULL, password = NULL, authenticate = "basic")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{host}{
%%     ~~Describe \code{host} here~~
}
  \item{collection}{
%%     ~~Describe \code{collection} here~~
}
  \item{user}{
%%     ~~Describe \code{user} here~~
}
  \item{password}{
%%     ~~Describe \code{password} here~~
}
  \item{authenticate}{
%%     ~~Describe \code{authenticate} here~~
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
function (host, collection, user = NULL, password = NULL, authenticate = "basic") 
{
    require(httr)
    require(rjson)
    url <- paste(host, "/jumbodb/jumbodb/rest/query/collections", 
        sep = "")
    conf <- c(add_headers(Connection = "keep-alive"), accept_json())
    if (!is.null(user) && !is.null(password)) {
        conf <- append(conf, authenticate(user, password, authenticate))
    }
    out <- GET(url = url, config = conf)
    out <- fromJSON(as.character(out))
    collections <- sapply(out, function(x) {
        return(x$collection)
    })
    id <- which(collections == collection)
    indexes <- sapply(out[[id]]$indexes, function(x) {
        return(x)
    })
    return(indexes)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
