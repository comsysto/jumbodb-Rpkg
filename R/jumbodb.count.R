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
  
  
  # check if collection exists
  try( col <- jumbodb.collections(host, user=user, password=password, authenticate=authenticate) )
  if( length( which( collection == col) ) == 0 ){
    stop("Collection not existing: ", collection)
  }
  
  
  # Ask JumbdoDB
  out <- "Comming soon"
  # ToDo
  
  print("Comming soon")
  
  return(out)
}
