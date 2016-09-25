
minetest.register_craftitem("taillant:taillant", {
    description = "The Taillant",
    inventory_image = "stone_extractor.png"
})

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	if puncher:get_wielded_item():get_name() == "taillant:taillant"
	and node.name == "default:stone" then
			minetest.remove_node(pos)
		 	minetest.add_node(pos, {name="default:cobble"})
			puncher:get_inventory():add_item('main', "default:cobble")
		end
	end
)
