-- Settings for sneeker mod


sneeker.debug = minetest.settings:get_bool("sneeker_debug", false)
sneeker.spawn_cap = tonumber(minetest.settings:get("sneeker_spawn_cap")) or 50
