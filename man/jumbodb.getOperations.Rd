\name{jumbodb.getOperations}
\alias{jumbodb.getOperations}
\title{List available query operation for a jumboDB collection}
\description{
A function listing all available query options for the selected collection.
}
\usage{
jumbodb.getOperations(host, collection, user = NULL, password = NULL, authenticate = "basic")
}

\arguments{
  \item{host}{the hostname}
  \item{collection}{the collection name}
  \item{user}{the user name for authentication}
  \item{password}{the password for authentication}
  \item{authenticate}{the http authentication (\link[httr]{authenticate}) method}
}
\details{
In some cases it will be usefull to know the available query operations on this collection.
}
\value{
A vector of characters describing the different query operations.
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
collection <- "test"
jumbodb.getOperations(host, collection)
}
}
\keyword{ data }
\keyword{ manip }
\keyword{ database }
