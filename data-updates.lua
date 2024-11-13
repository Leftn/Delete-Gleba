require("prototypes.item")


if settings.startup["delete-gleba-disable-spoilage"].value then
	if data.raw.item["spoilage"] then
		data.raw.item["spoilage"] = null
	end
	if data.raw.recipe["spoilage-recycling"] then
		data.raw.recipe["spoilage-recycling"] = null
	end
end

if data.raw["assembling-machine"]["biochamber"] then
	data.raw["assembling-machine"]["biochamber"] = null
end

if data.raw["agricultural-tower"]["agricultural-tower"] then
	data.raw["agricultural-tower"]["agricultural-tower"] = null
end
local function delete_tree(name)
	if data.raw["tree"][name] then
		data.raw["tree"][name] = null
	end
end

if data.raw["spider-unit"]["small-stomper-pentapod"] then
	data.raw["spider-unit"]["small-stomper-pentapod"] = null
end

if data.raw["spider-unit"]["medium-stomper-pentapod"] then
	data.raw["spider-unit"]["medium-stomper-pentapod"] = null
end

if data.raw["spider-unit"]["big-stomper-pentapod"] then
	data.raw["spider-unit"]["big-stomper-pentapod"] = null
end

if data.raw["unit-spawner"]["gleba-spawner"] then
	data.raw["unit-spawner"]["gleba-spawner"] = null
end

if data.raw["unit-spawner"]["gleba-spawner-small"] then
	data.raw["unit-spawner"]["gleba-spawner-small"] = null
end

local function delete_connection(name)
	if data.raw["space-connection"][name] then
		data.raw["space-connection"][name] = null
	end
end

local function delete_tile(name)
	if data.raw.tile[name] then
		data.raw.tile[name] = null
	end
end

local function delete_technology(name)
	if data.raw.technology[name] then
		data.raw.technology[name] = null
	end
end

local function delete_recipe(name)
	if data.raw.recipe[name] then
		data.raw.recipe[name] = null
	end
end

local function delete_entity(name)
	if data.raw["simple-entity"][name] then
		data.raw["simple-entity"][name] = null
	end
end

local function delete_item(name)
	if data.raw.item[name] then
		data.raw.item[name] = null
	end
end

local function delete_plant(name)
	if data.raw.plant[name] then
		data.raw.plant[name] = null
	end
end

local function delete_capsule(name)
	if data.raw.capsule[name] then
		data.raw.capsule[name] = null
	end
end

local function delete_tips(name)
	if data.raw["tips-and-tricks-item"][name] then
		data.raw["tips-and-tricks-item"][name] = null
	end
end

-- Start change technologies

if data.raw.technology["agricultural-science-pack"] then
	data.raw.technology["agricultural-science-pack"].prerequisites = {"bioflux"}
	data.raw.technology["agricultural-science-pack"].research_trigger = null
	data.raw.technology["agricultural-science-pack"].unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"metallurgic-science-pack", 1},
		{"electromagnetic-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 30,
      count = 200
    }
end

