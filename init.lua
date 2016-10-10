
minetest.register_craftitem("taillant:taillant", {
    description = "The Taillant",
    inventory_image = "stone_extractor.png"
})

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	if puncher:get_wielded_item():get_name() == "taillant:taillant"
	and node.name == "default:stone" then
		minetest.set_node(pos, {name="default:cobble"})
		puncher:get_inventory():add_item('main', "default:gravel")
		end
	end
)


minetest.register_craftitem("taillant:taillant_reverse", {
    description = "The Taillant(in reverse)",
    inventory_image = "stone_extractor_reverse.png"
})

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	if puncher:get_wielded_item():get_name() == "taillant:taillant_reverse"
	and node.name == "default:cobble" then
		minetest.set_node(pos, {name="default:stone"})
		puncher:get_inventory():remove_item('main', "default:gravel")
		end
	end
)

minetest.register_craftitem("taillant:taillant_smash", {
    description = "The Taillant Destroyer",
    inventory_image = "stone_extractor_blase.png"
})

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	if puncher:get_wielded_item():get_name() == "taillant:taillant_smash"
	and node.name == "default:cobble" then
		minetest.remove_node(pos, {name="default:cobble"})
		puncher:get_inventory():add_item('main', "default:gravel")
		end
	end
)
