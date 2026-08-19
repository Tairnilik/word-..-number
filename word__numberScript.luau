local toolbar = plugin:CreateToolbar("word .. number")
local ChangeHistoryService = game:GetService("ChangeHistoryService")
local SelectService = game:GetService("Selection")

local button = toolbar:CreateButton(
	"word .. number",
	"Plugin renames parts with their sequence number. Supports CHS.",
	"rbxassetid://9762988767"
)

button.Click:Connect(function()
	local SelectedObjects = SelectService:Get()
	if #SelectedObjects>0 then
		local first_object = SelectedObjects[1]
		
		local f_obj_name=first_object.Name
		
		ChangeHistoryService:SetWaypoint("Before Auto-Rename")
		for i = 1, #SelectedObjects, 1 do
			local object = SelectedObjects[i]
			object.Name = f_obj_name .. "_" .. i
		end
		print("Completed.")
		ChangeHistoryService:SetWaypoint("After Auto-Rename")
	else
		warn("Select some objects!")
	end	
end)

