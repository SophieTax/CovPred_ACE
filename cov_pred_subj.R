cov_pred_subj = function(gamma,beta,X,gginv){
  a<-gginv%*%gamma
  b<-exp(beta[1]+X[1,2]*beta[2])
  c<-gamma%*%gginv
  sig_hat_si<-a%*%b%*%c
  sig_hat_si
}