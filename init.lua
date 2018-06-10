-- all nodes that do not fit in any other category
-- Och_Noe
-- 

local own_name = "advtrains_platform"


-- copied from advtrains and modified


--  bricks

list_default =    { 
   "default:desert_sandstone_brick",
   "default:desert_stonebrick",
   "default:silver_sandstone_brick",
   "default:brick",
   "default:stone",
   "default:sandstone",
   "default:obsidian_glass"  }

list_moreblocks = {
   "moreblocks:cactus_brick",
   "moreblocks:coal_stone_bricks",
   "moreblocks:grey_bricks",
   "moreblocks:iron_stone_bricks"}



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
   "ethereal:yellow_wood"  }


list_wood_maple = { 
   "maple:maple_wood"  }



--  metal blocks

list_moreores = {
   "moreores:mithril_block" }


-- wool

-- ?


for _,name in pairs(list_default) do
   advtrains.register_platform(own_name,name)   
end

if minetest.get_modpath("moreblocks") then
   for _,name in pairs(list_moreblocks) do
      advtrains.register_platform(own_name,name)   
   end
end



for _,name in pairs(list_wood) do
   advtrains.register_platform(own_name,name)   
end


if minetest.get_modpath("ethereal") then
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
