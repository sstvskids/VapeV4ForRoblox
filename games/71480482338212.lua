--[[

    kool.aid --> BedwarZ
    by @stav and @sus
    
    Forever will, forever always undetected
]]

local run = function(func)
    func()
end
local cloneref = cloneref or function(obj)
    return obj
end

local playersService = cloneref(game:GetService('Players'))
local starterPlayer = cloneref(game:GetService('StarterPlayer'))
local inputService = cloneref(game:GetService('UserInputService'))
local replicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
local collectionService = cloneref(game:GetService('CollectionService'))
local runService = cloneref(game:GetService('RunService'))
local starterGui = cloneref(game:GetService('StarterGui'))

local gameCamera = workspace.CurrentCamera
local lplr = playersService.LocalPlayer
local vape = shared.vape
local entitylib = vape.Libraries.entity
local targetinfo = vape.Libraries.targetinfo
local prediction = vape.Libraries.prediction

local function notif(...)
	return vape:CreateNotification(...)
end

local store = {
    items = {
        ['Swords'] = {
            [1] = 'Wooden Sword',
            [2] = 'Stone Sword',
            [3] = 'Iron Sword',
            [4] = 'Diamond Sword',
            [5] = 'Emerald Sword'
        },
        ['Pickaxes'] = {
            [1] = 'Wooden Pickaxe',
            [2] = 'Stone Pickaxe',
            [3] = 'Iron Pickaxe',
            [4] = 'Diamond Pickaxe'
        },
        ['Blocks'] = {
            [1] = 'Blastproof Ceramic',
            [2] = 'Blue Wool',
            [3] = 'Brown Wool',
            [4] = 'Green Wool',
            [5] = 'Obsidian',
            [6] = 'Orange Wool',
            [7] = 'Pink Wool',
            [8] = 'Purple Wool',
            [9] = 'Red Wool',
            [10] = 'Stone Brick',
            [11] = 'Wood Plank',
            [12] = 'Wool',
            [13] = 'Yellow Wool'
        }
    }
}

-- very sloppy functions but they work

local function hasTool(v)
    return lplr.Backpack and lplr.Backpack:FindFirstChild(v)
end

local function getTool()
	return lplr.Character and lplr.Character:FindFirstChildWhichIsA('Tool', true) or nil
end

local AutoTool = {}

local function getPickaxe()
    local pickaxes = {}
    for i,v in ipairs(store.items.Pickaxes) do
        local tool = getTool()
        if hasTool(v) or (tool and tool.Name == tostring(v)) then
            table.insert(pickaxes, tostring(v))
        end
    end

    return pickaxes
end

local function getSword()
    local swords = {}
    for i,v in ipairs(store.items.Swords) do
        local tool = getTool()
        if hasTool(v) or (tool and tool.Name == tostring(v)) then
            table.insert(swords, tostring(v))
        end
    end

    return swords
end

local function getBlock()
    local blocks = {}
    for i,v in ipairs(store.items.Blocks) do
        local tool = getTool()
        if hasTool(v) or (tool and tool.Name == tostring(v)) then
            table.insert(blocks, tostring(v))
        end
    end

    return blocks
end

local function getItem(type)
    for i,v in ipairs(store.items[type]) do
        local tool = getTool()
        if entitylib.isAlive and tool and tool.Name == v then
            return true
        end
    end

    return false
end

local function switchTool(tool)
    if not AutoTool.Enabled then return end

    local tools = typeof(tool) == 'Instance' and tool or hasTool(tool)
    local oldtool = getTool()

    if oldtool and tools and oldtool.Name ~= tools.Name then
        oldtool.Parent = lplr.Backpack
    end

    if tools then
        tools.Parent = lplr.Character
    end
end

for _, v in {'Reach', 'SilentAim', 'Disabler', 'HitBoxes', 'MurderMystery', 'AutoRejoin', 'AutoClicker', 'ProfileInstaller'} do
	vape:Remove(v)
