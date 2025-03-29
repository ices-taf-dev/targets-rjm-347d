# Comparison between TAF and targets

The [TAF](https://cran.r-project.org/package=TAF) and [targets](https://cran.r-project.org/package=targets) packages have somewhat similar objectives, to organize and run scientific [workflows](https://cran.r-project.org/web/views/ReproducibleResearch.html#project-workflows) or [pipelines](https://cran.r-project.org/web/views/ReproducibleResearch.html#pipeline-toolkits).

A key distinction between the packages is that in `TAF` the user organizes their workflow by writing *scripts* that produce *files*, but in `targets` the user organizes their workflow by writing *functions* that produce *objects*, to be passed to the next step. Thus, the two packages present two different paradigms with a similar end result.

A TAF workflow structure is predetermined, as the main scripts will always be named `data.R`, `model.R`, `output.R`, and `report.R`. After running a TAF analysis, one can always expect to find the data and results in CSV format in the corresponding `data`, `output`, and `report` folders.

In contrast, the `targets` package does not confine the user to a predetermined workflow design, and tables containing data and results are generally accessed by the user as R objects rather than files.

The purpose of the `taf-four-minutes` and `targets-rjm-347d` repositories is to facilitate comparing the functionality of the two packages.

## targets-rjm-347d

This [targets-rjm-347d](https://github.com/ices-taf-dev/targets-rjm-347d) analysis is a simple pipeline organized and run using the `targets` package. It is similar to the ICES TAF [2015_rjm-347d](https://github.com/ices-taf/2015_rjm-347d) demonstration of how workflows are organized and run using the `TAF` (or equivalently `icesTAF`) package.

## How to run

Install the targets package from CRAN. Then open R in the `targets-rjm-347d` directory and run:

```
library(targets)
tar_make()
```

## Browsing or reviewing the analysis

After running the pipeline, the objects can be loaded into the current workspace:

```
tar_objects()
tar_load_everything()
```

Object                  | Content
----------------------- | -------------------------------------------------------
`catch`                 | catch data
`read.csv(survey_file)` | original survey data (1977-2015)
`survey`                | survey data used in the analysis (1993-2014)
`summary`               | catch and combined survey index (1993-2014)
`summary_rnd`           | `summary` table rounded to 3 digits
`dls`                   | catch advice (291 tonnes) and intermediate calculations
`plot`                  | plot showing the combined survey index

## See also

Another comparison between TAF and targets is provided by the [taf-four-minutes](https://github.com/ices-taf-dev/taf-four-minutes) example.

For an overview of the `TAF` package, see the [TAF vignette](https://cran.r-project.org/web/packages/TAF/vignettes/TAF.html).

For an overview of the `targets` package, see the [targets vignette](https://cran.r-project.org/web/packages/targets/vignettes/overview.html).
