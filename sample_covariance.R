sample_covariance=function(data, n){
  K=length(data)
  P=length(n)
  s_cov=list()
  for (i in 1:length(data)){
    s_cov[[i]]=cov(as.matrix(data[[i]]))
  }
  s_cov
}
