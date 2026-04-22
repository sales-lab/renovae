#' Perform a one-slide zero-shot inference using the `novae` model.
#'
#' This function computes high-dimensional embeddings for each cell or spot in a
#' spatial transcriptomics dataset using a pre-trained `novae` model.
#' It supports both native `SpatialExperiment` objects and `AnnData` objects
#' (via `reticulate`).
#'
#' @param obj A `SpatialExperiment` object or an `AnnData` object loaded
#'   through `reticulate`.
#' @param accelerator The hardware accelerator to use for computation.
#'   Supported values include `"auto"`, `"cpu"`, `"cuda"`, `"gpu"`, and `"mps"`.
#'   Defaults to `"auto"`.
#'
#' @returns A numeric matrix of the latent representations (embeddings)
#'   computed by `novae`, where rows correspond to cells/spots and columns
#'   to latent features.
#'
#' @export
novae_run <- function(obj, accelerator = "auto") {
  if (is(obj, "SpatialExperiment")) {
    ad <- anndataR::from_SpatialExperiment(obj, output_class = "ReticulateAnnData")
  } else if (is(obj, "ReticulateAnnData")) {
    ad <- obj
  } else {
    stop("unsupported object type")
  }

  nv <- reticulate::import("novae")
  nv$spatial_neighbors(ad, radius=80)
  model <- nv$Novae$from_pretrained("MICS-Lab/novae-human-0")

  model$compute_representations(
    ad,
    zero_shot = TRUE,
    accelerator = accelerator
  )

  ad$obsm[["novae_latent"]]
}
