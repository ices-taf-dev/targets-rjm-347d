data_catch <- function(file)
{
  read.taf(file)
}

data_summary <- function(catch, survey)
{
  merge(catch, survey[c("Year","Index")], all=TRUE)
}

data_survey <- function(file)
{
  # Read data, select years and surveys of interest
  survey <- read.taf(file)
  survey <- survey[survey$Year %in% 1993:2014, names(survey) != "Unknown"]

  # Scale each survey to average 1, combine index as average of three surveys
  survey[-1] <- sapply(survey[-1], function(x) x / mean(x, na.rm=TRUE))
  survey$Index <- rowMeans(survey[-1])

  # Finalize table
  row.names(survey) <- NULL

  survey
}

model <- function(catch, survey)
{
  # Apply DLS method 3.2, comparing 5 years and 2 years
  DLS3.2(mean(catch$Catch), survey$Index, len=c(5, 2))
}

plot_summary <- function(summary)
{
  lattice::xyplot(Index~Year, summary, type="b", cex=1, lty=3, lwd=2, col=1,
                  ylim=lim(summary$Index), main="Survey",
                  grid=list(h=-1, v=-1, lty=3, lwd=2))
}

round_summary <- function(summary)
{
  rnd(summary, c("Catch", "Index"), c(0, 3))
}
