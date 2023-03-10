% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Plot_live_imports.R
\name{Plot_live_imports}
\alias{Plot_live_imports}
\title{Plot the number of live imports by Source}
\usage{
Plot_live_imports(data, Species, min_year = 2009)
}
\arguments{
\item{data}{The dataset to use (needs to be an export from the CITES database)}

\item{Species}{The species name e.g. "Python bivittatus"}

\item{min_year}{A year filter default is >2009 (so start year is 2010)}
}
\description{
Plot the number of live imports by Source
}
\examples{
Plot_live_imports(data=vkmCites::Pythons, Species="Python bivittatus")
}
