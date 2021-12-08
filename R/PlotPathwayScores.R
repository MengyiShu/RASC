#' Plot pathway scores for given rows of cell
#'
#' A function that plot and illustrate the enrichment of a given pathway for given cells
#'
#' @param pathway_scores Result get from AUCell_batch which contain the rank based on AUCell
#' of every cells in a geneset.The rows contains the barcodes of each cell.
#' @param start number of rows that you want start with
#' @param end number of rows that you want end
#' @param pathway_names the name of the pathway you want to compare with
#'
#' @return Returns a plot with y axis with cell barcodes and their expression level
#' of certain pathways
#'
#' @examples
#' expr <- load_expression("mf_patient02.csv")
#' pathway_scores <- AUCell_batch(counts(expr), genesets = c(hallmarks), num_batches=20)
#' Plot <- PlotPathwayScores(pathway_scores,1,3,HALLMARK_CHOLESTEROL_HOMEOSTASIS)
#' # Access plot
#' plot
#'
#'
#' @export
#' @import scater
#' @import dplyr
#' @import tidyverse
#' @import SingleR
#' @import data.table
#' @import scran


PlotPathwayScores <- function(pathway_scores,start,end,pathway_names){
 anno<- pathway_scores%>% as.data.frame() %>% rownames_to_column(var = "Cell")
 anno2<-anno[start:end,]
 ggplot(anno2, mapping <- aes(x <- anno2$Cell, y <- anno2$pathway_names)) +
     geom_col(position <- "dodge", alpha <- 0.8, color <- "white") +
   +     coord_flip()


}
