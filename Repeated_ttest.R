Repeated_ttest=function(channels, ids_dim, triangle, list_triangle_Yt, list_triangle_Yc){
  corresp_elem_Yt=vector()
  corresp_elem_Yc=vector()
  ttest=list()
  
  #Upper triangle
  if (triangle=="UPPER"){
  i=1
  for (col in 2:(length(channels))){
    i=i
    for (row in 1:(col-1)){
      i=i
      for (s in 1:length(ids_dim)){
        corresp_elem_Yt[s]=list_triangle_Yt[[s]][row,col]
        corresp_elem_Yc[s]=list_triangle_Yc[[s]][row,col]
        }
      test_current=t.test(x=c(corresp_elem_Yt), y=c(corresp_elem_Yc), paired=TRUE, alternative="two.sided")
      ttest[[i]]=list()
      ttest[[i]]=test_current
      i=i+1
      }
    }
  }
  #Lower triangle
  else {
  i=1
  for (col in 1:(length(channels)-1)){
    i=i
    for (row in (col+1):length(channels)){
      i=i
      for (s in 1:length(ids_dim)){
        corresp_elem_Yt[s]=list_triangle_Yt[[s]][row,col]
        corresp_elem_Yc[s]=list_triangle_Yc[[s]][row,col]
        }
      test_current=t.test(x=c(corresp_elem_Yt), y=c(corresp_elem_Yc), paired=TRUE, alternative="two.sided")
      ttest[[i]]=list()
      ttest[[i]]=test_current
      i=i+1
      }
    }
  }
  ttest
}