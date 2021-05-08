-- Settings for sneeker mod


local time_min = 60

--- Sets possibility for spawn.
--
--  Inverted value (e.g. 10000 = 1/10000).
--
--  @setting sneeker.spawn_chance
sneeker.spawn_chance = tonumber(core.settings:get("sneeker.spawn_chance") or 10000)

--- Sets frequency of spawn chance.
--
--  Default 240 is equivalent to 4 minutes (60 * 4).
--
--  @setting sneeker.spawn_interval
sneeker.spawn_interval = tonumber(core.settings:get("sneeker.spawn_interval") or time_min * 4)

--- Sets the minimum light that a node must have for spawn to occur.
--
--  Default: 0
--
--  @setting sneeker.spawn_minlight
sneeker.spawn_minlight = tonumber(core.settings:get("sneeker.spawn_minlight") or 0)

--- Sets the maximum light that a node can have for spawn to occur.
--
--  Default: 4
--
--  @setting sneeker.spawn_maxlight
sneeker.spawn_maxlight = tonumber(core.settings:get("sneeker.spawn_maxlight") or 4)

--- Sets the lowest position at which sneeker can spawn.
--
--  Default: -31000
--
--  @setting sneeker.spawn_minheight
sneeker.spawn_minheight = tonumber(core.settings:get("sneeker.spawn_minheight") or -31000)

--- Sets the highest position at which sneeker can spawn.
--
--  Default: 31000
--
--  @setting sneeker.spawn_maxheight
sneeker.spawn_maxheight = tonumber(core.settings:get("sneeker.spawn_maxheight") or 31000)

--- Limits the number of entities that can spawn per mapblock (16x16x16).
--
--  Default: 1
sneeker.spawn_mapblock_limit = tonumber(core.settings:get("sneeker.spawn_mapblock_limit") or 1)
