--[[
Copyright 2022 Eric Duhamel

    This file is part of Thirteen.

    Thirteen is free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Thirteen is distributed in the hope that it will be useful, but
    WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
    General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Thirteen. If not, see <https://www.gnu.org/licenses/>.
--]]
require'xiii'

love.graphics.setDefaultFilter('nearest', 'nearest')

XIII:GFXLOAD{
  [1] = love.graphics.newImage("tiles/dungeon_floor.png"),
  [2] = love.graphics.newImage("tiles/dungeon_wall.png"),
  [3] = love.graphics.newImage("tiles/dungeon_door.png"),
  [4] = love.graphics.newImage("tiles/pillar_exterior.png"),
  [5] = love.graphics.newImage("tiles/dungeon_ceiling.png"),
  [6] = love.graphics.newImage("tiles/grass.png"),
  [7] = love.graphics.newImage("tiles/pillar_interior.png"),
  [8] = love.graphics.newImage("tiles/chest_interior.png"),
  [9] = love.graphics.newImage("tiles/chest_exterior.png"),
 [10] = love.graphics.newImage("tiles/medieval_house.png"),
 [11] = love.graphics.newImage("tiles/medieval_door.png"),
 [12] = love.graphics.newImage("tiles/tree_evergreen.png"),
 [13] = love.graphics.newImage("tiles/grave_cross.png"),
 [14] = love.graphics.newImage("tiles/grave_stone.png"),
 [15] = love.graphics.newImage("tiles/water.png"),
 [16] = love.graphics.newImage("tiles/skull_pile.png"),
 [17] = love.graphics.newImage("tiles/hay_pile.png"),
 [18] = love.graphics.newImage("tiles/locked_door.png"),
 [19] = love.graphics.newImage("tiles/death_speaker.png"),
 ["nightsky"] = love.graphics.newImage("tiles/nightsky.png"),
 ["tempest"] = love.graphics.newImage("tiles/tempest.png")
}

XIII:GFXCTRL( {bg = "tempest"} )

MAP = {1, 2, 3, 9, 2,
       1, 2, 1, 1, 1,
          1, 1, 4
}

TILES = {}

function love.load()
  for i, v in pairs(MAP) do
    TILES[i] = v
  end
  XIII:OBJLOAD(TILES)
end

function love.draw()
  love.graphics.scale(5)
  for _, obj in pairs(XIII.DRAWOBJ0) do love.graphics.draw( unpack(obj) ) end
  for _, obj in pairs(XIII.DRAWOBJ1) do love.graphics.draw( unpack(obj) ) end
end

function love.keypressed(key)
  local x = string.byte(key) % 16
  if x and MAP[x] then
    local n = clamp(MAP[x] + 1, 19)
    MAP[x], TILES[x] = n, {n}
    XIII:OBJCTRL(x, n)
  end
end

function clamp(v, n) return v % n > 0 and v % n or n end
