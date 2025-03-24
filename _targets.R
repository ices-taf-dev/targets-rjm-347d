library(targets)
tar_option_set(
  packages = c("icesTAF", "icesAdvice")
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
  ),
  tar_target(
    name = summary,
    command = data_summary(catch, survey)
  ),
  tar_target(
    name = dls,
    command = model(catch, survey)
  ),
  tar_target(
    name = plot,
    command = plot_summary(summary)
  )
)
