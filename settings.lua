-- Settings for sneeker mod


sneeker.debug = minetest.settings:get_bool("sneeker.debug", false)
sneeker.spawn_cap = tonumber(minetest.settings:get("sneeker.spawn_cap")) or 50