if data.raw.technology["heating-tower"] then
	data.raw.technology["heating-tower"].prerequisites = {"agricultural-science-pack", "space-science-pack", "electromagnetic-science-pack", "metallurgic-science-pack"}
	data.raw.technology["heating-tower"].unit =
    {
      ingredients =
      {
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 30,
      count = 1000
    }
	data.raw.technology["heating-tower"].research_trigger = null
end

if data.raw.technology["bioflux"] then
	data.raw.technology["bioflux"].prerequisites = {"space-science-pack", "electromagnetic-science-pack", "metallurgic-science-pack"}
	data.raw.technology["bioflux"].research_trigger = null
	data.raw.technology["bioflux"].unit =
    {
		ingredients =
		{
			{"electromagnetic-science-pack", 1},
			{"metallurgic-science-pack", 1},
			{"space-science-pack", 1},
		},
		time = 30,
		count = 500
    }
	data.raw.technology["bioflux"].effects =
    {
		{
			type = "unlock-recipe",
			recipe = "bioflux"
		},
		{
			type = "unlock-recipe",
			recipe = "wood-processing"
		},
		{
			type = "unlock-recipe",
			recipe = "fish-breeding"
		}
	}
end

if data.raw.technology["plastic-bar-productivity"] then
    data.raw.technology["plastic-bar-productivity"].effects =
    {
		{
			type = "change-recipe-productivity",
			recipe = "plastic-bar",
			change = 0.1
		}
	}
end

if data.raw.technology["rocket-fuel-productivity"] then
    data.raw.technology["rocket-fuel-productivity"].effects =
    {
		{
			type = "change-recipe-productivity",
			recipe = "rocket-fuel",
			change = 0.1
		},
		{
			type = "change-recipe-productivity",
			recipe = "ammonia-rocket-fuel",
			change = 0.1
		}
	}
end

if data.raw.technology["captivity"] then
    data.raw.technology["captivity"].effects =
    {
		{
			type = "unlock-recipe",
			recipe = "capture-robot-rocket"
		},
		{
			type = "unlock-recipe",
			recipe = "biter-egg"
		}
	}
end
-- End change technologies

-- Start Recipe editing
if data.raw.recipe["bioflux"] then
	data.raw.recipe["bioflux"].ingredients =
	{
		{type = "item", name = "tungsten-ore", amount = 2},
		{type = "item", name = "stone", amount = 5},
		{type = "fluid", name = "holmium-solution", amount = 20}
	}
	data.raw.recipe["bioflux"].category = "crafting-with-fluid"
	data.raw.recipe["bioflux"].results = {{type="item", name="bioflux", amount=1}}
end

if data.raw.recipe["carbon-fiber"] then
	data.raw.recipe["carbon-fiber"].ingredients =
	{
		{type = "item", name = "carbon", amount = 2},
		{type = "item", name = "bioflux", amount = 20}
	}
	data.raw.recipe["carbon-fiber"].category = "chemistry"
	data.raw.recipe["carbon-fiber"].subgroup = "raw-material"
	data.raw.recipe["carbon-fiber"].order = "a[raw-material]-h[carbon-fiber]"
	data.raw.recipe["carbon-fiber"].results = {{type="item", name="carbon-fiber", amount=3}}
end

if data.raw.recipe["stack-inserter"] then
	data.raw.recipe["stack-inserter"].ingredients =
	{
		{type = "item", name = "processing-unit", amount = 1},
		{type = "item", name = "carbon-fiber", amount = 2},
		{type = "item", name = "bioflux", amount = 10},
		{type = "item", name = "bulk-inserter", amount = 1}
	}
	data.raw.recipe["stack-inserter"].category = "crafting"
	data.raw.recipe["stack-inserter"].results = {{type="item", name="stack-inserter", amount=1}}
end

if data.raw.recipe["agricultural-science-pack"] then
	data.raw.recipe["agricultural-science-pack"].ingredients = {
		{type = "item", name = "raw-fish", amount = 5},
		{type = "item", name = "bioflux", amount = 5}
	}
	data.raw.recipe["agricultural-science-pack"].category = "crafting"
	data.raw.recipe["agricultural-science-pack"].energy_required = 30
	data.raw.recipe["agricultural-science-pack"].surface_conditions =
	{
		{
			property = "pressure",
			min = 1000,
			max = 1000
		}
	}
end

if data.raw.recipe["efficiency-module-3"] then
	data.raw.recipe["efficiency-module-3"].ingredients = {
		{type = "item", name = "advanced-circuit", amount = 5},
		{type = "item", name = "processing-unit", amount = 5},
		{type = "item", name = "bioflux", amount = 5},
		{type = "item", name = "efficiency-module-2", amount = 4}
	}
end

if data.raw.recipe["fish-breeding"] then
	data.raw.recipe["fish-breeding"].ingredients = {
		{type = "fluid", name = "water", amount = 100},
		{type = "item", name = "bioflux", amount = 5},
		{type = "item", name = "raw-fish", amount = 2}
	}
	data.raw.recipe["fish-breeding"].category = "chemistry"
end

if data.raw.recipe["stack-inserter-recycling"] then
	data.raw.recipe["stack-inserter-recycling"].ingredients = {
		{type = "item", name = "stack-inserter", amount = 1},
	}
    data.raw.recipe["stack-inserter-recycling"].results = {
		{type = "item", name = "processing-unit", amount = 1, probability = 0.11, ignored_by_stats = 1},
		{type = "item", name = "carbon-fiber", amount = 1, probability = 0.11, ignored_by_stats = 1},
		{type = "item", name = "bioflux", amount = 1, probability = 0.66, ignored_by_stats = 1},
		{type = "item", name = "bulk-inserter", amount = 1, probability = 0.11, ignored_by_stats = 1}
	}
	data.raw.recipe["stack-inserter-recycling"].category = "recycling"
	data.raw.recipe["stack-inserter-recycling"].energy_required = 0.5
end

if data.raw.recipe["efficiency-module-3-recycling"] then
	data.raw.recipe["efficiency-module-3-recycling"].ingredients = {
		{type = "item", name = "efficiency-module-3", amount = 1},
	}
    data.raw.recipe["efficiency-module-3-recycling"].results = {
		{type = "item", name = "processing-unit", amount = 1, probability = 0.25, ignored_by_stats = 1},
		{type = "item", name = "advanced-circuit", amount = 1, probability = 0.25, ignored_by_stats = 1},
		{type = "item", name = "bioflux", amount = 1, probability = 0.25, ignored_by_stats = 1},
		{type = "item", name = "efficiency-module-2", amount = 1, probability = 0.25, ignored_by_stats = 1}
	}
	data.raw.recipe["efficiency-module-3-recycling"].category = "recycling"
	data.raw.recipe["efficiency-module-3-recycling"].energy_required = 60/16
end



-- End Recipe editing

--Start item editing
if data.raw.item["carbon-fiber"] then
	data.raw.item["carbon-fiber"].default_import_location = "nauvis"
end

if data.raw.item["stack-inserter"] then
	data.raw.item["stack-inserter"].default_import_location = "nauvis"
end

if data.raw.item["tree-seed"] then
	data.raw.item["tree-seed"].default_import_location = "nauvis"
end
-- End item editing

--Start Entity editing
if data.raw["simple-entity"]["iron-stromatolite"] then
	data.raw["simple-entity"]["iron-stromatolite"].minable = null
end

if data.raw["simple-entity"]["copper-stromatolite"] then
	data.raw["simple-entity"]["copper-stromatolite"].minable = null
end
-- End entity editing

-- Achievement editing
if data.raw["group-attack-achievement"]["it-stinks-and-they-do-like-it"] then
	data.raw["group-attack-achievement"]["it-stinks-and-they-do-like-it"].entities = {
		"small-wriggler-pentapod",
		"medium-wriggler-pentapod",
		"big-wriggler-pentapod",
		"small-strafer-pentapod",
		"medium-strafer-pentapod",
		"big-strafer-pentapod"
	}
end
--

delete_technology("planet-discovery-gleba")
delete_technology("agriculture")
delete_technology("yumako")
delete_technology("jellynut")
delete_technology("biochamber")
delete_technology("artificial-soil")
delete_technology("bacteria-cultivation")
delete_technology("bioflux-processing")
delete_technology("overgrowth-soil")
delete_technology("tree-seeding")
delete_technology("fish-breeding")

delete_tips("gleba-briefing")
delete_tips("spoilables-result")
delete_tips("agriculture")

delete_recipe("yumako-processing")
delete_recipe("jellynut-processing")
delete_recipe("artificial-yumako-soil")
delete_recipe("artificial-jellynut-soil")
delete_recipe("overgrowth-yumako-soil")
delete_recipe("overgrowth-jellynut-soil")
delete_recipe("iron-bacteria")
delete_recipe("copper-bacteria")
delete_recipe("iron-bacteria-cultivation")
delete_recipe("copper-bacteria-cultivation")
delete_recipe("nutrients-from-spoilage")
delete_recipe("nutrients-from-yumako-mash")
delete_recipe("nutrients-from-jelly")
delete_recipe("nutrients-from-bioflux")
delete_recipe("pentapod-egg")
delete_recipe("agricultural-tower")
delete_recipe("biochamber")
delete_recipe("nutrients-from-fish")
delete_recipe("nutrients-from-biter-egg")
delete_recipe("artificial-yumako-soil-recycling")
delete_recipe("artificial-jellynut-soil-recycling")
delete_recipe("overgrowth-yumako-soil-recycling")
delete_recipe("overgrowth-jellynut-soil-recycling")
delete_recipe("biochamber-recycling")
delete_recipe("nutrients-recycling")
delete_recipe("pentapod-egg-recycling")
delete_recipe("agricultural-tower-recycling")
delete_recipe("yumako-recycling")
delete_recipe("jellynut-recycling")
delete_recipe("iron-bacteria-recycling")
delete_recipe("copper-bacteria-recycling")
delete_recipe("yumako-seed-recycling")
delete_recipe("jellynut-seed-recycling")
delete_recipe("rocket-fuel-from-jelly")
delete_recipe("bioplastic")
delete_recipe("biolubricant")
delete_recipe("biosulfur")
delete_recipe("yumako-mash-recycling")
delete_recipe("jelly-recycling")
delete_recipe("burnt-spoilage")


delete_item("yumako-seed")
delete_item("jellynut-seed")
delete_item("iron-bacteria")
delete_item("copper-bacteria")
delete_item("nutrients")
delete_item("agricultural-tower")
delete_item("biochamber")
delete_item("artificial-yumako-soil")
delete_item("artificial-jellynut-soil")
delete_item("overgrowth-yumako-soil")
delete_item("overgrowth-jellynut-soil")
delete_item("pentapod-egg")

delete_capsule("yumako")
delete_capsule("jellynut")
delete_capsule("jelly")
delete_capsule("yumako-mash")

delete_plant("yumako-tree")
delete_plant("jellystem")

delete_tree("slipstack")
delete_tree("funneltrunk")
delete_tree("cuttlepop")
delete_tree("hairyclubnub")
delete_tree("teflilly")
delete_tree("lickmaw")
delete_tree("stingfrond")
delete_tree("boompuff")
delete_tree("sunnycomb")

delete_entity("small-stomper-shell")
delete_entity("medium-stomper-shell")
delete_entity("big-stomper-shell")

delete_connection("nauvis-gleba")
delete_connection("vulcanus-gleba")
delete_connection("gleba-fulgora")
delete_connection("gleba-aquilo")

delete_tile("artificial-yumako-soil")
delete_tile("artificial-jellynut-soil")
delete_tile("overgrowth-yumako-soil")
delete_tile("overgrowth-jellynut-soil")
