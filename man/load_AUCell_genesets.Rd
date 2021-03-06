% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/LoadAUcell.R
\name{load_AUCell_genesets}
\alias{load_AUCell_genesets}
\title{Load geneset that will be used in calculating AUcell}
\usage{
load_AUCell_genesets(path, ignore_cols = 1)
}
\arguments{
\item{path}{A gmt file contains all the pathway score information}

\item{ignore_cols}{depends on the format of gmt file exclude the headers}
}
\value{
Returns an list contain name of the pathway and its corresponding genes
that enriched in that gene set
}
\description{
A function that load gmt file into R
}
\examples{
hallmarks = load_AUCell_genesets("h.all.v7.4.symbols.gmt", ignore_cols=2)
# Access hallmarks
hallmarks


}
