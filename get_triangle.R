get_triangle=function(data, triangle){
  m<-data
  if (triangle=="UPPER"){
  #gets upper triangle
  t<-lower.tri(m,diag=TRUE)
  m[t]=NA
  }
  else {
  #gets lower triangle
  t<-upper.tri(m, diag = TRUE)
  m[t]=NA
  }
  m
}