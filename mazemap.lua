--[[ SPDX-License-Identifier: CC0-1.0 --]]

local function direction(map, o, x, y)
  return function (n)
    if n == 1 then
      --[[ upstage right--]]
      return map[o + y + y + x + x]
    elseif n == 2 then
      --[[ upstage left--]]
      return map[o + y + y - x - x]
    elseif n == 3 then
      --[[ upstage right center--]]
      return map[o + y + y + x]
    elseif n == 4 then
      --[[ upstage left center--]]
      return map[o + y + y - x]
    elseif n == 5 then
      --[[ upstage up center--]]
      return map[o + y + y]
    elseif n == 6 then
      --[[ centerstage right--]]
      return map[o + y + x + x]
    elseif n == 7 then
      --[[ centerstage left--]]
      return map[o + y - x - x]
    elseif n == 8 then
      --[[ centerstage right center--]]
      return map[o + y + x]
    elseif n == 9 then
      --[[ centerstage left center--]]
      return map[o + y - x]
    elseif n == 10 then
      --[[ centerstage center--]]
      return map[o + y]
    elseif n == 11 then
      --[[ downstage right center--]]
      return map[o + x]
    elseif n == 12 then
      --[[ downstage left center--]]
      return map[o - x]
    elseif n == 13 then
      --[[ downstage down center--]]
      return map[o]
    end
  end
end

local function funposition(fun)
end

local function north(map, up)
  if type(map) ~= 'table' then return end
  if type(up) ~= 'number' then return end
  up = math.floor(up)
  return function (origin)
    if type(origin) ~= 'number' then return end
    origin = math.floor(origin % #map)
    local fun1 = direction(map, origin, -1, -up)
    return function (position)
      if type(position) ~= 'number' then return end
      position = math.floor(position)
      local tile = fun1(position)
      return tile and tile or false
    end
  end
end

return {
  north = north
}
