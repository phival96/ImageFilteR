#' Author: Philipp Valina Allo
#'
#' Date: 20.11.2026
#'
#' Load an image
#'
#' This function reads an image from a specific path
#' And converts it into a bitmap containing the RGB pixel values
#'
#'
#' Parameter: the path to the image JPEG or another supported file
#'
#' Required package: magick
#'
#' How it works:
#' First the image is imported using image_read() from magick
#' Then the first element of the image object is extracted
#' The bitmap is assigned to an object
#'
#' @export
load_image <- function(path) {
  image <- magick::image_read(path)
  bitmap <- image[[1]]
  return(bitmap)
}
