\name{jumbodb.getIndexes}
\alias{jumbodb.getIndexes}
\title{List indexes available for a jumboDB collection}
\description{
A function which lists all indixes on the selected jumboDB collection.
}
\usage{
jumbodb.getIndexes(host, collection, user = NULL, password = NULL, authenticate = "basic")
}
\arguments{
  \item{host}{the hostname}
  \item{collection}{the collection name}
  \item{user}{the user name for authentication}
  \item{password}{the password for authentication}
  \item{authenticate}{the http authentication (\link{authenticate}) method}
}
\details{
To check for available indices on the collection including the index strategy.
}
\value{
A dataframe with the available indices on this collection including the index name, index strategy and the supportd query opperations.
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
jumbodb.getIndexes(host, collection)
}
}
\keyword{ data }
\keyword{ manip }
\keyword{ database }
