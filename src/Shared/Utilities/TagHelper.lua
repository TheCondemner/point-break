local CollectionService = game:GetService("CollectionService")

local TagHelper = {}

function TagHelper.BindToTag(Tag, Callback)
	task.spawn(function()
		for _, Item in ipairs(CollectionService:GetTagged(Tag)) do
			task.spawn(function()
				Callback(Item)
			end)
		end
	end)

	return CollectionService:GetInstanceAddedSignal(Tag):Connect(Callback)
end

function TagHelper.BindToTagRemoved(Tag, Callback)
	return CollectionService:GetInstanceRemovedSignal(Tag):Connect(Callback)
end

return TagHelper