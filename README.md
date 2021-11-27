# HaxeFlixel-RenderTests

A playspace for some experimentation with the HaxeFlixel engine. A testbed for whatever stuff I'm doing.

## Notes on Memory Usage for Textures

The tl;dr is that, regardless of the image format, an image will take up `width * height * 4` bytes in memory. This can be GPU memory if you have enough, but if you want to have a spritesheet of that size in memory, there's no workaround.

For example, the `tricky.png` image is `11,706 x 10,864 x 4 = 508,695,936` bytes in memory, or 508.7 MB, which matches what is seen when profiling this sample application. This may vary due to spritesheeting and power-of-two padding. You can also approximate this value by opening the image in an editor, then saving as a BMP file (a lossless format).

The fact that the `tricky.png` file is actually only 14.9 MB on disk is actually the result of the highly efficient PNG image compression format.

The best way to mitigate issues is to take the following steps:
* Have some way of downscaling sprites in memory? This would make images blurry but save memory.
  * Make this a manual option? Make this automatic by detecting memory usage somehow?
* Just make your images smaller.
* Implement Spine, Dragonbones, and Adobe Animate image formats to provide more animation with smaller files.
* Store "pixel" sprites as 1-1 then upscale them in engine (like how Week 6 does it).
