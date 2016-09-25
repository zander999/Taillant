
minetest.register_craftitem("stone_extracting:stone_extractor", {
    description = "The Taillant",
    inventory_image = "stone_extractor.png",
    
	after_use = function(itemstack, user, pointed_thing)
		itemstack:add_wear(200)
		return itemstack
	end
})

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	if puncher:get_wielded_item():get_name() == "stone_extracting:stone_extractor"
	and node.name ~= "default:stone" then
	 	minetest.add_node(pos, {name="default:cobble"})
		puncher:get_inventory():add_item('main', "default:cobble")
	end
end)
