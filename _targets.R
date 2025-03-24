library(targets)
tar_option_set(
  packages = c("icesTAF")
)

tar_source()

list(
  tar_target(
    name = catch,
    command = read.taf("data/catch.csv")
  )
)