end

local Killaura
run(function()
    local Max
    local SwingRange
    local AngleSlider
    local Targets
    local AliveItemCheck
    local Swing
    local Face
    local SwingDelay = tick()

    Killaura = vape.Categories.Blatant:CreateModule({
        Name = 'Killaura',
        Function = function(callback)
            if callback then
                repeat
                    local plrs = entitylib.AllPosition({
                        Range = SwingRange.Value,
                        Wallcheck = Targets.Walls.Enabled or nil,
                        Part = 'RootPart',
                        Players = Targets.Players.Enabled,
                        NPCs = Targets.NPCs.Enabled,
                        Limit = Max.Value
                    })

                    if #plrs > 0 and entitylib.isAlive then
                        local selfpos = entitylib.character.RootPart.Position
						local localfacing = entitylib.character.RootPart.CFrame.LookVector * Vector3.new(1, 0, 1)

                        for _, v in plrs do
                            local delta = ((v.RootPart.Position + v.Humanoid.MoveDirection) - selfpos)
							local angle = math.acos(localfacing:Dot((delta * Vector3.new(1, 0, 1)).Unit))
							if angle > (math.rad(AngleSlider.Value) / 2) then continue end

                            targetinfo.Targets[v] = tick() + 1

                            if Face.Enabled then
                                local vec = v.RootPart.Position * Vector3.new(1, 0, 1)
                                entitylib.character.RootPart.CFrame = CFrame.lookAt(entitylib.character.RootPart.Position, Vector3.new(vec.X, entitylib.character.RootPart.Position.Y + 0.001, vec.Z))
                            end

                            task.spawn(function()
                                for _, i in getSword() do
                                    if AliveItemCheck.Enabled and getItem('Swords') == false then continue end
                                    replicatedStorage.Remotes.ItemsRemotes.SwordHit:FireServer(i, v.Character)
                                end
                            end)
                        end
                    end

                    task.wait()
                until not Killaura.Enabled
            end
        end,
        Tooltip = 'Attack players around you\nwithout aiming at them.'
    })
    Targets = Killaura:CreateTargets({Players = true})
    SwingRange = Killaura:CreateSlider({
		Name = 'Range',
		Min = 1,
		Max = 18,
		Default = 18,
		Suffix = function(val)
			return val == 1 and 'stud' or 'studs'
		end
	})
	Max = Killaura:CreateSlider({
		Name = 'Max targets',
		Min = 1,
		Max = 10,
		Default = 10
	})
    AngleSlider = Killaura:CreateSlider({
		Name = 'Max angle',
		Min = 1,
		Max = 360,
		Default = 360
	})
    Face = Killaura:CreateToggle({Name = 'Face target'})
    Swing = Killaura:CreateToggle({Name = 'No Swing'})
    AliveItemCheck = Killaura:CreateToggle({
		Name = 'Alive/Item Check',
		Tooltip = 'Good for closet-cheaters'
	})
end)

