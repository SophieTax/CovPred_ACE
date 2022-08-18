sample_covariance=function(data,regions,subj){
  K=length(data)
  P=length(regions)
  s_cov=list()
  for(i in 1:K){
    s_cov[[i]]=cov(as.matrix(data[[i]]))
  }
  
  s_cov
}
