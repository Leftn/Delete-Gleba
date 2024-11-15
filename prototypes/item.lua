
if settings.startup["delete-gleba-disable-spoilage"].value then
	if data.raw.tool["agricultural-science-pack"] then
		data.raw.tool["agricultural-science-pack"].spoil_ticks = null
		data.raw.tool["agricultural-science-pack"].spoil_result = null
		data.raw.tool["agricultural-science-pack"].default_import_location = "nauvis"
	end
	
	if data.raw.capsule["bioflux"] then
		data.raw.capsule["bioflux"].spoil_ticks = null
		data.raw.capsule["bioflux"].spoil_result = null
		data.raw.capsule["bioflux"].default_import_location = "nauvis"
	end
	
	if data.raw.capsule["raw-fish"] then
		data.raw.capsule["raw-fish"].spoil_ticks = null
		data.raw.capsule["raw-fish"].spoil_result = null
		data.raw.capsule["raw-fish"].default_import_location = "nauvis"
	end
	
	if data.raw.item["biter-egg"] then
		data.raw.item["biter-egg"].spoil_ticks = null
		data.raw.item["biter-egg"].spoil_to_trigger_result = null
		data.raw.item["biter-egg"].default_import_location = "nauvis"
	end
	
	if data.raw.item["captive-biter-spawner"] then
		data.raw.item["captive-biter-spawner"].spoil_ticks = null
		data.raw.item["captive-biter-spawner"].spoil_to_trigger_result = null
	end
	
	if data.raw.item["spoilage"] then
		data.raw.item["spoilage"].hidden = true
	end
end