knn_analysis_full=function(X_1, X_2, Y_c_group1, Y_c_group2, channels, K){
  #Compute sample covariance matrices for the 2 groups
  sample_cov_group1=sample_covariance(Y_c_group1,channels)
  sample_cov_group2=sample_covariance(Y_c_group2,channels)
  
  #Predicted for short
  prcov_for_g1=list()
  for (i in 1:length(X_1)){
    nn=nn2(X_2, X_1[i], k=K)
    nn_Ys=sample_cov_group2[nn$nn.idx]
    new_avg_knn=Reduce("+", nn_Ys)/length(nn_Ys)
    prcov_for_g1[[i]]=new_avg_knn
  }
  
  prcov_for_g2=list()
  for (i in 1:length(X_2)){
    nn=nn2(X_1, X_2[i], k=K)
    nn_Ys=sample_cov_group1[nn$nn.idx]
    new_avg_knn=Reduce("+", nn_Ys)/length(nn_Ys)
    prcov_for_g2[[i]]=new_avg_knn
  }
  
  Y_t=append(sample_cov_group1, prcov_for_g2)
  Y_c=append(prcov_for_g1, sample_cov_group2)
  
  Y_t_triangle=list()
  for (i in 1:length(Y_t)){
    Y_t_triangle[[i]]=get_triangle(Y_t[[i]], triangle="LOWER")
  }
  
  Y_c_triangle=list()
  for (k in 1:length(Y_c)){
    Y_c_triangle[[k]]=get_triangle(Y_c[[k]], triangle="LOWER")
  }
  
  all_cells<-Repeated_ttest(channels,triangle="LOWER",Y_t_triangle,Y_c_triangle)
  
  outputs=list(sample_1=sample_cov_group1, sample2=sample_cov_group2, pred1=prcov_for_g1, pred2=prcov_for_g2, test=all_cells)
  outputs
}