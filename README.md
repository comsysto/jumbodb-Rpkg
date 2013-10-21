jumbodb-Rpkg
============

R (http://www.r-project.org) package to connect with jumboDB (https://github.com/comsysto/jumbodb)


Package Installation
=========================
```R
install.packages("devtools")
library(devtools)
install_github("jumbodb-Rpkg", username="comsysto")

library(RjumboDB)
```

Package Usage
=========================
```R
host <- "localhost:8080"
collection <- "test"
test <- jumbodb.collections(host)
test2 <- jumbodb.getIndexes(host, collection)
test3 <- jumbodb.getOperations(host, collection)
test4 <- jumbodb.find(host, collection, query='{"limit": 1}')
test5 <- jumbodb.count(host, collection, query='{"limit": 1}')
```
