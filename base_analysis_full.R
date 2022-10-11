base_analysis_full=function(Y_c_group1, Y_c_group2, channels){
  #Compute sample covariance matrices for the 2 groups
  sample_cov_group1=sample_covariance(Y_c_group1,channels)
  sample_cov_group2=sample_covariance(Y_c_group2,channels)
  
  #Compute prediction covariance matrices for the 2 groups. Here: use avg_cov
  avg_cov_group1=Reduce("+", sample_cov_group1)/length(sample_cov_group1)
  avg_cov_group2=Reduce("+", sample_cov_group2)/length(sample_cov_group2)
  
  predicted_cov_for_group1 <- replicate(length(Y_c_group1), avg_cov_group2, simplify=FALSE)
  predicted_cov_for_group2 <- replicate(length(Y_c_group2), avg_cov_group1, simplify=FALSE)
  
  #Generate vectors for treatment and control
  #ids=append(group1_ids,group2_ids)
  
  Y_t=append(sample_cov_group1,predicted_cov_for_group2)
  #names(Y_t)=ids
  
  Y_c=append(predicted_cov_for_group1,sample_cov_group2)
  #names(Y_c)=ids
  
  
  #Get triangular matrices
  Y_t_triangle=list()
  for (i in 1:length(Y_t)){
    Y_t_triangle[[i]]=get_triangle(Y_t[[i]], triangle="LOWER")
  }
  
  Y_c_triangle=list()
  for (k in 1:length(Y_c)){
    Y_c_triangle[[k]]=get_triangle(Y_c[[k]], triangle="LOWER")
  }
  
  #One t-test on all cells
  all_cells<-Repeated_ttest(channels,triangle="LOWER",Y_t_triangle,Y_c_triangle)
  
  outputs=list(sample_1=sample_cov_group1, sample2=sample_cov_group2, pred1=predicted_cov_for_group1, pred2=predicted_cov_for_group2, test=all_cells)
  outputs
  
}