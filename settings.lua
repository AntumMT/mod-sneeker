-- Settings for sneeker mod


sneeker.debug = minetest.settings:get_bool('enable_debug_mods')
if sneeker.debug == nil then
	sneeker.debug = false
end
