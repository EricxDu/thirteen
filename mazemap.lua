--[[ SPDX-License-Identifier: CC0-1.0 --]]

local function array2d(map, x, y)
  local value = false
  if map[y] then
    if map[y][x] then
      value = map[y][x]
    end
  end
  return value
end

local function east(map)
  local map = function (x, y)
    return array2d(map, x, y)
  end
  return function (x, y)
    return function (n)
      local tile = false
      if n == 1 then
        tile = map(x + 2, y - 2)        --[[ upstage right--]]
      elseif n == 2 then
        tile = map(x + 2, y + 2)        --[[ upstage left--]]
      elseif n == 3 then
        tile = map(x + 2, y - 1)        --[[ upstage right center--]]
      elseif n == 4 then
        tile = map(x + 2, y + 1)        --[[ upstage left center--]]
      elseif n == 5 then
        tile = map(x + 2, y)        --[[ upstage up center--]]
      elseif n == 6 then
        tile = map(x + 1, y - 2)        --[[ centerstage right--]]
      elseif n == 7 then
        tile = map(x + 1, y + 2)        --[[ centerstage left--]]
      elseif n == 8 then
        tile = map(x + 1, y - 1)        --[[ centerstage right center--]]
      elseif n == 9 then
        tile = map(x + 1, y + 1)        --[[ centerstage left center--]]
      elseif n == 10 then
        tile = map(x + 1, y)        --[[ centerstage center--]]
      elseif n == 11 then
        tile = map(x, y - 1)        --[[ downstage right center--]]
      elseif n == 12 then
        tile = map(x, y + 1)        --[[ downstage left center--]]
      elseif n == 13 then
        tile = map(x, y)        --[[ downstage down center--]]
      end
      return tile
    end
  end
end

local function north(map)
  local map = function (x, y)
    return array2d(map, x, y)
  end
  return function (x, y)
    return function (n)
      local tile = false
      if n == 1 then
        tile = map(x - 2, y - 2)        --[[ upstage right--]]
      elseif n == 2 then
        tile = map(x + 2, y - 2)        --[[ upstage left--]]
      elseif n == 3 then
        tile = map(x - 1, y - 2)        --[[ upstage right center--]]
      elseif n == 4 then
        tile = map(x + 1, y - 2)        --[[ upstage left center--]]
      elseif n == 5 then
        tile = map(x, y - 2)        --[[ upstage up center--]]
      elseif n == 6 then
        tile = map(x - 2, y - 1)        --[[ centerstage right--]]
      elseif n == 7 then
        tile = map(x + 2, y - 1)        --[[ centerstage left--]]
      elseif n == 8 then
        tile = map(x - 1, y - 1)        --[[ centerstage right center--]]
      elseif n == 9 then
        tile = map(x + 1, y - 1)        --[[ centerstage left center--]]
      elseif n == 10 then
        tile = map(x, y - 1)        --[[ centerstage center--]]
      elseif n == 11 then
        tile = map(x - 1, y)        --[[ downstage right center--]]
      elseif n == 12 then
        tile = map(x + 1, y)        --[[ downstage left center--]]
      elseif n == 13 then
        tile = map(x, y)        --[[ downstage down center--]]
      end
      return tile
    end
  end
end

local function south(map)
  local map = function (x, y)
    return array2d(map, x, y)
  end
  return function (x, y)
    return function (n)
      local tile = false
      if n == 1 then
        tile = map(x + 2, y + 2)        --[[ upstage right--]]
      elseif n == 2 then
        tile = map(x - 2, y + 2)        --[[ upstage left--]]
      elseif n == 3 then
        tile = map(x + 1, y + 2)        --[[ upstage right center--]]
      elseif n == 4 then
        tile = map(x - 1, y + 2)        --[[ upstage left center--]]
      elseif n == 5 then
        tile = map(x, y + 2)        --[[ upstage up center--]]
      elseif n == 6 then
        tile = map(x + 2, y + 1)        --[[ centerstage right--]]
      elseif n == 7 then
        tile = map(x - 2, y + 1)        --[[ centerstage left--]]
      elseif n == 8 then
        tile = map(x + 1, y + 1)        --[[ centerstage right center--]]
      elseif n == 9 then
        tile = map(x - 1, y + 1)        --[[ centerstage left center--]]
      elseif n == 10 then
        tile = map(x, y + 1)        --[[ centerstage center--]]
      elseif n == 11 then
        tile = map(x + 1, y)        --[[ downstage right center--]]
      elseif n == 12 then
        tile = map(x - 1, y)        --[[ downstage left center--]]
      elseif n == 13 then
        tile = map(x, y)        --[[ downstage down center--]]
      end
      return tile
    end
  end
end

local function west(map)
  local map = function (x, y)
    return array2d(map, x, y)
  end
  return function (x, y)
    return function (n)
      local tile = false
      if n == 1 then
        tile = map(x - 2, y + 2)        --[[ upstage right--]]
      elseif n == 2 then
        tile = map(x - 2, y - 2)        --[[ upstage left--]]
      elseif n == 3 then
        tile = map(x - 2, y + 1)        --[[ upstage right center--]]
      elseif n == 4 then
        tile = map(x - 2, y - 1)        --[[ upstage left center--]]
      elseif n == 5 then
        tile = map(x - 2, y)        --[[ upstage up center--]]
      elseif n == 6 then
        tile = map(x - 1, y + 2)        --[[ centerstage right--]]
      elseif n == 7 then
        tile = map(x - 1, y - 2)        --[[ centerstage left--]]
      elseif n == 8 then
        tile = map(x - 1, y + 1)        --[[ centerstage right center--]]
      elseif n == 9 then
        tile = map(x - 1, y - 1)        --[[ centerstage left center--]]
      elseif n == 10 then
        tile = map(x - 1, y)        --[[ centerstage center--]]
      elseif n == 11 then
        tile = map(x, y + 1)        --[[ downstage right center--]]
      elseif n == 12 then
        tile = map(x, y - 1)        --[[ downstage left center--]]
      elseif n == 13 then
        tile = map(x, y)        --[[ downstage down center--]]
      end
      return tile
    end
  end
end

return {
  east = east,
  north = north,
  south = south,
  west = west
}
