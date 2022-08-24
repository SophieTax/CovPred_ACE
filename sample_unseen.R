sample_unseen = function(covariate,sub){
  unique_X<-unique(covariate)%>%sort(decreasing = FALSE)
  max=max(unique_X)
  min=min(unique_X)
  unseen<-data.frame(X=sample(seq(min,max,by=0.5),size=length(sub),replace=TRUE),sub=sub)
  unseen
}