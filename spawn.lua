-- Original code by Rui: WTFPL


local time_hr = sneeker.time_min * 60
local time_day = time_hr * 24

-- Display spawn chance as percentage in log
local spawn_chance_percent = math.floor(1 / sneeker.spawn_chance * 100)
if spawn_chance_percent < 1 then
	spawn_chance_percent = "Less than 1%"
else
	spawn_chance_percent = tostring(spawn_chance_percent) .. "%"
end

sneeker.log("Spawn cap: " .. tostring(sneeker.spawn_cap))
sneeker.log("Spawn chance: " .. spawn_chance_percent)
sneeker.log("Spawn interval: " .. tostring(sneeker.spawn_interval) .. " (" .. tostring(sneeker.spawn_interval/60) .. " minute(s))")
sneeker.log("Maximum light value for spawn: " .. tostring(sneeker.spawn_maxlight))

local spawn_nodes = {"default:dirt_with_grass", "default:stone"}
if core.global_exists("nether") then
	table.insert(spawn_nodes, "nether:rack")
end

core.register_abm({
	nodenames = spawn_nodes,
	neighbors = {"air"},
	interval = spawn_interval,
	chance = spawn_chance,
	action = function(pos, node, _, active_object_count_wider)
		if active_object_count_wider > 5 then
			return
		end

		-- Check light value of node
		pos.y = pos.y+1
		local node_light = core.get_node_light(pos)

		-- Debugging spawning
		sneeker.log("debug", "Node light level at " .. sneeker.get_pos_string(pos) .. ": " .. tostring(node_light))

		-- Node light level
		if not node_light or node_light > spawn_maxlight then
			sneeker.log("debug", "Node not dark enough for spawn")
			return
		elseif node_light < spawn_minlight then
			sneeker.log("debug", "Node too dark for spawn")
			return
		end

		-- Spawn range
		if spawn_minheight ~= nil and pos.y < spawn_minheight then
			sneeker.log("debug", "Position is too low for spawn")
			return
		elseif pos.y > spawn_maxheight then
			sneeker.log("debug", "Position is too high for spawn")
			return
		end

		-- Node must be touching air
		if core.get_node(pos).name ~= "air" then
			return
		end
		pos.y = pos.y+1
		if core.get_node(pos).name ~= "air" then
			return
		end

		-- Get total count of sneekers in world
		local count = 0
		for I in pairs(core.luaentities) do
		    if core.luaentities[I].name == sneeker.mob_name then
		        count = count + 1
		    end
		end

		sneeker.log("debug", "Current active spawns: " .. tostring(count) .. "/" .. tostring(spawn_cap))

		if count >= spawn_cap then
			sneeker.log("debug", "Max spawns reached")
			return
		end

		sneeker.spawn(pos)
	end
})
