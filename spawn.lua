-- Original code by Rui: WTFPL


local time_min = 60
local time_hr = time_min * 60
local time_day = time_hr * 24

local spawn_chance = minetest.setting_get('sneeker.spawn_chance') or 18000
local spawn_interval = minetest.setting_get('sneeker.spawn_interval') or time_min * 40 -- Default interval is 40 minutes

sneeker.log('Spawn chance: ' .. tostring(spawn_chance) .. ' (1/' .. tostring(spawn_chance) .. ')')
sneeker.log('Spawn interval: ' .. tostring(spawn_interval) .. ' (' .. tostring(spawn_interval/60) .. ' minute(s))')

minetest.register_abm({
	nodenames = {'default:dirt_with_grass', 'default:stone'},
	neighbors = {'air'},
	interval = spawn_interval,
	chance = spawn_chance,
	action = function(pos, node, _, active_object_count_wider)
		local spawnit = true
		
		if active_object_count_wider > 5 then
			spawnit = false
		end
		
		if spawnit then
			-- Check light value of node
			pos.y = pos.y+1
			local node_light = minetest.get_node_light(pos)
			
			-- Debugging spawning
			sneeker.log_debug('Node light level at ' .. sneeker.get_pos_string(pos) .. ': ' .. tostring(node_light))
			
			if not node_light or node_light > sneeker.spawn_maxlight or node_light < -1 then
				spawnit = false
			end
			
			-- Spawn range
			if pos.y > 31000 then
				spawnit = false
			end
			
			-- Node must be touching air
			if minetest.get_node(pos).name ~= 'air' then
				spawnit = false
			end
			pos.y = pos.y+1
			if minetest.get_node(pos).name ~= 'air' then
				spawnit = false
			end
			
			if spawnit then
				-- Get total count of sneekers in world
				local name, count
				for name in pairs(minetest.luaentities) do
				    if name == sneeker.mob_name then
				        count = count + 1
				    end
				end
				if count >= sneeker.spawn_cap then
					spawnit = false -- Max sneekers already exist
				end
			end
		end
		
		if spawnit then
			sneeker.spawn(pos)
		else
			sneeker.log_debug('Spawn denied')
		end
	end
})
