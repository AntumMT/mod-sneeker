-- Functions for sneeker mod


-- Displays a message in log output
function sneeker.log(message)
	minetest.log('action', '[' .. sneeker.modname .. '] ' .. message)
end

-- Displays a message in log output only if 'sneeker.debug' is set to 'true'
function sneeker.log_debug(message)
	if sneeker.debug then
		sneeker.log('DEBUG: ' .. message)
	end
end

-- Spawns a sneaker entity
function sneeker.spawn(pos)
	minetest.add_entity(pos, sneeker.mob_name)
	sneeker.log_debug('Spawned entity "' .. sneeker.mob_name .. '" at ' .. tostring(pos.x) .. ',' .. tostring(pos.y))
end
