#' Sorts a dataset file by the genomic position of the probes.
#' @param dataset Dataset file.
#' @param output_file_name Name of the file in which sorted data are stored.
#' @return the input matrix ordered by the genomic position of the probes.
#' @references
#' Morganella S., and Ceccarelli M. VegaMC: a R/bioconductor package for fast
#' downstream analysis of large array comparative genomic hybridization
#' datasets. Bioinformatics, 28(19):2512-4 (2012).
#' @note This function allows to sort a dataset by the genomic position. The
#' input file must have the chromosome and the position in column two and three
#' respectively. This format follows the standard output of PennCNV. An example
#' of file can be found in inst/example folder.
sortData <- function(dataset, output_file_name = "") {
  if (!file.exists(dataset)) {
    message("ERROR: Specified Input File does not Exist")
    return(FALSE)
  }
  if (output_file_name == "" ||
    substr(
      output_file_name,
      nchar(output_file_name), nchar(output_file_name)
    ) == "/") {
    message(
      "ERROR: You must provide the name of the file",
      " in which sorted data are saved"
    )
    return(FALSE)
  }
  res <- .C(
    "sort_data", as.character(dataset),
    as.character(output_file_name)
  )
}
