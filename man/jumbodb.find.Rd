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

There are basically two different kinds of query tasks: indexQuery and jsonQuery. Here are some 
examples.

\itemize{

\item To get only one data set:

\code{ query <- "{'limit': 1}" }

\item To query a field with index:

\code{query <- "{ 'indexQuery': [
  {'name': 'date', 'clauses': [{'queryOperation': 'EQ', 'value': '20130301'} ]}
],
  'limit':10
}"}

\item To query a field without index:

\code{query <- "{ 'jsonQuery': [
  {'name': 'city', 'clauses': [{'queryOperation': 'EQ', 'value': 'Munich'} ]}
],
  'limit':10
}"}


\item To query for several criterias (you can do the same with an indexQuery):

\code{query <- '{
  "jsonQuery": [
      {"fieldName": "date", "clauses": [
        {"queryOperation": "EQ", "value": 20130301}, 
        {"queryOperation": "EQ", "value": 20130302}]},
      {"fieldName": "city.size", "clauses": [{"queryOperation": "GT", "value": 400}]}
    ]
}'}

}

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
