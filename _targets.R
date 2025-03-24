library(targets)
tar_option_set(
  packages = c("icesTAF")
)

tar_source()

list(
  tar_target(
    name = catch_file,
    command = "data/catch.csv",
    format = "file",
    description = "Annual catch"
  ),
  tar_target(
    name = survey_file,
    command = "data/surveys_all.csv",
    format = "file",
    description = "Survey indices: IBTS1, IBTS3, Unknown, and UKBTS3"
  ),
  tar_target(
    name = catch,
    command = data_catch(catch_file)
  ),
  tar_target(
    name = survey,
    command = data_survey(survey_file)
  )
)
