# renovae: Interoperability between SpatialExperiment and AnnData

`renovae` provides an interface to the [novae](https://github.com/MICS-Lab/novae) deep learning framework for spatial
transcriptomics, ensuring seamless interoperability between R-native `SpatialExperiment` objects and Python-native
`AnnData` structures.

## Overview

The package leverages `anndataR` to facilitate high-fidelity conversion between R and Python objects.

For more details and a demonstration of the workflow, please see the [interop vignette](vignettes/interop.Rmd).

## Installation

You can install the development version of `renovae` from GitHub:

```r
# Install dependencies
if (!require("remotes")) install.packages("remotes")
remotes::install_github("sales-lab/anndataR@from_as_spe")

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
