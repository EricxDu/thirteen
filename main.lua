--[[ SPDX-License-Identifier: CC0-1.0 --]]

--[[ This demo utilizes the functional libraries provided to render a 
simple navigable map. It is compatible with LÖVE and Lutro. --]]

Mazemap = require'mazemap'
Tile = require'tile'

dungeon_ceiling = Tile(love.graphics.newImage("tiles/dungeon_ceiling.png"), 80, 120)
dungeon_door = Tile(love.graphics.newImage("tiles/dungeon_door.png"), 80, 120)
dungeon_floor = Tile(love.graphics.newImage("tiles/dungeon_floor.png"), 80, 120)
dungeon_wall = Tile(love.graphics.newImage("tiles/dungeon_wall.png"), 80, 120)
grass = Tile(love.graphics.newImage("tiles/grass.png"), 80, 120)
pillar_exterior = Tile(love.graphics.newImage("tiles/pillar_exterior.png"), 80, 120)
template_floor = Tile(love.graphics.newImage("tiles/template_floor.png"), 80, 120)

this_tileset = {
  dungeon_floor,
  dungeon_wall,
  dungeon_door,
  pillar_exterior,
  dungeon_ceiling,
  grass
}

global_map0 = {
  0,0,2,2,3,2,2,0,0,
  0,0,2,4,1,4,2,0,0,
  2,2,2,1,1,1,2,2,2,
  2,6,6,4,1,4,6,6,2,
  2,6,6,1,1,1,6,6,2,
  2,2,6,4,1,4,6,2,2,
  2,3,1,1,1,1,1,3,2,
  2,2,6,4,1,4,6,2,2,
  2,6,6,1,1,1,6,6,2,
  2,6,6,4,1,4,6,6,2,
  2,2,2,2,3,2,2,2,2
}

LOCATE = 14
WIDTH = 9

for k, v in ipairs(global_map0) do
  global_map0[k] = this_tileset[v]
end

global_tiles0 = {}

global_stage0 = Mazemap.north(global_map0, WIDTH, LOCATE)
global_scene0 = global_stage0(LOCATE)

function love.load()
  for x=1,13,1 do
    table.insert(
      global_tiles0,
      global_scene0(x)
    )
  end
end

function love.update(dt)
end

function love.draw()
  love.graphics.scale(5)
  for i, tile in ipairs(global_tiles0) do
    if tile then 
      love.graphics.draw(tile(i))
    end
  end
end
