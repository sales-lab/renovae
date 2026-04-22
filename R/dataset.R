#' Load Janesick Breast Cancer Crop (h5ad)
#'
#' Loads a 25000x25000 pixel crop of the 10x Genomics Xenium Human Breast
#' Cancer FFPE dataset (Rep 1).
#'
#' @details
#' Reference: Janesick et al., Nature Communications, 2023.
#' Source: https://www.10xgenomics.com/datasets/xenium-ffpe-human-breast-cancer-rep1
#'
#' @return An AnnData object (via reticulate).
#' @export
load_janesick_h5ad <- function() {
  sc <- reticulate::import("scanpy")
  filename <- fs::path_package("extdata", "janesick.h5ad", package = "renovae")
  sc$read_h5ad(filename)
}

#' Load Janesick Breast Cancer Crop (rds)
#'
#' Loads a 25000x25000 pixel crop of the 10x Genomics Xenium Human Breast
#' Cancer FFPE dataset (Rep 1) as a SpatialExperiment object.
#'
#' @details
#' Reference: Janesick et al., Nature Communications, 2023.
#' Source: https://www.10xgenomics.com/datasets/xenium-ffpe-human-breast-cancer-rep1
#'
#' @return A SpatialExperiment object.
#' @export
load_janesick_spe <- function() {
  filename <- fs::path_package("extdata", "janesick.rds", package = "renovae")
  readRDS(filename)
}
