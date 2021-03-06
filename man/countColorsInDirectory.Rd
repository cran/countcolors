% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/count_colors_in_images.R
\name{countColorsInDirectory}
\alias{countColorsInDirectory}
\title{Count colors within range(s) in every image in a directory}
\usage{
countColorsInDirectory(folder, color.range = "spherical", center, radius,
  lower, upper, bg.lower = rep(0.8, 3), bg.upper = rep(1, 3),
  target.color = c("magenta", "cyan", "yellow"), plotting = FALSE,
  save.indicator = FALSE, dpi = 72, return.indicator = FALSE)
}
\arguments{
\item{folder}{Path to a folder containing images.}

\item{color.range}{Type of range being specified. Must be either "spherical"
or "rectangular".}

\item{center}{A vector or n x 3 matrix of color centers (RGB triplets) around
which to search using spherical color range. RGB range 0-1 (not 0-255). See
details.}

\item{radius}{Values between 0 and 1 specifying the size of the area around
\code{center} to search. The same number of centers and radii must be
specified.}

\item{lower}{RGB triplet(s) specifying the bounds of color space
to search. Must be the same length. See details.}

\item{upper}{RGB triplet(s) specifying the bounds of color space
to search. Must be the same length. See details.}

\item{bg.lower}{RGB triplets specifying the bounds of color space to
ignore as background, or \code{NULL} to use the entire image.}

\item{bg.upper}{RGB triplets specifying the bounds of color space to
ignore as background, or \code{NULL} to use the entire image.}

\item{target.color}{If an indicator image is created, the color with which to
replace specified pixels. Can be either an RGB triplet or one of the
colors listed by \code{\link[grDevices]{colors}}.}

\item{plotting}{Logical. Should output be plotted in the plot window?}

\item{save.indicator}{Logical OR path for saving indicator image. If TRUE,
saves image to the same directory as the original image as
'originalimagename_masked.png'; if a path is provided, saves it to that
directory/name instead.}

\item{dpi}{Resolution (dots per image) for saving indicator image.}

\item{return.indicator}{Logical. Should an indicator image (RGB array with
targeted pixels changed to indicator color) be returned?}
}
\value{
A list of \code{\link{countColors}} lists, one for each image.
}
\description{
A wrapper for \code{\link{countColors}} that finds every image (JPEG or PNG) in a #' folder and counts colors in each image.
}
\examples{
\dontrun{
folder <- system.file("extdata", package = "countcolors")

# Screen out white in both the flower image and the pelican image
upper <- c(1, 1, 1)
lower <- c(0.8, 0.8, 0.8)

white.screen <- countcolors::countColorsInDirectory(folder, color.range =
"rectangular", upper = upper, lower = lower, bg.lower = NULL, plotting =
TRUE, target.color = "turquoise")
}
}
\seealso{
\code{\link{countColors}}
}
