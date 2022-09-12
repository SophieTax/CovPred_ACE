prediction_analysis=function(Y_c_group1, X_group1, Y_c_group2, X_group2, channels, group1_ids, group2_ids){
  #Compute sample covariance matrices for the 2 groups
  sample_cov_group1=sample_covariance(Y_c_group1,channels,group1_ids)
  sample_cov_group2=sample_covariance(Y_c_group2,channels,group2_ids)
  
  #Compute prediction covariance matrices for the 2 groups. Here: use prediction formulas
  
  fit_group1<-capReg(Y_c_group1,X_group1,method="CAP")
  fit_group2<-capReg(Y_c_group2,X_group2,method = "CAP")
  
  gg_inv_g1<-gamma_inv(fit_group1$gamma)
  gg_inv_g2<-gamma_inv(fit_group2$gamma)
  
  predicted_cov_group1 = cov_pred(fit_group1$gamma,fit_group1$beta,X_group1[,2],gg_inv_g1)
  predicted_cov_group2 = cov_pred(fit_group2$gamma,fit_group2$beta,X_group2[,2],gg_inv_g2)
  
  
  #Generate vectors for treatment and control
  ids=append(group1_ids,group2_ids)
  
  Y_t=append(sample_cov_group1,predicted_cov_group2)
  names(Y_t)=ids
  
  Y_c=append(predicted_cov_group1,sample_cov_group2)
  names(Y_c)=ids
  
  #Get triangular matrices
  Y_t_triangle=list()
  for (i in 1:length(ids)){
    Y_t_triangle[[i]]=get_triangle(Y_t[[i]], triangle="LOWER")
  }
  
  Y_c_triangle=list()
  for (k in 1:length(ids)){
    Y_c_triangle[[k]]=get_triangle(Y_c[[k]], triangle="LOWER")
  }
  
  names(Y_t_triangle)<-ids
  names(Y_c_triangle)<-ids
  
  #One single t-test
  tmp_Yt=vector()
  for (s in 1:length(ids)){
    tmp_Yt[s]=Y_t_triangle[[s]][9,6]
  }
  
  tmp_Yc=vector()
  for (s in 1:length(ids)){
    tmp_Yc[s]=Y_c_triangle[[s]][9,6]
  }
  cell1_test=t.test(x=c(tmp_Yt), y=c(tmp_Yc),paired=TRUE, alternative = "two.sided")
  
  outputs=list(sample_1=sample_cov_group1, sample2=sample_cov_group2, pred1=predicted_cov_group1, pred2=predicted_cov_group2, test=cell1_test)
  outputs
}