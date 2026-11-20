#' Author: Philipp Valina Allo
#'
#' Date: 20.11.2026
#'
#' Image Processing
#'
#' This file contains functions for applying filters to an entire
#' bitmap, creating threshold-based images and saving filtered images
#'
#' Filter Bitmap:
#' Applies a selected filter function to every pixel in the bitmap
#'
#' Parameters:
#' bitmap: The image containing the RGB pixel values
#' color_filter_function: The filter function to apply
#'
#' How it works:
#' Uses two "for" loops to go through the X and Y coordinates of the image.
#' Each pixel is passed to the selected color filter function and replaced with the modified RGB values
#'
#' Cutoff Filter:
#' Converts an RGB pixel into grayscale and compares its intensity with a specified cutoff value
#' Depending on the result, the pixel is replaced with magenta or black
#'
#' Parameters:
#' pixel: A raw vector containing three RGB values
#' cutoff: The grayscale threshold (default = 127)
#'
#' How it works:
#' Calculates the grayscale intensity using weighted RGB values
#' If the intensity is below the cutoff, the pixel becomes magenta
#' If the intensity is above the cutoff, the pixel becomes black
#'
#' Save Images:
#' Saves multiple filtered images into a folder called "results"
#'
#' Parameters:
#' images: A list containing the filtered bitmap images
#' names: Names used for the saved image files
#'
#' How it works:
#' Checks whether the results folder exists and creates it if needed
#' Then goes through the image list and saves each image using the corresponding filename
#'
#' Required package: magick
#'
#' @export
#Filter function
filter_bitmap <- function(bitmap, filter_function) {
  for (x in 1:dim(bitmap)[2]) {
    for (y in 1:dim(bitmap)[3]) {
      bitmap[, x, y] <- filter_function(bitmap[, x, y])}
  }
  return(bitmap)
}

#' @export
#Cutoff Filter
cutoff_filter <- function(pixel, cutoff = 127) {
  rgb <- as.integer(pixel)
  grey <- round(
    rgb[1] * 0.299 +
      rgb[2] * 0.587 +
      rgb[3] * 0.114)
  if (grey < cutoff) {
    return(as.raw(c(255, 0, 255)))
  } else {
    return(as.raw(c(0, 0, 0)))}
}

#' @export
# Save the image
save_images <- function(images, names) {
  if (!dir.exists("results")) {
    dir.create("results")
  }
  for (i in seq_along(images)) {
    image <- magick::image_read(images[[i]])
    magick::image_write(
      image,
      path = paste0("results/", names[i], ".jpg"))}
}
