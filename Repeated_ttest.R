Repeated_ttest=function(channels, ids_dim, triangle_mat_sample, triangle_mat_pred){
  sample_corresp_elem=vector()
  pred_corresp_elem=vector()
  ttest=list()
  i=1
  for (col in 1:(length(channels)-1)){
    i=i
    for (row in (col+1):length(channels)){
      i=i
      for (s in 1:length(ids_dim)){
        sample_corresp_elem[s]=triangle_mat_sample[row,col,s]
        pred_corresp_elem[s]=triangle_mat_pred[row,col,s]
      }
      test_current=t.test(x=c(sample_corresp_elem), y=c(pred_corresp_elem), paired=TRUE, alternative="two.sided")
      ttest[[i]]=list()
      ttest[[i]]=test_current
      i=i+1
    }
  }
  ttest
}