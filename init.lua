-- Supporting functions

local hasitem = function(inventory,itemstring)
	for idx,x in pairs(inventory:get_list("main") ) do
		if x:get_name() == itemstring then
			return true
		end
	end
	return false
end

local playdig = function(playername)
	minetest.sound_play("default_dig_cracky",{
		to_player = playername,
	})
end

-- Item defintions

minetest.register_craftitem("taillant:taillant", {
	description = "Taillant",
	inventory_image = "stone_extractor.png",
	stack_max = 1,
	on_use = function(itemstack,puncher,pointedthing)
		if pointedthing.type ~= "node" then return end

		local pos = pointedthing.under
		local node = minetest.get_node(pos)
		if node.name == "default:stone" then
			minetest.set_node(pos, {name="default:cobble"})
			puncher:get_inventory():add_item('main', "default:gravel")
			playdig(puncher:get_player_name())
		elseif node.name == "default:cobble" then
			minetest.dig_node(pos)
			puncher:get_inventory():add_item('main', "default:gravel")
			playdig(puncher:get_player_name())
		end
		return

	end
})

minetest.register_craftitem("taillant:taillant_reverse", {
	description = "Reverse Taillant",
	inventory_image = "stone_extractor_reverse.png",
	stack_max = 1,
	on_use = function(itemstack,puncher,pointedthing)
		if pointedthing.type ~= "node" then return end

		local pos = pointedthing.under
		local node = minetest.get_node(pos)
		if node.name == "default:cobble"
		and hasitem(puncher:get_inventory(),"default:gravel") then
			playdig(puncher:get_player_name())
			minetest.set_node(pos, {name="default:stone"})
			puncher:get_inventory():remove_item('main', "default:gravel")
		end
		return
	end
})

