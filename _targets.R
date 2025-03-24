library(targets)
tar_option_set(
  packages = c("icesTAF")
)

tar_source()

list(
  tar_target(
    name = catch_file,
    command = "data/initial/catch.csv",
    format = "file",
    description = "Annual catch prepared by WGEF in 2015, containing data from 2012-2014"
  ),
  tar_target(
    name = catch,
    command = get_catch(catch_file)
  )
)
