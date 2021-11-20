#' Function that load dataframe Files
#'
#' A function that read dataframe that contain information about the cells
#' then convert it to a single cell experiment function
#'
#' @param expr_file A file that contains the cell information
#'
#' @return Returns single cell experiment object
#'@export
#'@import dplyr
#'@import tidyverse
#'@import SingleR
#'@import data.table
#'
#' @examples
#' expr=load_expression(Patient_data)
#'
#' # Access sce value
#' expr


# function to load SCE
load_expression <- function(exprs_file){
  # load count matrix with cells and genes
  exprs <- setDT(exprs_file)

  # remove header row, get counts and genes
  counts <- exprs[which((exprs[,1]!="Gene") | (exprs[,1]!="gene")),-1]
  genes <- exprs[which((exprs[,1]!="Gene") | (exprs[,1]!="gene")),1]

  # matrix of counts
  count_matrix <- data.matrix(counts) %>% as(., "dgCMatrix")
  #transpose
  rownames(count_matrix) <- genes[[1]]
  #add t(count_matrix) to transpose
  sce <- SingleCellExperiment(list(counts = t(count_matrix)))

  return(sce)
}
