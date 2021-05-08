
local spawn_nodes = {
	"default:dirt_with_dry_grass",
	"default:dry_dirt",
	"default:dry_dirt_with_dry_grass",
	"default:desert_sand",
}

if core.global_exists("nether") then
	table.insert(spawn_nodes, "nether:rack")
end

for _, node_name in ipairs(spawn_nodes) do
	if not core.registered_nodes[node_name] then
		sneeker.log("warning", "Invalid node for spawn: " .. node_name)
	end
end


core.register_abm({
	nodenames = spawn_nodes,
	neighbors = {"air"},
	interval = sneeker.spawn_interval,
	chance = sneeker.spawn_chance,
	action = function(pos, node, _, active_object_count_wider)
		if active_object_count_wider > 5 then
			return
		end

		if pos.y > sneeker.spawn_maxheight then
			return
		end
		if pos.y < sneeker.spawn_minheight then
			return
		end

		-- needs two vertical air nodes to spawn
		for _, node_pos in ipairs({pos, {x=pos.x, y=pos.y+1, z=pos.z}}) do
			if core.get_node(node_pos).name ~= "air" then
				return
			end
		end

		local llevel = core.get_node_light(pos)
		if not llevel or llevel > sneeker.spawn_maxlight or llevel < sneeker.spawn_minlight then
			return
		end

		local spawned = core.add_entity(pos, "sneeker:sneeker")
		if not spawned then
			sneeker.log("warning", "Failed to spawn at: "
				.. tostring(math.floor(pos.x))
				.. "," .. tostring(math.floor(pos.y))
				.. "," .. tostring(math.floor(pos.z)))
		end
	end
})
