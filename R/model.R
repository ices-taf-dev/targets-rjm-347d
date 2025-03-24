model <- function(catch, survey)
{
  # Apply DLS method 3.2, comparing 5 years and 2 years
  DLS3.2(mean(catch$Catch), survey$Index, len=c(5,2))
}
