-- @classmod PathfindingService
-- @author TheCondemner
-- @date 22/12/18

-- ------------------------------------------------------ --
--                 SERVICES & DEPENDENCIES                --
-- ------------------------------------------------------ --
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local Knit = require(ReplicatedStorage.Packages.Knit)
local TagHelper = require(Knit.Utilities.TagHelper)
local Sift = require(Knit.Packages.Sift)
local Array, Dictionary, Set = Sift.Array, Sift.Dictionary, Sift.Set

-- ------------------------------------------------------ --
--                        VARIABLES                       --
-- ------------------------------------------------------ --

local PathfindingService = Knit.CreateService({
	Name = "PathfindingService",
	Nodes = {},
	Client = {}, -- Remove for server-only
})

-- stylua: ignore
local validDirections = {
	Vector3.new( 1,  0,  0), -- Left
	Vector3.new(-1,  0,  0), -- Right
	Vector3.new( 0,  0,  1), -- Forward
	Vector3.new( 0,  0, -1), -- Back
}

-- ------------------------------------------------------ --
--                         CONFIG                         --
-- ------------------------------------------------------ --

-- ------------------------------------------------------ --
--                       FUNCTIONS                        --
-- ------------------------------------------------------ --
-- ----------------------- PRIVATE ---------------------- --
local function createNode(pos, parent)
	local node = Instance.new("Part")
	node.Name = "Node"
	node.Anchored = true
	node.CanCollide = false
	node.Size = Vector3.new(1, 1, 1)
	node.Position = pos
	node.Transparency = 0.5
	node.Parent = parent or workspace

	return node
end

-- ----------------------- PUBLIC ----------------------- --
function PathfindingService:KnitInit()
	TagHelper.BindToTag("Pathable", function(Object)
		if not (Object:IsA("BasePart")) then
			warn("[PathfindingService] 'Pathable' tag incorrectly applied.")
			return
		end

		self.Nodes[Object] = {}

		local corner = Vector3.new(
			Object.Size.X / 2 + Object.Position.X,
			Object.Size.Y / 2 + Object.Position.Y,
			Object.Size.Z / 2 + Object.Position.Z
		)
		local open = { createNode(corner) } -- Generated but not examined
		local closed = {} -- Examined

		while #open > 0 do
			local current = open[1]
			open = Array.removeValue(open, current)
			closed = Array.insert(closed, current)

			local adjacent = {}
			for _, direction in ipairs(validDirections) do
				
			end
		end
	end)
end

function PathfindingService:KnitStart() end

-- ------------------------------------------------------ --
--                        MAIN CODE                       --
-- ------------------------------------------------------ --

return PathfindingService
