--[[ SPDX-License-Identifier: CC0-1.0 --]]

--[[ This demo utilizes the functional libraries provided to render a 
simple navigable map. It is compatible with LÖVE and Lutro. --]]

Mazemap = require'mazemap'
Tileset = require'tileset'

dungeon_ceiling = Tileset("tiles/dungeon_ceiling.png")
dungeon_door = Tileset("tiles/dungeon_door.png")
dungeon_floor = Tileset("tiles/dungeon_floor.png")
dungeon_wall = Tileset("tiles/dungeon_wall.png")
grass = Tileset("tiles/grass.png")
pillar_exterior = Tileset("tiles/pillar_exterior.png")
template_floor = Tileset("tiles/template_floor.png")

this_tileset = {
  dungeon_floor,
  dungeon_wall,
  dungeon_door,
  pillar_exterior,
  dungeon_ceiling,
  grass
}

global_map0 = {
  {0,0,2,2,3,2,2,0,0},
  {0,0,2,4,1,4,2,0,0},
  {2,2,2,1,1,1,2,2,2},
  {2,6,6,4,1,4,6,6,2},
  {2,6,6,1,1,1,6,6,2},
  {2,2,6,4,1,4,6,2,2},
  {2,3,1,1,1,1,1,3,2},
  {2,2,6,4,1,4,6,2,2},
  {2,6,6,1,1,1,6,6,2},
  {2,6,6,4,1,4,6,6,2},
  {2,2,2,2,3,2,2,2,2}
}

avatar = {
  x = 5,
  y = 2
}

for y, line in ipairs(global_map0) do
  for x, v in ipairs(line) do
    line[x] = this_tileset[v]
  end
end

global_tiles0 = {}

global_stage0 = Mazemap.west(global_map0)
global_scene0 = global_stage0(avatar.x, avatar.y)

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
