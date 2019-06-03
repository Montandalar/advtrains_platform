-- all nodes that do not fit in any other category
-- Author:  Och_Noe
-- Licence: LGPL 2.1 
-- 


local own_name = "advtrains_platform"


--  bricks / blocks

list_default =    { 
   "default:desert_sandstone_brick",
   "default:desert_stonebrick",
   "default:silver_sandstone_brick",
   "default:brick",
   "default:stone",
   "default:sandstone",
   "default:obsidian_glass",
   "default:dirt",
   "default:dirt_with_grass", 
   "default:desert_stone",
   "default:desert_sandstone",
-- added  2018-10-16    
   "default:desert_sandstone_brick",
-- added 2018-10-26
   "default:cobble",
}

list_moreblocks = {
   "moreblocks:cactus_brick",
   "moreblocks:coal_stone_bricks",
   "moreblocks:grey_bricks",
   "moreblocks:iron_stone_bricks",
   "moreblocks:stone_tile", 
-- added 2019-01-19
   "moreblocks:split_stone_tile", 
   "moreblocks:split_stone_tile_alt", 
}

list_ethereal = {
   "ethereal:icebrick",
   "ethereal:bamboo_dirt" }


-- added 2018-10-16
list_errata= {
   "minetest_errata:desert_sandstone_cobble",
   "minetest_errata:mossy_stone_tile",
   "minetest_errata:mossystone",
   "minetest_errata:sandstone_cobble",
   "minetest_errata:silver_sandstone_cobble", }


--  wood

list_wood= {
   "default:acacia_wood",
   "default:aspen_wood",
   "default:junglewood",
   "default:pine_wood",
   "default:wood"  }


list_wood_ethereal = {
   "ethereal:banana_wood",
   "ethereal:birch_wood",
   "ethereal:frost_wood",
   "ethereal:palm_wood",
   "ethereal:redwood_wood",
   "ethereal:willow_wood",
   "ethereal:yellow_wood",
   "ethereal:bamboo_floor"  }


list_wood_maple = { 
   "maple:maple_wood"  }



--  metal blocks

list_moreores = {
   "moreores:mithril_block" }


-- wool

-- ?


-- technic  - added 2019-03-11

list_technic =  {
	"technic:marble" }
	


for _,name in pairs(list_default) do
   advtrains.register_platform(own_name,name)   
end

if minetest.get_modpath("moreblocks") then
   for _,name in pairs(list_moreblocks) do
      advtrains.register_platform(own_name,name)   
   end
end

-- added 2018-10-16
if minetest.get_modpath("minetest_errata") then
   for _,name in pairs(list_errata) do
      advtrains.register_platform(own_name,name)   
   end
end



for _,name in pairs(list_wood) do
   advtrains.register_platform(own_name,name)   
end


if minetest.get_modpath("ethereal") then
   for _,name in pairs(list_ethereal) do
      advtrains.register_platform(own_name,name)   
   end
   for _,name in pairs(list_wood_ethereal) do
      advtrains.register_platform(own_name,name)   
   end
end


if minetest.get_modpath("maple") then
   for _,name in pairs(list_wood_maple) do
      advtrains.register_platform(own_name,name)   
   end
end


if minetest.get_modpath("moreores") then
   for _,name in pairs(list_moreores) do
      advtrains.register_platform(own_name,name)   
   end
end


if minetest.get_modpath("technic") then
   for _,name in pairs(list_technic) do
      advtrains.register_platform(own_name,name)
   end
end



local woodpath_lengths = { 
   { 5,10 },
   { 5,20 },
   { 5,25 },
   { 10,10 },
   { 10,20 },
   { 10,25 },
   { 20,20 },
   { 20,25 },
   { 25,25 },
}

local path_names = { "wood", "cobble", "stonebrick" } 
local tile_name  = { "default_wood.png" , "default_cobble.png", "default_stone_brick.png"}
local sound_name = { default.node_sound_wood_defaults() , 
	  	     default.node_sound_stone_defaults(), 
		     default.node_sound_stone_defaults(), }
local full_wood = { "default:wood", "default:cobble", "default:stonebrick" }
local half_wood = { "stairs:slab_wood" , "stairs:slab_cobble", 
                    "stairs:slab_stonebrick" }
local adv_track = "advtrains:dtrack_placer"

