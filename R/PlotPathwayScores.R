


PlotPathwayScores <- function(pathway_scores,start,end,pathway_names){
 anno<- pathway_scores%>% as.data.frame() %>% rownames_to_column(var = "Cell")
 anno2<-anno[start:end,]
 ggplot(anno2, mapping = aes(x = anno2$Cell, y = anno2$pathway_names)) +
   +     geom_col(position = "dodge", alpha = 0.8, color = "white") +
   +     coord_flip()


}
