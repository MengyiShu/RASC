#' Launch Shiny App for RASC
#'
#' A function that launches the Shiny app for RASC.
#' The shiny app permit to plot a histogram that showed comparison between certain
#' number of rows for a given pathway
#'
#' @return No return value but open up a Shiny page.
#'
#' @examples
#' \dontrun{
#'
#' RASC::runRASC()
#' }
#'
#' @references
#' Grolemund, G. (2015). Learn Shiny - Video Tutorials. \href{https://shiny.rstudio.com/tutorial/}{Link}
#'
#' @export
#' @importFrom shiny runApp

runRASC <- function() {
  appDir <- system.file("shiny-scripts",
                        package = "RASC")
  shiny::runApp(appDir, display.mode = "normal")
  return()
}
# [END]
