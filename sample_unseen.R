sample_unseen = function(covariate,sub){
  unique_X<-unique(covariate)%>%sort(decreasing = FALSE)
  unseen<-data.frame(X=sample(unique_X,size=length(sub),replace=TRUE),sub=sub)
  unseen
}