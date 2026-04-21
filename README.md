# renovae: An R Interface for the Novae Deep Learning Framework

`renovae` provides a proof-of-concept R interface to the [novae](https://github.com/MICS-Lab/novae) deep learning framework for spatial transcriptomics. It allows users to perform zero-shot inference on `SpatialExperiment` objects within the R environment via `reticulate`.

## Installation

You can install the development version of `renovae` from GitHub:

```r
# Install dependencies
if (!require("remotes")) install.packages("remotes")
remotes::install_github("drighelli/anndataR@from_as_spe")

# Install renovae
remotes::install_github("renovae/renovae")
```

### Python Dependencies

`renovae` requires the `novae` Python package. You can install it via `pip`:

```bash
pip install novae
```

## Usage

The main function `novae_run` performs one-slide zero-shot inference on a `SpatialExperiment` object.

```r
library(renovae)
library(SpatialExperiment)

# Perform zero-shot inference
# spe: A SpatialExperiment object
latent <- novae_run(spe, gpu = FALSE)
```

## License

This package is licensed under the MIT License.
