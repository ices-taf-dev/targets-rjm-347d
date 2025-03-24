plot_summary <- function(summary)
{
  lattice::xyplot(Index~Year, summary, type="b", cex=1, lty=3, lwd=2, col=1,
                  ylim=lim(summary$Index), main="Survey",
                  grid=list(h=-1, v=-1, lty=3, lwd=2))
}
