back_to_matrix=function(regions, channels, pvalues){
  P = matrix(,regions,regions)
  i=1
  for (col in 1:(length(channels)-1)){
    i=i
    for (row in (col+1):length(channels)){
      P[row,col]=pvalues[i]
      i=i+1
    }
  }
  P
}