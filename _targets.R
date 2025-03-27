library(targets)

tar_option_set(
  packages = c("icesTAF", "icesAdvice")
)

tar_source()

list(
  tar_target(
    catch_file, "data/catch.csv", format = "file",
    description = "Annual catch"
  ),
  tar_target(
    survey_file, "data/surveys_all.csv", format = "file",
    description = "Survey indices: IBTS1, IBTS3, Unknown, and UKBTS3"
  ),
  tar_target(catch, data_catch(catch_file)),
  tar_target(survey, data_survey(survey_file)),
  tar_target(summary, data_summary(catch, survey)),
  tar_target(dls, model(catch, survey)),
  tar_target(plot, plot_summary(summary)),
  tar_target(summary_rnd, round_summary(summary))
)
