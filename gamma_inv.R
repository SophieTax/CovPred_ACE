gamma_inv = function(gamma_vec){
  gg=gamma_vec%*%t(gamma_vec)
  inv=ginv(gg)
  inv
}