-- Settings for sneaker mod


sneaker.debug = minetest.settings:get_bool("sneaker_debug", false)
sneaker.spawn_cap = tonumber(minetest.settings:get("sneaker_spawn_cap")) or 50
