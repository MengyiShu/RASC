#' Load geneset that will be used in calculating AUcell
#'
#' A function that load gmt file into R
#'
#' @param path A gmt file contains all the pathway score information
#' @param ignore_cols depends on the format of gmt file exclude the headers
#'
#' @return Returns an list contain name of the pathway and its corresponding genes
#' that enriched in that gene set
#'
#' @examples
#' hallmarks = load_AUCell_genesets("h.all.v7.4.symbols.gmt", ignore_cols=2)
#' # Access hallmarks
#' hallmarks
#'
#'
#' @export
#' @import scater
#' @import dplyr
#' @import tidyverse
#' @import SingleR
#' @import data.table
#' @import scran




load_AUCell_genesets <- function(path, ignore_cols = 1){
  x <- scan(path, what="", sep="\n")
  y <- strsplit(x, "\t")
  names(y) <- sapply(y, `[[`, 1)
  for(i in 1:ignore_cols){
    y <- lapply(y, `[`, -1)
  }
  return(y)
}
