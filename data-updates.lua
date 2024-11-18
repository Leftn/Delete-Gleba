local recycling = require("__quality__.prototypes.recycling")

require("prototypes.item")
require("prototypes.recipe")

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
if data.raw.recipe["carbon-fiber"] then
	data.raw.recipe["carbon-fiber"].ingredients =
	{
		{type = "item", name = "carbon", amount = 2},
		{type = "item", name = "bioflux", amount = 20}
	}
	data.raw.recipe["carbon-fiber"].category = "chemistry"
	data.raw.recipe["carbon-fiber"].results = {{type="item", name="carbon-fiber", amount=2}}
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

data.raw.planet["gleba"].map_gen_settings = null
if data.raw.planet["gleba"] then
	data.raw.planet["gleba"].hidden = true
end

delete_generic("fish-breeding", "technology")
delete_generic("tree-seeding", "technology")
delete_generic("overgrowth-soil", "technology")
delete_generic("bioflux-processing", "technology")
delete_generic("bacteria-cultivation", "technology")
delete_generic("artificial-soil", "technology")
delete_generic("biochamber", "technology")
delete_generic("jellynut", "technology")
delete_generic("yumako", "technology")
delete_generic("planet-discovery-gleba", "technology")
delete_generic("agriculture", "technology")
delete_generic("gleba-briefing", "tips-and-tricks-item")
delete_generic("spoilables-result", "tips-and-tricks-item")
delete_generic("agriculture", "tips-and-tricks-item")

delete_generic("yumako-processing", "recipe")
delete_generic("jellynut-processing", "recipe")
delete_generic("artificial-yumako-soil", "recipe")
delete_generic("artificial-jellynut-soil", "recipe")
delete_generic("overgrowth-yumako-soil", "recipe")
delete_generic("overgrowth-jellynut-soil", "recipe")
delete_generic("iron-bacteria", "recipe")
delete_generic("copper-bacteria", "recipe")
delete_generic("iron-bacteria-cultivation", "recipe")
delete_generic("copper-bacteria-cultivation", "recipe")
delete_generic("nutrients-from-spoilage", "recipe")
delete_generic("nutrients-from-yumako-mash", "recipe")
delete_generic("nutrients-from-jelly", "recipe")
delete_generic("nutrients-from-bioflux", "recipe")
delete_generic("pentapod-egg", "recipe")
delete_generic("agricultural-tower", "recipe")
delete_generic("biochamber", "recipe")
delete_generic("nutrients-from-fish", "recipe")
delete_generic("nutrients-from-biter-egg", "recipe")
delete_generic("artificial-yumako-soil-recycling", "recipe")
delete_generic("artificial-jellynut-soil-recycling", "recipe")
delete_generic("overgrowth-yumako-soil-recycling", "recipe")
delete_generic("overgrowth-jellynut-soil-recycling", "recipe")
delete_generic("biochamber-recycling", "recipe")
delete_generic("nutrients-recycling", "recipe")
delete_generic("pentapod-egg-recycling", "recipe")
delete_generic("agricultural-tower-recycling", "recipe")
delete_generic("yumako-recycling", "recipe")
delete_generic("jellynut-recycling", "recipe")
delete_generic("iron-bacteria-recycling", "recipe")
delete_generic("copper-bacteria-recycling", "recipe")
delete_generic("yumako-seed-recycling", "recipe")
delete_generic("jellynut-seed-recycling", "recipe")
delete_generic("rocket-fuel-from-jelly", "recipe")
delete_generic("bioplastic", "recipe")
delete_generic("biolubricant", "recipe")
delete_generic("biosulfur", "recipe")
delete_generic("yumako-mash-recycling", "recipe")
delete_generic("jelly-recycling", "recipe")
delete_generic("burnt-spoilage", "recipe")

delete_generic("yumako-seed", "item")
delete_generic("jellynut-seed", "item")
delete_generic("iron-bacteria", "item")
delete_generic("copper-bacteria", "item")
delete_generic("nutrients", "item")
delete_generic("agricultural-tower", "item")
delete_generic("biochamber", "item")
delete_generic("artificial-yumako-soil", "item")
delete_generic("artificial-jellynut-soil", "item")
delete_generic("overgrowth-yumako-soil", "item")
delete_generic("overgrowth-jellynut-soil", "item")
delete_generic("pentapod-egg", "item")

delete_generic("yumako", "capsule")
delete_generic("jellynut", "capsule")
delete_generic("jelly", "capsule")
delete_generic("yumako-mash", "capsule")

delete_generic("yumako-tree", "plant")
delete_generic("jellystem", "plant")

delete_generic("slipstack", "tree")
delete_generic("funneltrunk", "tree")
delete_generic("cuttlepop", "tree")
delete_generic("hairyclubnub", "tree")
delete_generic("teflilly", "tree")
delete_generic("lickmaw", "tree")
delete_generic("stingfrond", "tree")
delete_generic("boompuff", "tree")
delete_generic("sunnycomb", "tree")

delete_generic("small-stomper-shell", "simple-entity")
delete_generic("medium-stomper-shell", "simple-entity")
delete_generic("big-stomper-shell", "simple-entity")

delete_generic("artificial-yumako-soil", "tile")
delete_generic("artificial-jellynut-soil", "tile")
delete_generic("overgrowth-yumako-soil", "tile")
delete_generic("overgrowth-jellynut-soil", "tile")

delete_generic("biochamber", "assembling-machine")
delete_generic("agricultural-tower", "agricultural-tower")

delete_generic("small-stomper-pentapod", "spider-unit")
delete_generic("medium-stomper-pentapod", "spider-unit")
delete_generic("big-stomper-pentapod", "spider-unit")

delete_generic("gleba-spawner", "unit-spawner")
delete_generic("gleba-spawner-small", "unit-spawner")

recycling.generate_recycling_recipe(data.raw.recipe["stack-inserter"])
recycling.generate_recycling_recipe(data.raw.recipe["efficiency-module-3"])