if minetest.get_modpath("moreblocks") then
   table.insert(path_names, "tar" )
   table.insert(path_names, "stone tile" )
   table.insert(tile_name, "moreblocks_tar.png" )
   table.insert(tile_name, "moreblocks_stone_tile.png" )
   table.insert(sound_name, default.node_sound_stone_defaults() )
   table.insert(sound_name, default.node_sound_stone_defaults() )
   table.insert(full_wood,  "moreblocks:tar" )
   table.insert(full_wood,  "moreblocks:stone_tile" )
   table.insert(half_wood, "moreblocks:slab_tar" )
   table.insert(half_wood, "moreblocks:slab_stone_tile" )
end

for nr = 1,#path_names do

   for _,lengths in pairs(woodpath_lengths) do
      
      local b = lengths[1]  --  "back"  in 1/10 nodes
      local f = lengths[2]  --  "front" in 1/10 nodes   
      
      local h = string.format(":"..path_names[nr] .."path_track_%02d%02d",b,f)
      local d = string.format(path_names[nr] .."path %02d-%02d",b,f)
      local h2 = string.format(":"..path_names[nr] .."path_track_narrow_%02d%02d",b,f)
      local d2 = string.format(path_names[nr] .."path (narrow) %02d-%02d",b,f)

      minetest.register_node(own_name..h, 
			     {
				tiles =  { tile_name[nr], },
				description = d,
				drawtype = "nodebox",
				paramtype = "light",
				paramtype2 = "facedir",
				node_box = 
				   {
				   type = "fixed",
				   fixed = {
				      {-0.5, -0.5, b/-10, 0.5, -0.4, f/10}, 
				   }
				},
				groups = {choppy = 2, oddly_breakable_by_hand = 2,
				   not_blocking_trains = 1},
				sounds = sound_name[nr],
				on_place = minetest.rotate_node,
				
			     })

      minetest.register_node(own_name..h2, 
			     {
				tiles =  { tile_name[nr], },
				description = d2,
				drawtype = "nodebox",
				paramtype = "light",
				paramtype2 = "facedir",
				node_box = 
				   {
				   type = "fixed",
				   fixed = {
				      {-0.4, -0.5, b/-10, 0.4, -0.4, f/10}, 
				      
				   }
				},
				groups = {choppy = 2, oddly_breakable_by_hand = 2,
				   not_blocking_trains = 1},
				sounds = sound_name[nr],
				on_place = minetest.rotate_node,
				
			     })


      local craft = { { "","","" } , { "","","" } , { "","","" } }
      
      craft[3][2] = adv_track
      
      for y = 2,1,-1
      do
	 if (b>=5) and (f>=5) then
	    b = b-5
	    f = f-5
	    craft[y][2] = full_wood[nr]
	 end
      end

      for y = 2,1,-1
      do
	 if (b>=10) then
	    b = b-10
	    craft[y][1] = full_wood[nr]
	 elseif (b>=5) then
	    b = b-5
	    craft[y][1] = half_wood[nr]
	 end
	 if (f>=10) then
	    f = f-10
	    craft[y][3] = full_wood[nr]
	 elseif (f>=5) then
	    f = f-5
	    craft[y][3] = half_wood[nr]
	 end
      end      

      --   if (b>0) or (f>0) then
      --      print(h.." b: "..b.." f: "..f)
      --   else
      --      t_aus = ""
      --      for y=1,3 do
      --	 for x=1,3 do
      --	    t_aus = t_aus .. craft[y][x] .. ", "
      --	 end
      --     end
      --     print(h..t_aus)
      --   end

      minetest.register_craft({
				 output = own_name..h,
				 recipe = craft,
				 replacements = { {adv_track,adv_track}, }
			      })

      minetest.register_craft({
				 output = own_name..h2,
				 recipe = { { own_name..h } },
			      })

   end

end



minetest.register_node(own_name..":version_node", {
        description = own_name.." version node",
        tiles = {own_name.."_version_node.png"},
        groups = {cracky = 3,not_in_creative_inventory=1},
     })

minetest.register_craft({
			   output = own_name..":version_node",
			   recipe = { 
			      { "advtrains_platform:platform_high_cobble" }, 
			      { "advtrains_platform:platform_high_stone" },
			      { adv_track },
			   },
			})

