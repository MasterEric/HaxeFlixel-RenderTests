# HaxeFlixel-RenderTests

A playspace for some experimentation with the HaxeFlixel engine. A testbed for whatever stuff I'm doing.

Things I did here:

* Figure out why large spritesheets were taking up so much memory. 
  - Turns out it's because PNG images are a compressed format, and at runtime they will always take up `width * height * 4` bytes of memory regardless of the original file size. That's just the reality of how images work.
  - Fun fact, you can estimate how much memory an image will take in memory by saving the file in BMP format, which is uncompressed. For example, [Hellclown Tricky's](https://youtu.be/mqo-TUeP8Ro?t=402) idle animation alone takes up 500 MB of memory despite taking only 15 MB of storage.
  - Note that OpenFL is GPU-enabled, so this 500 MB file can be moved into GPU memory to save RAM for stuff your CPU needs, but for users without a graphics card, this is a huge problem.
  - Ways to mitigate this include:
    - Adding some feature to the engine to scale down images in memory, which would reduce graphics quality while improving performance. Sort of a "low graphics" option.
    - Make your images smaller, weighing the balance between graphical fidelity and performance.
    - Store sprites for "pixel" weeks at 1:1, then scale them up in engine. This is how Week 6 does it (just make sure to disable aliasing).
    - Implement different means of rendering your characters, other than spritesheets. This is how Week 7 does it, Tankman's sprite is split into parts and rendered at the appropriate poses at runtime.
      - This can be done using Adobe Animate, Spine, or Dragonbones (which is free!!).
    - Render a 3D model instead. I guess?
* Figure out what all of HaxeFlixel's scaling modes do.
  - I made documentation for them all and submitted it as a PR, so you don't have to sit around fiddling with the options to figure out what you want!
