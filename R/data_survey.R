data_survey <- function(file)
{
  # Read data, select years and surveys of interest
  survey <- read.taf(file)
  survey <- survey[survey$Year %in% 1993:2014, names(survey) != "Unknown"]

  # Scale each survey to average 1, combine index as average of three surveys
  survey[-1] <- sapply(survey[-1], function(x) x/mean(x, na.rm=TRUE))
  survey$Index <- rowMeans(survey[-1])

  # Finalize table
  row.names(survey) <- NULL

  survey
}
