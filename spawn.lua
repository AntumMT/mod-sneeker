
core.register_abm({
	nodenames = {"default:dirt_with_grass", "default:stone"},
	neighbors = {"air"},
	interval = 30,
	chance = 9000,
	action = function(pos, node, _, active_object_count_wider)
		if active_object_count_wider > 5 then
			return
		end
		pos.y = pos.y+1
		if not core.get_node_light(pos) then
			return
		end
		if core.get_node_light(pos) > 5 then
			return
		end
		if core.get_node_light(pos) < -1 then
			return
		end
		if pos.y > 31000 then
			return
		end
		if core.get_node(pos).name ~= "air" then
			return
		end
		pos.y = pos.y+1
		if core.get_node(pos).name ~= "air" then
			return
		end
		core.add_entity(pos, "sneeker:sneeker")
	end
})
