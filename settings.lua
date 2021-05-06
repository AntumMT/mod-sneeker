-- Settings for sneeker mod


sneeker.time_min = 60

sneeker.debug = core.settings:get_bool("enable_debug_mods", false)

--- Sets maximum number of spawns that can exist in world at one time.
--
--  @setting sneeker.spawn_cap
sneeker.spawn_cap = tonumber(core.settings:get("sneeker.spawn_cap")) or 10

--- Sets possibility for spawn.
--
--  Inverted value (e.g. 1000 = 1/1000).
--
--  @setting sneeker.spawn_chance
sneeker.spawn_chance = tonumber(core.settings:get("sneeker.spawn_chance")) or 1000

--- Sets frequency of spawn chance.
--
--  Default 240 is equivalent to 4 minutes (60 * 4).
--
--  @setting sneeker.spawn_interval
sneeker.spawn_interval = tonumber(core.settings:get("sneeker.spawn_interval")) or sneeker.time_min * 4

--- Sets the minimum light that a node must have for spawn to occur.
--
--  Default: -1
--
--  @setting sneeker.spawn_minlight
sneeker.spawn_minlight = tonumber(core.settings:get("sneeker.spawn_minlight")) or -1

--- Sets the maximum light that a node can have for spawn to occur.
--
--  Default: 4
--
--  @setting sneeker.spawn_maxlight
sneeker.spawn_maxlight = tonumber(core.settings:get("sneeker.spawn_maxlight")) or 4

--- Sets the lowest position at which sneeker can spawn.
--
--  Default: -31000
--
--  @setting sneeker.spawn_minheight
sneeker.spawn_minheight = tonumber(core.settings:get("sneeker.spawn_minheight")) or -31000

--- Sets the highest position at which sneeker can spawn.
--
--  Default: 31000
--
--  @setting sneeker.spawn_maxheight
sneeker.spawn_maxheight = tonumber(core.settings:get("sneeker.spawn_maxheight")) or 31000 -- Maximum height allowed for spawn
