load_AUCell_genesets <- function(path, ignore_cols = 1){
  x <- scan(path, what="", sep="\n")
  y <- strsplit(x, "\t")
  names(y) <- sapply(y, `[[`, 1)
  for(i in 1:ignore_cols){
    y <- lapply(y, `[`, -1)
  }
  return(y)
}
