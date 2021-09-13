------
-- tires barrier
-----

if minetest.get_modpath("default") and minetest.get_modpath("stairs") then
	minetest.register_craft({
		output = "trackelements:tyres_pile",
		recipe = {
			{"", "stairs:slab_junglewood", ""},
			{"", "stairs:slab_junglewood", ""},
			{"", "stairs:slab_junglewood", ""},
		},
	})
end

minetest.register_node("trackelements:tyres_pile", {
	description = "Tyres pile",
	tiles = {"kart_black.png",},
	drawtype = "mesh",
	mesh = "tyres.b3d",
	paramtype = "light",
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_float("status", 0.0)
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()

		return true
	end,
	groups = {
		choppy = 2, oddly_breakable_by_hand = 1, flammable = 2
	},
})
