Thirteen
========

A state machine for rendering tiles designed for Heroine Dusk.

Demonstration
-------------

Included is a simple demo in "main.lua". Simply run LÖVE in the root
directory.

  $ love .

This demo allows you to cycle through the tiles shown at each position
by sending keyboard input. Each key is associated with a tile position,
so try to find which keys will let you render a scene you like!

Future iterations of the demo may implement a simple spatial movement
system.

How to Use Thirteen
-------------------

Use `require"xiii"` at the top of your LÖVE source file(s). Control the
machine using the global table "XIII" with the following function and
table calls. `{type}` means you must provide a table containing
particular values to the function, while `a, b, c` means you must
provide those values to the function, in order. "args" refers to a
a table with named fields.

+ XIII:GFXLOAD({Drawables})
  - send Drawables by calling this function with a table of Drawables
  - used for background images to draw on object layer 0
  - used for tilesheets to draw tiles on object layer 1
  - function overwrites any Drawable with the same key as a previous Drawable
+ XIII:GFXCTRL({args})
  - function accepts the following arguments
  - bg: key to set object layer 0 from the table of Drawables
+ XIII:OBJLOAD({values})
  - send tile data by calling this function with a table of values
  - each value is a key that refers to the table of Drawables
  - function adds an object to DRAWOBJ1 for each valid value
  - function supports 13 consecutive values; extra values are invalid
+ XIII:OBJCTRL(x, k)
  - change the tile at position x to refer to tilesheet k
  - there are 13 valid positions; all other positions are invalid
+ XIII.DRAWOBJ0
  - object layer 0 (background); draw all the objects in this table first
+ XIII.DRAWOBJ1
  - object layer 1 (tiles); draw all the objects in this table second
+ Objects
  - each object is a table with up to four elements in this order
  - 1 = Drawable (from the table of Drawables)
  - 2 = Quad (userdata)
  - 3 = x position (number)
  - 4 = y position (number)
