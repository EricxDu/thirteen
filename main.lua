--[[ SPDX-License-Identifier: CC0-1.0 --]]

--[[ This demo utilizes the functional libraries provided to render a 
simple navigable map. It is compatible with LÖVE and Lutro. --]]

Atlas = require'atlas'
Avatar = require'avatar'
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

this_walkable = {
  true,
  false,
  true,
  false,
  true,
  true
}

global_map0 = Atlas.maps[1]

avatar = Avatar:new{x = 6, y = 3}

for y, line in ipairs(global_map0) do
  for x, v in ipairs(line) do
    line[x] = this_tileset[v]
  end
end

global_tiles0 = {}

global_stage0 = Mazemap[avatar.facing](global_map0)
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

function love.joystickpressed(n, b)
  local x, y = avatar.x, avatar.y
  if b == 4 then
    x, y = avatar:forward()
    avatar.x, avatar.y = x, y
  elseif b == 5 then
    avatar.x, avatar.y = avatar:backward()
  elseif b == 6 then
    avatar:turnleft()
  elseif b == 7 then
    avatar:turnright()
  end
  global_stage0 = Mazemap[avatar.facing](global_map0)
  global_scene0 = global_stage0(avatar.x, avatar.y)
  global_tiles0 = set_tiles(global_scene0)
end

function set_tiles(scene)
  local tiles = {}
  for x = 1, 13, 1 do
    tiles[x] = scene(x)
  end
  return tiles
end
