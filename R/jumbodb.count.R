jumbodb.count <-
function(host, collection, query='{"limit": 1}', user=NULL, password=NULL, authenticate="basic"){
  
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
  
  out <- "Comming soon"
  # ToDo
  
  print("Comming soon")
  
  return(out)
}
