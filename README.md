
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RASC

<!-- badges: start -->
<!-- badges: end -->

`RASC` stands for RNA Analysis for single Cell.`RASC` is a tool that
reproduce and improve the workflow of the single cell RNA analysis which
includes processing and filtering the data, calculating dimension
reduction, unsupervised clustering,and cell type annotation. The goal of
scRNA analysis is to do clustering and classifying cells at single cell
level. It will perform analysis on the gene expression in every cell
with a reference, then annotating the corresponding cell types.The
reference should includes the unique gene expression of different cell
type. The improvement would be done in the labeling of cell type part.
For existing scRNA analysis tool such as Deseq2, they labelled the cell
types based on reference signature and the score of each reference gene
based on the similarity between sample cells and reference cell’s gene
expression. For example, they will label the cell as type A because this
cell mostly resemble gene expression of cell A. Yet, in some
circumstances, some cells don’t resemble any cells, so they will have a
very low score for every reference cell types. However, due to the
property of the algorithm, they will still be labeled with highest score
of reference cells they resemble. Thus, some weird cells might be
filtered or marked as normal cells. My package will fix this problem by
provide alternative way to label the cell type.My package will rank the
cell based on their enrichment in different pathways,so users might then
use this information to label the cell other than compare with the
reference cell signature to make the labeling part more accurate. The
version of R is 4.1.0 and the platform used for this package is windows

## Installation

You can install the development version of RASC like so:

``` r
require("devtools")
devtools::install_github("MengyiShu/RASC", build_vignettes = TRUE)
library("RASC")
```

To run the shinyApp:

``` r
runRASC()
```

## Overview

``` r
ls("package:RASC")
data(package = "RASC")
```

An overview of the package is illustrated below:
![](./inst/extdata/RASC.png) This package will read in dataframe that
contain scRNA data and pathway information in gmt file and rank the
cells based on the enrichment of geneset in the pathways.

``` r
browseVignettes("RASC")
```

## Contributions

The author of the package is Mengyi Shu. The *load_expression* function
in LoadSingleCellFile.R makes use of map function from `data.table` and
`Single Cell Experiment` R package to generate load matrix into single
cell experiment object. *AUCell_Batch* function has been using
algorithms in AUCell package in R.It used “Area Under Curve” to
calculate the rank of single-cell RNA sequence in the given pathways.The
*PlotPathwayScore* function has used build-in function in scater,dyplr
to plot the graph that represent distribution of given gene and
pathways.

## Reference

Lawrence, M., & Turaga, N. (2021, March 27). Orchestrating Single Cell
Analysis. GitHub. Retrieved October 26, 2021, from
<https://github.com/Bioconductor/OrchestratingSingleCellAnalysis>

Bethan Psaila, et. al, (2020). Single-Cell Analyses Reveal
Megakaryocyte-Biased Hematopoiesis in Myelofibrosis and Identify Mutant
Clone-Specific Targets. Molecular cell, 78(3), 477–492.e8.
<https://doi.org/10.1016/j.molcel.2020.04.008>

Newman, A., Liu, C., Green, M. et al. Robust enumeration of cell subsets
from tissue expression profiles. Nat Methods 12, 453–457 (2015).
<https://doi.org/10.1038/nmeth.3337>

Van Galen, P., Hovestadt, et al (2019). Single-Cell RNA-Seq Reveals AML
Hierarchies Relevant to Disease Progression and Immunity. Cell, 176(6),
1265-1281.e24. <https://doi.org/10.1016/> j.cell.2019.01.031

Newman, A., Liu, C., Green, M. et al. Robust enumeration of cell subsets
from tissue expression profiles. Nat Methods 12, 453–457 (2015).
<https://doi.org/10.1038/nmeth.3337>

Van Galen, P., Hovestadt, et al (2019). Single-Cell RNA-Seq Reveals AML
Hierarchies Relevant to Disease Progression and Immunity. Cell, 176(6),
1265-1281.e24. <https://doi.org/10.1016/> j.cell.2019.01.031

## Acknowledgements

This package was developed as part of an assessment for 2021 BCB410H:
Applied Bioinformatics, University of Toronto, Toronto, CANADA.
