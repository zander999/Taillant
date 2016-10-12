-- Suporting functions

local hasitem = function(inventory,itemstring)
	for idx,x in pairs(inventory:get_list("main") ) do
		if x:get_name() == itemstring then
			return ture
		end
	end
	return false
end

-- Item defintions

minetest.register_craftitem("taillant:taillant", {
    description = "The Taillant",
    inventory_image = "stone_extractor.png"
})

minetest.register_craftitem("taillant:taillant_reverse", {
    description = "The Reverse Taillant",
    inventory_image = "stone_extractor_reverse.png"
})

-- Effects

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	if puncher:get_wielded_item():get_name() == "taillant:taillant" then
		if node.name == "default:stone" then
			minetest.set_node(pos, {name="default:cobble"})
			puncher:get_inventory():add_item('main', "default:gravel")
		elseif node.name == "default:cobble" then
			minetest.remove_node(pos, {name="default:cobble"})
			puncher:get_inventory():add_item('main', "default:gravel")
		end
	elseif puncher:get_wielded_item():get_name() == "taillant:taillant_reverse"
	and node.name == "default:cobble"
	and hasitem(puncher:get_inventory(),"default:gravel") then
		minetest.set_node(pos, {name="default:stone"})
		puncher:get_inventory():remove_item('main', "default:gravel")
	end
end)

