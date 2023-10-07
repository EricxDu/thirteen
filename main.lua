--[[ SPDX-License-Identifier: CC0-1.0 --]]

--[[ This demo utilizes the functional libraries provided to render a 
simple navigable map. It is compatible with LÖVE and Lutro. --]]

Atlas = require'atlas'
Avatar = require'avatar'
Mazemap = require'mazemap'
Tileset = require'tileset'

avatar = Avatar:new{x = 6, y = 3}

chest_exterior = Tileset.tile("tiles/chest_exterior.png")
chest_interior = Tileset.tile("tiles/chest_interior.png")
dungeon_ceiling = Tileset.tile("tiles/dungeon_ceiling.png")
dungeon_door = Tileset.tile("tiles/dungeon_door.png")
dungeon_floor = Tileset.tile("tiles/dungeon_floor.png")
dungeon_wall = Tileset.tile("tiles/dungeon_wall.png")
grass = Tileset.tile("tiles/grass.png")
medieval_house = Tileset.tile("tiles/medieval_house.png")
medieval_door = Tileset.tile("tiles/medieval_door.png")
pillar_exterior = Tileset.tile("tiles/pillar_exterior.png")
pillar_interior = Tileset.tile("tiles/pillar_interior.png")
template_floor = Tileset.tile("tiles/template_floor.png")
tree_evergreen = Tileset.tile("tiles/tree_evergreen.png")

this_tileset = {
  dungeon_floor,
  dungeon_wall,
  dungeon_door,
  pillar_exterior,
  dungeon_ceiling,
  grass,
  pillar_interior,
  chest_interior,
  chest_exterior,
  medieval_house,
  medieval_door,
  tree_evergreen
}

avatar.walkable = {
  [dungeon_floor] = true,
  [dungeon_wall] = false,
  [dungeon_door] = true,
  [pillar_exterior] = false,
  [dungeon_ceiling] = true,
  [grass] = true,
  [pillar_exterior] = false,
  [chest_interior] = true,
  [chest_exterior] = true,
  [medieval_house] = false,
  [medieval_door] = true,
  [tree_evergreen] = false
}

function load_map(number, x, y)
  global_exits0 = Atlas.exits[number]
  global_map0 = {}
  avatar.x, avatar.y = x, y
  for y, line in ipairs(Atlas.maps[number]) do
    global_map0[y] = {}
    for x, v in ipairs(line) do
      global_map0[y][x] = this_tileset[v]
    end
  end
  global_tiles0 = {}
  global_stage0 = Mazemap[avatar.facing](global_map0)
  global_scene0 = global_stage0(avatar.x, avatar.y)
  for x=1,13,1 do
    table.insert(
      global_tiles0,
      global_scene0(x)
    )
  end
end

load_map(1, avatar.x, avatar.y)

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
  local x, y, tile = avatar.x, avatar.y
  if b == 4 then
    avatar:walk(global_map0, avatar:forward())
    for k, tab in ipairs(global_exits0) do
      if tab.exit_x == avatar.x and tab.exit_y == avatar.y then
        load_map(tab.dest_map, tab.dest_x, tab.dest_y)
      end
    end
  elseif b == 5 then
    avatar:walk(global_map0, avatar:backward())
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
