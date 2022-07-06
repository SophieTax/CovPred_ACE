sample_covariance = function(data, factor_name, level_name) {
  data_sub = data[which(data[factor_name] == level_name),] %>% droplevels
  region_ids = str_detect(names(ts_subject_info),"R") %>% which
  subject_ids = table(data_sub$Subject) %>% names
  s_cov = list()
  K = length(subject_ids)
  P = length(region_ids)
  s_cov$YY = array(dim = c(K,P,P))
  for(i in 1:K) {
    Y = subset(data_sub,Subject == subject_ids[i])[,region_ids]
    Y_c = scale(Y,center = TRUE,scale = FALSE)
    s_cov$YY[i,,] = t(Y_c) %*% Y_c
  }
  s_cov$N = table(data_sub$Subject)
  s_cov
}