data_summary <- function(catch, survey)
{
  merge(catch, survey[c("Year","Index")], all=TRUE)
}
