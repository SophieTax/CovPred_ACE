get_pvalues=function(ttest){
  pvalues=list()
  for (i in 1:length(ttest)){
    pvalues[i]=ttest[[i]][3]
  }
  pvalues
}