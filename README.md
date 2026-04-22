# renovae: Reproduction of SpatialExperiment-to-AnnData conversion issue

`renovae` serves as a reproduction case for an issue encountered when converting `SpatialExperiment` objects to `AnnData` using the `anndataR` package, specifically in the context of the [novae](https://github.com/MICS-Lab/novae) deep learning framework.

## The Issue

When converting a `SpatialExperiment` object back to `AnnData` (via `anndataR::from_SpatialExperiment`), the downstream Python analysis fails to recognize the spatial neighbor information, even after an explicit neighbor computation step. 

For more details, please see the [repro vignette](vignettes/repro.Rmd).

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

`renovae` requires the `novae` and `scanpy` Python packages. You can install them via `pip`:

```bash
pip install novae scanpy
```

## License

This package is licensed under the MIT License.
