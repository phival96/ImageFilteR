#' Author: Philipp Valina Allo
#'
#' Date: 20.11.2026
#'
#' Color Filters
#'
#' Contains four functions for manipulating RGB pixel values
#' Each function takes one pixel as input and returns modified RGB values
#'
#' Grey Filter:
#' Converts an RGB pixel into grayscale
#'
#' Red Filter:
#' Keeps the red channel and sets green and blue to zero
#'
#' Green Filter:
#' Keeps the green channel and sets red and blue to zero
#'
#' Blue Filter:
#' Keeps the blue channel and sets red and green to zero
#'
#' Parameter:
#' pixel: A raw vector containing RGB values
#'
#' How it works:
#' First, the raw RGB values are converted into integers.
#' Then the selected filter modifies the individual color channels.
#' The modified values are converted back into raw format.
#'
#' @export

#Grey Filter
grey_filter <- function(pixel) {
  rgb <- as.integer(pixel)
  grey <- round(
      rgb[1] * 0.299 +
      rgb[2] * 0.587 +
      rgb[3] * 0.114)
  return(as.raw(c(grey, grey, grey)))
}

#Red Filter
red_filter <- function(pixel) {
  rgb <- as.integer(pixel)
  as.raw(c(rgb[1], 0, 0))
}

#Green Filter
green_filter <- function(pixel) {
  rgb <- as.integer(pixel)
  as.raw(c(0, rgb[2], 0))
}

#Blue Filter
blue_filter <- function(pixel) {
  rgb <- as.integer(pixel)
  as.raw(c(0, 0, rgb[3]))
}
