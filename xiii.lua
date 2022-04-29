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

XIII = {
  drawable = {}, --{Drawables}
  DRAWOBJ0 = {}, --{tables}
  DRAWOBJ1 = {}, --{tables}
  GFXLOAD = function (self, tab)
    for k, v in pairs(tab) do
      self.drawable[k] = v
    end
    self.image = self.Image(self.drawable)
    self.object = self.Object(self.image, self.quad, self.origin)
  end,
  GFXCTRL = function (self, arg)
    if arg.bg then
      self.DRAWOBJ0 = { {self.image(arg.bg)} }
    end
  end,
  OBJCTRL = function (self, k, v)
  	local x = self.order(k)
    self.DRAWOBJ1[x] = self.object(v, x)
  end,
  OBJLOAD = function (self, tab)
    for k, v in pairs(tab) do
    	local x = self.order(k)
      self.DRAWOBJ1[x] = self.object(v, x)
    end
  end
}

XIII.Image = function (tab)
  return function (key)
  	return tab[key]
  end
end

XIII.Object = function (image, quad, origin)
	return function (x, y)
		return {image(x), quad(y), origin(y)}
	end
end

XIII.order = function (x)
  if     x == 1  then return 1
  elseif x == 2  then return 3
  elseif x == 3  then return 5
  elseif x == 4  then return 4
  elseif x == 5  then return 2
  elseif x == 6  then return 6
  elseif x == 7  then return 8
  elseif x == 8  then return 10
  elseif x == 9  then return 9
  elseif x == 10 then return 7
  elseif x == 11 then return 11
  elseif x == 12 then return 13
  elseif x == 13 then return 12
  end
end

XIII.origin = function (n)
  if n == 1 then return      0,  0
  elseif n == 2 then return  80, 0
  elseif n == 3 then return  0,  0
  elseif n == 4 then return  80, 0
  elseif n == 5 then return  0,  0
  elseif n == 6 then return  0,  0
  elseif n == 7 then return  80, 0
  elseif n == 8 then return  0,  0
  elseif n == 9 then return  80, 0
  elseif n == 10 then return 0,  0
  elseif n == 11 then return 0,  0
  elseif n == 12 then return 80, 0
  elseif n == 13 then return 0,  0
  end
end

XIII.quad = function (n)
  local new = love.graphics.newQuad
  if     n == 1 then return  new(0,   0,   80,  120, 640, 240)
  elseif n == 2 then return  new(80,  0,   80,  120, 640, 240)
  elseif n == 3 then return  new(160, 0,   80,  120, 640, 240)
  elseif n == 4 then return  new(240, 0,   80,  120, 640, 240)
  elseif n == 5 then return  new(320, 0,   160, 120, 640, 240)
  elseif n == 6 then return  new(480, 0,   80,  120, 640, 240)
  elseif n == 7 then return  new(560, 0,   80,  120, 640, 240)
  elseif n == 8 then return  new(0,   120, 80,  120, 640, 240)
  elseif n == 9 then return  new(80,  120, 80,  120, 640, 240)
  elseif n == 10 then return new(160, 120, 160, 120, 640, 240)
  elseif n == 11 then return new(320, 120, 80,  120, 640, 240)
  elseif n == 12 then return new(400, 120, 80,  120, 640, 240)
  elseif n == 13 then return new(480, 120, 160, 120, 640, 240)
  end
end
