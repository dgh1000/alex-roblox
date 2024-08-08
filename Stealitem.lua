local block = script.Parent -- Change this to the part representing the block

-- Function to steal a random tool from a player's inventory
local function stealTool(player)
	-- attribute : children is an attribute: 
	-- refers to player.Backpack 
	local tools = player.Backpack:GetChildren()
	if #tools > 0 then
		local randomIndex = math.random(1, #tools)
		local tool = tools[randomIndex]
		tool.Parent = nil -- Remove the tool from the player's backpack
		tool.Parent = game.Workspace -- Drop the stolen tool into the game world
	end
end

-- highest level for building a house
--   get equipment : equipment manager
--   get materials : materials manager
--   get workers   : human resources
--   build house   : construction manager


-- lower level:
--   break it down


-- a little bit lower level:
-- 	  draw the blueprint, 
--    build the supports, 
--    build the walls around the supports

--
-- lower level: more level
-- build the supports:
--   buy supports
--   nail supports

-- high above: we see buildings and streets, but individual windows are 
--   too tiny to see

-- lower leveL; we see windows but it's hard to see more than a couple
--   buildings

-- lowest level: talking to just one worker:
--   



-- Function to handle when a player touches the block
local function onTouch(otherPart)
	local character = otherPart.Parent
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		local player = game.Players:GetPlayerFromCharacter(character)
		if player then
			stealTool(player)
		end
	end
end

-- Connect the function to the Touch event of the block
block.Touched:Connect(onTouch)
