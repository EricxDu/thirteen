--[[ SPDX-License-Identifier: CC0-1.0 --]]

--[[ Tile is a function with image data that can be rendered at any one 
of thirteen positions within the view. --]]

local function tilefun(texture, w, h, position)
  local quad = love.graphics.newQuad(0, 0, w, h, w*8, h*2)
  local x, y = 0, 0
  if position == 2 then
    quad = love.graphics.newQuad(w, 0, w, h, w*8, h*2)
    x, y = w, 0
  elseif position == 3 then
    quad = love.graphics.newQuad(w*2, 0, w, h, w*8, h*2)
    x, y = 0, 0
  elseif position == 4 then
    quad = love.graphics.newQuad(w*3, 0, w, h, w*8, h*2)
    x, y = w, 0
  elseif position == 5 then
    quad = love.graphics.newQuad(w*4, 0, w*2, h, w*8, h*2)
    x, y = 0, 0
  elseif position == 6 then
    quad = love.graphics.newQuad(w*6, 0, w, h, w*8, h*2)
    x, y = 0, 0
  elseif position == 7 then
    quad = love.graphics.newQuad(w*7, 0, w, h, w*8, h*2)
    x, y = w, 0
  elseif position == 8 then
    quad = love.graphics.newQuad(0, h, w, h, w*8, h*2)
    x, y = 0, 0
  elseif position == 9 then
    quad = love.graphics.newQuad(w, h, w, h, w*8, h*2)
    x, y = w, 0
  elseif position == 10 then
    quad = love.graphics.newQuad(w*2, h, w*2, h, w*8, h*2)
    x, y = 0, 0
  elseif position == 11 then
    quad = love.graphics.newQuad(w*4, h, w, h, w*8, h*2)
    x, y = 0, 0
  elseif position == 12 then
    quad = love.graphics.newQuad(w*5, h, w, h, w*8, h*2)
    x, y = w, 0
  elseif position == 13 then
    quad = love.graphics.newQuad(w*6, h, w*2, h, w*8, h*2)
    x, y = 0, 0
  end
  return texture, quad, x, y
end

local function tile(texture, w, h)
  return function (position)
    return tilefun(texture, w, h, position)
  end
end

return tile
