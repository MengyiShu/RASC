
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RASC

<!-- badges: start -->
<!-- badges: end -->

The objective of the tool is to reproduce and improve the workflow of the single cell RNA analysis which
includes processing and filtering the data, calculating dimension reduction, unsupervised clustering,
and cell type annotation. The goal of scRNA analysis is to do clustering and classifying cells at singular
cell level. It will perform analysis on the gene expression in every cell with a reference, then annotating
the corresponding cell types. The improvement would be done in the labeling of cell type. For existing
scRNA analysis tool such as Deseq2, they labelled the cell types based on reference signature and
1
the score of each reference gene based on the similarity between sample cells and reference cell’s gene
expression. For example, they will label the cell as type A because this cell mostly resemble gene
expression of cell A. Yet, in some circumstances, some cells don’t resemble any cells, so they will have
a very low score for every reference cell types. However, due to the property of the algorithm, they
will still be labeled with highest score of reference cells they resemble. Thus, some weird cells might
be filtered or marked as normal cells. My package will fix this problem by calculating the average of
the similarity score and finds cell that has low scores and relabeling them with AUcell to make the cell
annotation part more accurate.

## Installation

You can install the development version of RASC like so:

``` r
# FILL THIS IN! HOW CAN PEOPLE INSTALL YOUR DEV PACKAGE?
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(RASC)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
