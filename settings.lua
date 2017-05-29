-- Settings for sneeker mod


sneeker.debug = minetest.settings:get_bool("sneeker.debug", false)

-- Maximum number of spawns active at one time
sneeker.spawn_cap = tonumber(minetest.settings:get("sneeker.spawn_cap")) or 25

-- Maximum light of node for spawn
sneeker.spawn_maxlight = tonumber(minetest.settings:get("sneeker.spawn_maxlight")) or 7
