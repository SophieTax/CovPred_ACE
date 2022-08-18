cov_pred = function(gamma,beta,data,gginv){
  a<-gginv%*%gamma
  K=length(data$X)
  P=length(gamma)
  c<-gamma%*%gginv
  cov_predicted=list()
  #cov_predicted$YY=array(dim=c(P,P,K))
  for(i in 1:K){
  b<-exp(beta[1]+data$X[i]*beta[2])
  cov_predicted[[i]]=a%*%b%*%c
  }
  #cov_predicted$subj = data$sub
  cov_predicted
}
