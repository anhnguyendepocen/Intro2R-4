#' @title Read all xl files
#'
#' @description This function will read a collection of xl files into R's workplace
#'
#' @details This will greatly reduce the amount of work needed to perform analyses since the reading of files can be time consuming.
#'
#' @param dird this is the directory structure as a string
#'
#' @return a named list of the files read
#' @export
#'
#' @examples
#' \dontrun{
#' v<-myreadxl()
#' }
myreadxl <- function(dird = "D:/MATH4773-5773/DATA/Excel/"){

  #library(readxl)

  files = list.files(dird)
  #files

  myconvert = function(xl) {
    if(stringr::str_ends(xl, "XLS") | stringr::str_ends(xl, "xls")){
      v=try(readxl::read_xls(paste0(dird, xl)), silent = TRUE)
    }
    else{
      v = NA
    }
    v
  }

  v  = purrr::map(files, ~myconvert(.x))
  l <- stringr::str_length(files)
  #l
  newnames <- stringr::str_sub(files,1,l-4)
  #new names
  names(v) <- newnames
  invisible(v)
}
