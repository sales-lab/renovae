#' Perform a one-slide zero-short inference.
#'
#'
#' @param spe A `SpatialExperiment` object.
#' @param gpu Use a GPU accelerator.
#' @returns The embedding matrix computed by `novae`.
#'
#' @export
novae_run <- function(spe, gpu = FALSE) {
  ad <- anndataR::from_SpatialExperiment(spe)
  
  nv <- reticulate::import("novae")
  nv$spatial_neighbors(ad, radius=80)
  model <- nv$Novae$from_pretrained("MICS-Lab/novae-human-0")

  accel <- ifelse(gpu, "cpu", "gpu")
  model$compute_representations(
    ad,
    zero_shot = TRUE,
    accelerator = accel
  )

  latent <- ad$adata.obsm["novae_latent"]
  return(latent)
}
