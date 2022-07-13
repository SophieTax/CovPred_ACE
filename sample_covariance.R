sample_covariance=function(data,regions,subj){
  K=length(data)
  P=length(regions)
  s_cov=list()
  s_cov$cov=array(dim=c(K,P,P))
  for(i in 1:K){
    s_cov$cov[i,,]=cov(as.matrix(data[[i]]))
  }
  s_cov
}
