local nodes = game.Workspace.nodesFolder:GetChildren()
local road = game.Workspace.Folder:GetChildren()

local function createWall(node1,node2)
	local distance = (node1.Position - node2.Position).Magnitude	
	
	local connector = Instance.new("Part")
	connector.Parent = workspace
	connector.Anchored = true
	connector.Size = Vector3.new(10,1,distance)
	connector.CFrame = CFrame.new(node1.Position, node2.Position) * CFrame.new(0, 0, -distance / 2)
	connector.BrickColor = BrickColor.Black()
end


local function createShape(nodes)
	for i = 1,#nodes do
		wait(.5)
		if i == #nodes then
			createWall(nodes[1],nodes[i])
		else
			createWall(nodes[i],nodes[i+1])
		end
	end
end


local function linkNodes(nodes)
	for i = 1,#nodes do
		wait(.5)
		createWall(nodes[i],nodes[i+1])
	end
end


--createShape(nodes)

linkNodes(road)