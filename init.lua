-- all nodes that do not fit in any other category
-- Author:  Och_Noe
-- Licence: LGPL 2.1 
-- 


local own_name = "advtrains_platform"
advtrains_platform = {}


local register_platform = advtrains.register_platform

--  bricks / blocks

list_default =    { 
   "default:desert_sandstone_brick",
   "default:desert_stonebrick",
   "default:silver_sandstone",
   "default:silver_sandstone_brick",
   "default:silver_sandstone_block",
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
   "ethereal:bamboo_floor",
   -- added 2020-01-12
   "ethereal:olive_wood",
   "ethereal:sakura_wood",
}


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
	


if minetest.get_modpath("default") then
    for _,name in pairs(list_default) do
       register_platform(own_name,name)   
    end
end

if minetest.get_modpath("moreblocks") then
   for _,name in pairs(list_moreblocks) do
      register_platform(own_name,name)   
   end
end

-- added 2018-10-16
if minetest.get_modpath("minetest_errata") then
   for _,name in pairs(list_errata) do
      register_platform(own_name,name)   
   end
end



for _,name in pairs(list_wood) do
   register_platform(own_name,name)   
end


if minetest.get_modpath("ethereal") then
   for _,name in pairs(list_ethereal) do
      register_platform(own_name,name)   
   end
   for _,name in pairs(list_wood_ethereal) do
      register_platform(own_name,name)   
   end
end


if minetest.get_modpath("maple") then
   for _,name in pairs(list_wood_maple) do
      register_platform(own_name,name)   
   end
end


if minetest.get_modpath("moreores") then
   for _,name in pairs(list_moreores) do
      register_platform(own_name,name)   
   end
end


if minetest.get_modpath("technic") then
   for _,name in pairs(list_technic) do
      register_platform(own_name,name)
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


-- path crossing track 

local snowdef = minetest.registered_nodes['default:snowblock']
local node_sound_snow_default = nil
if snowdef then
   node_sound_snow_default = snowdef.sounds
end

-- nodelist

nodelist = {}

-- nodelist:insert( { name = "", tile = ".png", 
--		   sound = ,
--		   full = "", half = "" } )

if minetest.get_modpath("default") then
    table.insert(nodelist,  { name = "wood", 
            tile = "default_wood.png", 
            sound = default and default.node_sound_wood_defaults() or nil,
            full = "default:wood", 
            half = "stairs:slab_wood" } )
    table.insert(nodelist,  { name = "cobble", 
            tile = "default_cobble.png", 
            sound = default and default.node_sound_stone_defaults() or nil,
            full = "default:cobble", 
            half = "stairs:slab_cobble" } )
    table.insert(nodelist,  { name = "stonebrick", 
            tile = "default_stone_brick.png", 
            sound = default and default.node_sound_stone_defaults() or nil,
            full = "default:stonebrick", 
            half = "stairs:slab_stonebrick" } )
    table.insert(nodelist, { name = "snow", tile = "default_snow.png", 
            sound = node_sound_snow_default,
            full = "default:snowblock", 
            half = "stairs:slab_snowblock" } )
end

local adv_track = "advtrains:dtrack_placer"

if minetest.get_modpath("moreblocks") then
   table.insert(nodelist,  { name = "tar", 
		   tile = "moreblocks_tar.png", 
		   sound = default and default.node_sound_stone_defaults() or nil,
		   full = "moreblocks:tar", 
		   half = "moreblocks:slab_tar" } )
   table.insert(nodelist,  { name = "stone tile", 
		   tile = "moreblocks_stone_tile.png", 
		   sound = default and default.node_sound_stone_defaults() or nil,
		   full = "moreblocks:stone_tile", 
		   half = "moreblocks:slab_stone_tile" } )
   -- added 2021-02-26
   table.insert(nodelist,  { name = "stone tile alt", 
		   tile = "moreblocks_split_stone_tile_alt.png", 
		   sound = default and default.node_sound_stone_defaults() or nil,
		   full = "moreblocks:split_stone_tile_alt", 
		   half = "moreblocks:slab_split_stone_tile_alt" } )

end

local function register_crossing(entry)

    for _,lengths in pairs(woodpath_lengths) do
  
      local b = lengths[1]  --  "back"  in 1/10 nodes
      local f = lengths[2]  --  "front" in 1/10 nodes   
      
      local h = string.format(":"..entry.name:gsub(" ","_") .."path_track_%02d%02d",b,f)
      local d = string.format(entry.name .." level crossing %02d-%02d",b,f)
      local h2 = string.format(":"..entry.name:gsub(" ","_") .."path_track_narrow_%02d%02d",b,f)
      local d2 = string.format(entry.name .." level crossing (narrow) %02d-%02d",b,f)

      minetest.register_node(own_name..h, 
             {
            tiles =  { entry.tile, },
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
            groups = {choppy = 2, not_blocking_trains = 1,
               oddly_breakable_by_hand = 2,
               },
            sounds = entry.sound,
            on_place = minetest.rotate_node,
            
             })

      minetest.register_node(own_name..h2, 
             {
            tiles =  { entry.tile, },
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
            groups = {choppy = 2, not_blocking_trains = 1,
               oddly_breakable_by_hand = 2,
               },
            sounds = entry.sound,
            on_place = minetest.rotate_node,
            
             })


    local craft = { { "","","" } , { "","","" } , { "","","" } }
  
    craft[3][2] = adv_track

    for y = 2,1,-1 do
        if (b>=5) and (f>=5) then
            b = b-5
            f = f-5
            craft[y][2] = entry.full
        end
    end

    for y = 2,1,-1 do
        if (b>=10) then
            b = b-10
            craft[y][1] = entry.full
        elseif (b>=5) then
            b = b-5
            craft[y][1] = entry.half
        end

        if (f>=10) then
            f = f-10
            craft[y][3] = entry.full
        elseif (f>=5) then
            f = f-5
            craft[y][3] = entry.half
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

advtrains_platform.register_crossing = register_crossing

for _,entry in pairs(nodelist) do
    register_crossing(entry)
end

local nodenames
nodenames = minetest.settings:get("advtrains_platform.register_platforms") or ""
for node in nodenames:gmatch('([^,]+)') do --FIXME?: indices instead of gmatch?
    print("BBB: ", tostring(node))
    if minetest.registered_nodes[node] ~= nil then
        local modname, nodename = node:match("^([%da-z_]+):([%da-z_]+)$")
        print("CCC:", tostring(modname), tostring(nodename))
        if modname ~= nil and nodename ~= nil then
            register_platform(own_name, node)
        end
    end
end


nodenames = minetest.settings:get("advtrains_platform.register_crossings") or ""
for itemstring in nodenames:gmatch('([^,]+)') do --FIXME?: indices instead of gmatch?
    print("BBB: ", tostring(itemstring))
    if minetest.registered_nodes[itemstring] ~= nil then
        local modname, nodename = itemstring:match("^([%da-z_]+):([%da-z_]+)$")
        print("CCC:", tostring(modname), tostring(nodename))
        if modname ~= nil and nodename ~= nil then
           register_crossing({
               name = nodename, 
               tile = minetest.registered_nodes[itemstring].tiles[1],
               sound = minetest.registered_nodes[itemstring].sounds,
               full = itemstring,
               --full="moreblocks:split_stone_tile_alt", 
               half = string.format("%s:slab_%s", modname, nodename),
               --half=moreblocks:slab_split_stone_tile_alt"
           })
        end
    end
end

--  TODO? 3 nodes long slope

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
