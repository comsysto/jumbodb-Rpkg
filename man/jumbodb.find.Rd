\name{jumbodb.find}
\alias{jumbodb.find}
\title{Query on a jumboDB collection}
\description{
A function which executes a query on a jumboDB collection and returns the result as an R object.
}
\usage{
jumbodb.find(host, collection, query = "{\"limit\": 1}", user = NULL, password = NULL, authenticate = "basic")
}
\arguments{
  \item{host}{the hostname}
  \item{collection}{the collection name}
  \item{query}{the jumbodb formated query you are intersted in}
  \item{user}{the user name for authentication}
  \item{password}{the password for authentication}
  \item{authenticate}{the http authentication (\link{authenticate}) method}
}
\details{
Some query examples can be found here: https://github.com/comsysto/jumbodb/wiki/Twitter-Quick-Start
}
\value{
An R object (mostly list) of the query result.
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
query <- '{"limit": 1}'
jumbodb.find(host, collection, query=query)
}
}
\keyword{ data }
\keyword{ manip }
\keyword{ database }
