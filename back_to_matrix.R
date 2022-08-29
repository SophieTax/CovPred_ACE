back_to_matrix=function(regions, channels, pvalues, triangle){
  P = matrix(,regions,regions)
  i=1
  #Upper triangle
  if (triangle=="UPPER"){
  for (col in 2:length(channels)){
    i=i
    for (row in 1:(col-1)){
      P[row,col]=pvalues[i]
      i=i+1
    }
  }
  }
  #Lower triangle
  else if (triangle=="LOWER"){
  for (col in 1:(length(channels)-1)){
    i=i
    for (row in (col+1):length(channels)){
      P[row,col]=pvalues[i]
      i=i+1
    }
  }
  }
  P
}