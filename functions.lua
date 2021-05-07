-- Functions for sneeker mod


-- Spawns a sneeker entity
function sneeker.spawn(pos)
	core.add_entity(pos, sneeker.mob_name)
	sneeker.log("debug", "Spawned entity \"" .. sneeker.mob_name .. "\" at " .. tostring(pos.x) .. "," .. tostring(pos.y))
end

-- Retrieves pos coordinates in string value
function sneeker.get_pos_string(pos)
	return "x=" .. tostring(pos.x) .. ", y=" .. tostring(pos.y) .. ", z=" .. tostring(pos.z)
end