run(function()
	local NoFall
	local Mode
	local rayParams = RaycastParams.new()
	
	NoFall = vape.Categories.Blatant:CreateModule({
		Name = 'NoFall',
		Function = function(callback)
			if callback then
				local tracked = 0
				if Mode.Value == 'Gravity' then
                    notif('Vape', 'nofall method crashes with aura; disabled :)', 5)
					--[[local extraGravity = 0
					NoFall:Clean(runService.PreSimulation:Connect(function(dt)
						if entitylib.isAlive then
							local root = entitylib.character.RootPart
							if root.AssemblyLinearVelocity.Y < -85 then
								rayParams.FilterDescendantsInstances = {lplr.Character, gameCamera}
								rayParams.CollisionGroup = root.CollisionGroup
	
								local rootSize = root.Size.Y / 2 + entitylib.character.HipHeight
								local ray = workspace:Blockcast(root.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, (tracked * 0.1) - rootSize, 0), rayParams)
								if not ray then
									root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, -86, root.AssemblyLinearVelocity.Z)
									root.CFrame += Vector3.new(0, extraGravity * dt, 0)
									extraGravity += -workspace.Gravity * dt
								end
							else
								extraGravity = 0
							end
						end
					end))]]
				else
					repeat
						if entitylib.isAlive then
							local root = entitylib.character.RootPart
							tracked = entitylib.character.Humanoid.FloorMaterial == Enum.Material.Air and math.min(tracked, root.AssemblyLinearVelocity.Y) or 0
	
							if tracked < -85 then
								if Mode.Value == 'Teleport' then
									rayParams.FilterDescendantsInstances = {lplr.Character, gameCamera}
									rayParams.CollisionGroup = root.CollisionGroup
	
									local rootSize = root.Size.Y / 2 + entitylib.character.HipHeight
									if Mode.Value == 'Teleport' then
										local ray = workspace:Blockcast(root.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, -1000, 0), rayParams)
										if ray then
											root.CFrame -= Vector3.new(0, root.Position.Y - (ray.Position.Y + rootSize), 0)
										end
									else
										local ray = workspace:Blockcast(root.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, (tracked * 0.1) - rootSize, 0), rayParams)
										if ray then
											tracked = 0
											root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, -80, root.AssemblyLinearVelocity.Z)
										end
									end
								end
							end
						end
	
						task.wait(0.03)
					until not NoFall.Enabled
				end
			end
		end,
		Tooltip = 'Prevents taking fall damage.'
	})
	Mode = NoFall:CreateDropdown({
		Name = 'Mode',
		List = {'Teleport', 'Bounce', 'Gravity'},
		Function = function()
			if NoFall.Enabled then
				NoFall:Toggle()
				NoFall:Toggle()
			end
		end
	})
end)

--[[run(function()
    local Breaker
    local Range

    Breaker = vape.Categories.Minigames:CreateModule({
        Name = 'Breaker',
        Function = function(callback)
            if callback then
                repeat
                    for _, v in workspace.BedsContainer:GetChildren() do
                        local part = v.BedHitbox
                        if entitylib.isAlive and (part:IsA('BasePart') or part:IsA('Part')) and (lplr.Character.HumanoidRootPart.Position - part.Position).Magnitude <= Range.Value then
                            task.spawn(function()
                                for _, i in getPickaxe() do
                                    if not getItem('Pickaxes') then continue end

                                    print('breaking')
                                    replicatedStorage.Remotes.ItemsRemotes.MineBlock:FireServer(i, part, part.Position, gameCamera.CFrame.Position, (part.Position - gameCamera.CFrame.Position).Unit * 100)

                                    break
                                end
                            end)
                        end
                    end
                    task.wait()
                until not Breaker.Enabled
            end
        end
    })
    Range = Breaker:CreateSlider({
		Name = 'Break range',
		Min = 1,
		Max = 18,
		Default = 18
	})
end)

run(function()
    local Scaffold

    local function placeBlock(block, pos: Vector3)
        return replicatedStorage.Remotes.ItemsRemotes.PlaceBlock:InvokeServer(block, Vector3.new(pos.X / 3, pos.Y / 3, pos.Z / 3))
    end

    Scaffold = vape.Categories.Utility:CreateModule({
        Name = 'Scaffold',
        Function = function(callback)
            if callback then
                repeat
                    if entitylib.isAlive then
                        task.spawn(function()
                            for _, i in getBlock() do
                                if not getItem('Blocks') then continue end

                                placeBlock(i, (entitylib.character.RootPart.CFrame + entitylib.character.RootPart.CFrame.LookVector * 0.5) - Vector3.new(0, 4.5, 0))
                            end
                        end)
                    end
                    
                    task.wait(0.01)
                until not Scaffold.Enabled
            end
        end
    })
end)]]

notif('Vape', 'let the kool.aid begin', 5)