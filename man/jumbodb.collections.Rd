\name{jumbodb.collections}
\alias{jumbodb.collections}
\title{List collections in jumboDB}
\description{
A function to list all collections available in your jumboDB database.
}
\usage{
jumbodb.collections(host, user = NULL, password = NULL, authenticate = "basic")
}
\arguments{
  \item{host}{the hostname}
  \item{user}{the user name for authentication}
  \item{password}{the password for authentication}
  \item{authenticate}{the http authentication (\link{authenticate}) method}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A list of names which are the collection names.
}
\references{
https://github.com/comsysto/jumbodb-Rpkg
https://github.com/comsysto/jumbodb
}
\author{
Markus Schmidberger; markus.schmidberger@comsysto.com
}

\examples{
\dontrun{
library(RjumboDB)
host <- "localhost:8080"
jumbodb.collections(host)
}
}
\keyword{ data }
\keyword{ manip }
\keyword{ database }
