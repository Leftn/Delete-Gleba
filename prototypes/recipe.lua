
if settings.startup["delete-gleba-disable-spoilage"].value then
	if data.raw.recipe["spoilage-recycling"] then
		data.raw.recipe["spoilage-recycling"] = nil
	end
end