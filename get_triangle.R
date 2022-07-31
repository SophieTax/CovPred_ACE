get_triangle=function(data){
  m<-data
  t<-upper.tri(m, diag = TRUE)
  m[t]=NA
  m
}