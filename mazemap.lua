local function facing_north(map, up, origin, position, default)
  if type(map) ~= 'table' or type(up) ~= 'number' then return end
  if type(origin) ~= 'number' or type(position) ~= 'number' then return end
  up = math.floor(up)
  origin = math.floor(origin % #map)
  local tile = map[origin - up - up - 2]  --upstage right
  if position == 2 then
    tile = map[origin - up - up + 2]  --upstage left
  elseif position == 3 then
    tile = map[origin - up - up - 1]  --upstage right center
  elseif position == 4 then
    tile = map[origin - up - up + 1]  --upstage left center
  elseif position == 5 then
    tile = map[origin - up - up]  --upstage up center
  elseif position == 6 then
    tile = map[origin - up - 2]  --centerstage right
  elseif position == 7 then
    tile = map[origin - up + 2]  --centerstage left
  elseif position == 8 then
    tile = map[origin - up - 1]  --centerstage right center
  elseif position == 9 then
    tile = map[origin - up + 1]  --centerstage left center
  elseif position == 10 then
    tile = map[origin - up]  --centerstage center
  elseif position == 11 then
    tile = map[origin - 1]  --downstage right center
  elseif position == 12 then
    tile = map[origin + 1]  --downstage left center
  elseif position == 13 then
    tile = map[origin]  --downstage down center
  end
  return tile and tile or default
end

return facing_north
