-- bridge duels (cheat engine!!)
local run = function(func) func() end
local cloneref = cloneref or function(obj) return obj end

local playersService = cloneref(game:GetService('Players'))
local inputService = cloneref(game:GetService('UserInputService'))
local replicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
local collectionService = cloneref(game:GetService('CollectionService'))
local runService = cloneref(game:GetService('RunService'))

local gameCamera = workspace.CurrentCamera
local lplr = playersService.LocalPlayer
local vape = shared.vape
local entitylib = vape.Libraries.entity
local targetinfo = vape.Libraries.targetinfo
local prediction = vape.Libraries.prediction

local bd = {}
local store = {
	blocks = {},
	serverBlocks = {}
}

local function getTool()
	return lplr.Character and lplr.Character:FindFirstChildWhichIsA('Tool', true) or nil
end

local function notif(...)
	return vape:CreateNotification(...)
end

local function parsePositions(v, func)
	if v:IsA('Part') then
		local start = -(v.Size / 2) + Vector3.new(1.5, 1.5, 1.5)
		for x = 0, v.Size.X - 1, 3 do
			for y = 0, v.Size.Y - 1, 3 do
				for z = 0, v.Size.Z - 1, 3 do
					local vec = start + Vector3.new(x, y, z)
					vec = v.CFrame:PointToWorldSpace(vec)
					vec = Vector3.new(math.round(vec.X), math.round(vec.Y), math.round(vec.Z))
					func(vec)
				end
			end
		end
	end
end

run(function()
    bd.GetRemote = function(name: RemoteEvent | RemoteFunction): RemoteEvent | RemoteFunction
        local remote
        for _,v in pairs(game:GetDescendants()) do
            if (v:IsA('RemoteEvent') or v:IsA('RemoteFunction')) and v.Name == name then
                remote = v
                break
            end
        end
        if name == nil then return Instance.new('RemoteEvent') end
        return remote
    end
    bd.Remotes = {
        AttackPlayer = bd.GetRemote('AttackPlayerWithSword'),
        PlaceBlock = bd.GetRemote('PlaceBlock'),
        Blocking = bd.GetRemote('ToggleBlockSword'),
        Entity = require(replicatedStorage.Modules.Entity) or {
            added = bd.GetRemote('EntityAdded'),
            removed = bd.GetRemote('EntityRemoving'),
            changed = bd.GetRemote('EntityChanged'),
            toolchanged = bd.GetRemote('EntityToolChanged'),
            toolremoved = bd.GetRemote('EntityToolRemoved'),
            invchanged = bd.GetRemote('EntityInventoryChanged'),
        } -- not sure about this one
    }

    task.spawn(function()
		local map = workspace:WaitForChild('Map', 99999)
		if map and vape.Loaded ~= nil then
			vape:Clean(map.DescendantAdded:Connect(function(v)
				parsePositions(v, function(pos)
					store.blocks[pos] = v
				end)
			end))
			vape:Clean(map.DescendantRemoving:Connect(function(v)
				parsePositions(v, function(pos)
					if store.blocks[pos] == v then
						store.blocks[pos] = nil
						store.serverBlocks[pos] = nil
					end
				end)
			end))
			for _, v in map:GetDescendants() do
				parsePositions(v, function(pos)
					store.blocks[pos] = v
					store.serverBlocks[pos] = v
				end)
			end
		end
	end)

	vape:Clean(function()
		table.clear(store.blocks)
		table.clear(store)
	end)
end)

for _, v in {'Reach', 'SilentAim', 'Disabler', 'HitBoxes', 'MurderMystery', 'AutoRejoin'} do
	vape:Remove(v)
end

run(function()
	local oldstart = entitylib.start
	local function teamcheck(ent)
		local suc, res = pcall(function()
			if ent.Team or ent.Character.Humanoid.Team then
				return lplr.Team ~= (ent.Team or ent.Character.Humanoid.Team)
			end
		end)
		if suc then return res else return end
	end
	local function customEntity(ent)
		if not ent:HasTag('NPC') then return end
		if ent:IsDescendantOf(workspace) then
			if ent.Name:find("%[BOT%]") then
				ent.Name = ent.Name:gsub('<font.->', ''):gsub('</font>', ''):gsub('%[BOT%]%s*', '')
			end
			entitylib.addEntity(ent, nil, ent:HasTag('NPC') and function(self)
				return teamcheck(self)
			end)
		end
	end

	entitylib.start = function()
		oldstart()
		if entitylib.Running then
			for _, ent in collectionService:GetTagged('NPC') do
				customEntity(ent)
			end
			table.insert(entitylib.Connections, collectionService:GetInstanceAddedSignal('NPC'):Connect(customEntity))
			table.insert(entitylib.Connections, collectionService:GetInstanceRemovedSignal('NPC'):Connect(function(ent)
				entitylib.removeEntity(ent)
			end))
		end
	end
end)
entitylib.start()

run(function()
	local AutoClicker
	local CPS
	
	AutoClicker = vape.Categories.Combat:CreateModule({
		Name = 'AutoClicker',
		Function = function(callback)
			if callback then
				repeat
					local tool = getTool()
					if tool and inputService:IsMouseButtonPressed(0) then
						tool:Activate()
					end
					task.wait(1 / CPS.GetRandomValue())
				until not AutoClicker.Enabled
			end
		end,
		Tooltip = 'Automatically clicks for you'
	})
	CPS = AutoClicker:CreateTwoSlider({
		Name = 'CPS',
		Min = 1,
		Max = 20,
		DefaultMin = 8,
		DefaultMax = 12
	})
end)