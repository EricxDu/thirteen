local avatar = {
  x = 1,
  y = 1,
  facing = 'south'
}

function avatar:backward()
  if self.facing == 'south' then
    return self.x, self.y - 1
  elseif self.facing == 'west' then
    return self.x + 1, self.y
  elseif self.facing == 'north' then
    return self.x, self.y + 1
  elseif self.facing == 'east' then
    return self.x - 1, self.y
  end
end

function avatar:forward()
  if self.facing == 'south' then
    return self.x, self.y + 1
  elseif self.facing == 'west' then
    return self.x - 1, self.y
  elseif self.facing == 'north' then
    return self.x, self.y - 1
  elseif self.facing == 'east' then
    return self.x + 1, self.y
  end
end

function avatar:leftward()
  if self.facing == 'south' then
    return self.x + 1, self.y
  elseif self.facing == 'west' then
    return self.x, self.y + 1
  elseif self.facing == 'north' then
    return self.x - 1, self.y
  elseif self.facing == 'east' then
    return self.x, self.y - 1
  end
end

function avatar:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function avatar:rightward()
  if self.facing == 'south' then
    return self.x - 1, self.y
  elseif self.facing == 'west' then
    return self.x, self.y - 1
  elseif self.facing == 'north' then
    return self.x + 1, self.y
  elseif self.facing == 'east' then
    return self.x, self.y + 1
  end
end

function avatar:turnleft()
  if self.facing == 'south' then
    self.facing = 'east'
  elseif self.facing == 'east' then
    self.facing = 'north'
  elseif self.facing == 'north' then
    self.facing = 'west'
  elseif self.facing == 'west' then
    self.facing = 'south'
  end
end

function avatar:turnright()
  if self.facing == 'south' then
    self.facing = 'west'
  elseif self.facing == 'west' then
    self.facing = 'north'
  elseif self.facing == 'north' then
    self.facing = 'east'
  elseif self.facing == 'east' then
    self.facing = 'south'
  end
end

function avatar:walk(map, x, y)
  if not map[y] then
    return
  end
  local tile = map[y][x]
  if tile and not self.walkable then
    self.x, self.y = x, y
    return
  end
  if tile and self.walkable[tile] then
    self.x, self.y = x, y
    return
  end
end

return avatar
