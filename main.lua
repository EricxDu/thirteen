--[[ SPDX-License-Identifier: CC0-1.0 --]]

--[[ This demo utilizes the functional libraries provided to render a 
simple navigable map. It is compatible with LÖVE and Lutro. --]]

Atlas = require'atlas'
Avatar = require'avatar'
Mazemap = require'mazemap'
Tileset = require'tileset'

avatar = Avatar:new{x = 6, y = 3}

container_exterior = Tileset.tile("tiles/container_exterior.png")
container_interior = Tileset.tile("tiles/container_interior.png")
grass = Tileset.tile("share/320x240/tiles/grass.png")
hay_pile = Tileset.tile("share/320x240/tiles/hay_pile.png")
medieval_house = Tileset.tile("share/320x240/tiles/medieval_house.png")
medieval_door = Tileset.tile("share/320x240/tiles/medieval_door.png")
metallic_ceiling = Tileset.tile("tiles/metallic_ceiling.png")
metallic_door = Tileset.tile("tiles/metallic_door.png")
metallic_floor = Tileset.tile("tiles/metallic_floor.png")
metallic_wall = Tileset.tile("tiles/metallic_wall.png")
support_exterior = Tileset.tile("tiles/support_exterior.png")
support_interior = Tileset.tile("tiles/support_interior.png")
tree_evergreen = Tileset.tile("share/320x240/tiles/tree_evergreen.png")
water = Tileset.tile("share/320x240/tiles/water.png")

this_tileset = {
  metallic_floor,
  metallic_wall,
  metallic_door,
  support_exterior,
  metallic_ceiling,
  grass,
  support_interior,
  container_interior,
  container_exterior,
  medieval_house,
  medieval_door,
  tree_evergreen,
  [15] = water,
  [17] = hay_pile
}

avatar.walkable = {
  [container_interior] = true,
  [container_exterior] = true,
  [grass] = true,
  [metallic_ceiling] = true,
  [metallic_door] = true,
  [metallic_floor] = true
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
