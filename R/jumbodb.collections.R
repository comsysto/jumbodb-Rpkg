jumbodb.collections <-
function(host, user=NULL, password=NULL, authenticate="basic"){
  require(httr)
  require(rjson)
  
  #check host string
  if( !grepl("http", host) ){
    stop("http is missing in host")
  }
  
  url <- paste(host, '/jumbodb/jumbodb/rest/query/collections', sep="")
  conf <- c(add_headers(Connection = "keep-alive"), accept_json())
  
  if( !is.null(user) && !is.null(password) ){
    conf <- append(conf, authenticate(user, password, authenticate))
  }

  out <- GET(url = url, config = conf)
  out <- fromJSON(as.character(out))
  out <- sapply(out, function(x){return(x$collection)})
  
  return(out)
}
