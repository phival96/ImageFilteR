#Example load image as bitmap
my_bitmap <- load_image("../Test image-1.jpg")

#Example pixel test
pixel_test <- as.raw(c(50, 120, 10))
grey_filter(pixel_test)
green_filter(pixel_test)

#Examples to Filter the Image
grey_image <- filter_bitmap(my_bitmap, grey_filter)
image_read(grey_image)

red_image <- filter_bitmap(my_bitmap, red_filter)
image_read(red_image)

green_image <- filter_bitmap(my_bitmap, green_filter)
image_read(green_image)

blue_image <- filter_bitmap(my_bitmap, blue_filter)
image_read(blue_image)

#Example Cutoff Filter Image
cutoff_image <- filter_bitmap(my_bitmap, cutoff_filter)
image_read(cutoff_image)

# Example to save an image
save_images(
  list(grey_image, red_image, green_image, blue_image, cutoff_image),
  c("grey", "red", "green", "blue","Cutoff")
)
