base_analysis_full=function(Y_c_group1, X_group1, Y_c_group2, X_group2, channels, group1_ids, group2_ids){
  #Compute sample covariance matrices for the 2 groups
  sample_cov_group1=sample_covariance(Y_c_group1,channels,group1_ids)
  sample_cov_group2=sample_covariance(Y_c_group2,channels,group2_ids)
  
  sample_cov_group1_arr<- array( unlist(sample_cov_group1) , c(length(channels),length(channels), length(group1_ids)) )
  sample_cov_group2_arr<- array( unlist(sample_cov_group2) , c(length(channels),length(channels),length(group2_ids)) )
  
  #Compute prediction covariance matrices for the 2 groups. Here: use avg_cov
  #avg_cov_group1=Reduce("+", sample_cov_group1)/length(sample_cov_group1)
  avg_cov_group1=rowMeans(sample_cov_group1_arr, dims = 2)
  #avg_cov_group2=Reduce("+", sample_cov_group2)/length(sample_cov_group2)
  avg_cov_group2=rowMeans(sample_cov_group2_arr, dims = 2)
  
  predicted_cov_group1 <- replicate(length(group1_ids), avg_cov_group1, simplify=FALSE)
  predicted_cov_group2 <- replicate(length(group2_ids), avg_cov_group2, simplify=FALSE)
  
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
  
  #One t-test on all cells
  all_cells<-Repeated_ttest(channels,ids,triangle="LOWER",Y_t_triangle,Y_c_triangle)
  
  outputs=list(sample_1=sample_cov_group1, sample2=sample_cov_group2, pred1=predicted_cov_group1, pred2=predicted_cov_group2, test=all_cells)
  outputs
  
}