-- Original code by Rui: WTFPL


local time_min = 60
local time_hr = time_min * 60
local time_day = time_hr * 24

local spawn_chance = tonumber(minetest.settings:get("sneeker.spawn_chance")) or 18000
local spawn_interval = tonumber(minetest.settings:get("sneeker.spawn_interval")) or time_min * 40 -- Default interval is 40 minutes

sneeker.log("Spawn chance: " .. tostring(spawn_chance) .. " (1/" .. tostring(spawn_chance) .. ")")
sneeker.log("Spawn interval: " .. tostring(spawn_interval) .. " (" .. tostring(spawn_interval/60) .. " minute(s))")

minetest.register_abm({
	nodenames = {"default:dirt_with_grass", "default:stone"},
	neighbors = {"air"},
	interval = spawn_interval,
	chance = spawn_chance,
	action = function(pos, node, _, active_object_count_wider)
		if active_object_count_wider > 5 then
			return
		end

		-- Check light value of node
		pos.y = pos.y+1
		local node_light = minetest.get_node_light(pos)

		-- Debugging spawning
		sneaker.log_debug('Node light level at ' .. tostring(pos.x) .. ',' .. tostring(pos.y) .. ': ' .. tostring(node_light))

		if not node_light then
			return
		end
		if node_light > sneeker.spawn_maxlight then
			return
		end
		if node_light < -1 then
			return
		end

		-- Spawn range
		if pos.y > 31000 then
			return
		end

		-- Node must be touching air
		if minetest.get_node(pos).name ~= "air" then
			return
		end
		pos.y = pos.y+1
		if minetest.get_node(pos).name ~= "air" then
			return
		end

		-- Get total count of sneekers in world
		local name, count
		for name in pairs(minetest.luaentities) do
		    if name == sneeker.mob_name then
		        count = count + 1
		    end
		end
		if count >= sneeker.spawn_cap then return end -- Max sneekers already exist

		sneeker.spawn(pos)
	end
})
