#' Scores the SCE with AUCell
#'
#' A function Scores a data matrix with AUCell in batches. Idea is to limit memory consumption when
#' scoring with AUCell
#'
#' @param inp_data SCE object
#' @param genesets geneset that you want test with the SCE object,amed list of character vectors, each consisting of a set of gene symbols
#' @param num_batches umber of batches to run AUCell for. More batches = fewer cells (observations)
##                  for each batch used for scoring
#'
#' @return Returns an either an nxp matrix (samples x scores)
#'
#' @examples
#' expr <- load_expression("mf_patient02.csv")
#' pathway_scores <- AUCell_batch(counts(expr), genesets = c(hallmarks), num_batches=20)
#' # Access pathway_scores
#' pathway_scores
#'
#'
#' @export
#' @import scater
#' @import dplyr
#' @import tidyverse
#' @import SingleR
#' @import data.table
#' @import scran



AUCell_batch <- function(inp_data, genesets, num_batches = 100) {

  num_cells <- ncol(inp_data)
  batch_size <- ceiling(num_cells/num_batches)
  score_mat <- c()
  print('Running AUCell scoring')
  Sys.time()
  for (i in 1:num_batches) {
    print(paste('batch', i, Sys.time()))
    ind1 <- (i-1)*batch_size + 1
    ind2 <- i*batch_size
    if (ind2 > num_cells) {
      ind2 <- num_cells
    }
    gene_rankings <- AUCell::AUCell_buildRankings(inp_data[,ind1:ind2], plotStats = FALSE)
    score_mat_i <- AUCell::AUCell_calcAUC(geneSets = genesets, rankings = gene_rankings)
    score_mat_i <- t(assay(score_mat_i, 'AUC'))
    score_mat <- rbind(score_mat, score_mat_i)
    gc(full = TRUE, verbose = TRUE)
  }
  print('Finished Scoring')
  print(Sys.time())
  return(score_mat)
}
