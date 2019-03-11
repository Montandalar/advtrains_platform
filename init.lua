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




