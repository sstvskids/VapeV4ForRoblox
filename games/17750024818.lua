--[[

    kool.aid --> Bedwarz
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
            [5] = 'Emerald Sword',
            [6] = 'Rake',
            [7] = 'Metal',
            [8] = 'Spear',
            [9] = 'Giant Hammer',
            [10] = 'Boxing Gloves',
            [11] = 'Unwooden Sword',
            [12] = 'Breakable Sword'
        },
        ['Pickaxes'] = {
            [1] = 'Wooden Pickaxe',
            [2] = 'Stone Pickaxe',
            [3] = 'Iron Pickaxe',
            [4] = 'Diamond Pickaxe'
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

local AutoTool -- we are SO spoofing ITEMS with this one!

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
                    if AliveItemCheck.Enabled and not entitylib.isAlive then continue end

                    local plrs = entitylib.AllPosition({
                        Range = SwingRange.Value,
                        Wallcheck = Targets.Walls.Enabled or nil,
                        Part = 'RootPart',
                        Players = Targets.Players.Enabled,
                        NPCs = Targets.NPCs.Enabled,
                        Limit = Max.Value
                    })

                    if #plrs > 0 then
                        local selfpos = entitylib.character.RootPart.Position
						local localfacing = entitylib.character.RootPart.CFrame.LookVector * Vector3.new(1, 0, 1)

                        task.spawn(function()
                            for _, v in plrs do
                                local delta = ((v.RootPart.Position + v.Humanoid.MoveDirection) - selfpos)
								local angle = math.acos(localfacing:Dot((delta * Vector3.new(1, 0, 1)).Unit))
								if angle > (math.rad(AngleSlider.Value) / 2) then continue end

                                targetinfo.Targets[v] = tick() + 1

                                -- thx qwerty for not giving me aids
                                if not Swing.Enabled and SwingDelay < tick() then
                                    SwingDelay = tick() + 0.1

                                    if getItem('Swords') then
                                        local tool = getTool()
                                        if vape.ThreadFix then
                                            setthreadidentity(2)
                                        end
                                        local viewmodel
                                        local suc, res = pcall(require, tool.ViewModelModule)
                                        if suc == true and res then
                                            viewmodel = res
                                            viewmodel.PlayAnimation()
                                        end
                                        if vape.ThreadFix then
                                            setthreadidentity(8)
                                        end

                                        tool.HandlePart.Swing:Play()
                                    end
                                end

                                if Face.Enabled then
                                    local vec = v.RootPart.Position * Vector3.new(1, 0, 1)
                                    entitylib.character.RootPart.CFrame = CFrame.lookAt(entitylib.character.RootPart.Position, Vector3.new(vec.X, entitylib.character.RootPart.Position.Y + 0.001, vec.Z))
                                end

                                task.spawn(function()
                                    for _, i in getSword() do
                                        if AliveItemCheck.Enabled and getItem('Swords') == false then continue end
                                        replicatedStorage.Remotes.ItemRemotes.SwordAttack:FireServer(v.Character, i)
                                    end
                                end)
                            end
                        end)
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

-- off of vape but it works
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
					local extraGravity = 0
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
					end))
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
		List = {'Gravity', 'Teleport', 'Bounce'},
		Function = function()
			if NoFall.Enabled then
				NoFall:Toggle()
				NoFall:Toggle()
			end
		end
	})
end)

run(function()
    local Velocity

    Velocity = vape.Categories.Combat:CreateModule({
        Name = 'Velocity',
        Function = function(callback)
            if callback then
                lplr.PlayerScripts:WaitForChild('Knockback'):Destroy()
                Velocity:Clean(lplr.CharacterAdded:Connect(function()
                    lplr.PlayerScripts:WaitForChild('Knockback'):Destroy()
                end))
            else
                if entitylib.isAlive then
                    entitylib.character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
                    entitylib.character.Humanoid.Health = 0
                end
            end
        end,
        Tooltip = 'Reduces knockback taken'
    })
end)

-- REWRITTEN from dms with @sus

local Breaker
run(function()
    local Range

    Breaker = vape.Categories.Minigames:CreateModule({
        Name = 'Breaker',
        Function = function(callback)
            if callback then
                repeat
                    local beds = workspace:WaitForChild("Map"):WaitForChild("Beds"):GetChildren()
                    local tool = getTool()

                    task.spawn(function()
                        for _, v in beds do
                            for _, part in v:GetDescendants() do
                                if entitylib.isAlive and part:IsA('BasePart') and (lplr.Character.HumanoidRootPart.Position - part.Position).Magnitude <= Range.Value then
                                    task.spawn(function()
                                        for _, i in getPickaxe() do
                                            if not getItem('Pickaxes') then
                                                switchTool(i)
                                            end
                                            replicatedStorage.Remotes.DamageBlock:InvokeServer(v, i)

                                            break
                                        end
                                    end)

                                    if tool and tool.Parent == lplr.Backpack then
                                        switchTool(tool)
                                    end

                                    break
                                end
                            end
                        end
                    end)

                    task.wait()
                until not Breaker.Enabled
            end
        end,
        Tooltip = 'Automatically breaks beds (hold your pickaxe out)'
    })
    Range = Breaker:CreateSlider({
		Name = 'Break range',
		Min = 1,
		Max = 18,
		Default = 18
	})
end)

-- this is aids but it works
run(function()
    local AntiHit
    local TimeUp
    local TimeDown
    local Range

    local function defend(pos)
        entitylib.character.RootPart.CFrame = CFrame.new(entitylib.character.RootPart.Position + Vector3.new(0, 40, 0))
        task.wait(TimeUp.Value)
        entitylib.character.RootPart.CFrame = CFrame.new(pos)
    end

    local function getPart(plr)
        return plr.Character and (plr.Character.PrimaryPart or plr.Character:FindFirstChild('HumanoidRootPart'))
    end

    AntiHit = vape.Categories.Blatant:CreateModule({
        Name = 'AntiHit',
        Function = function(callback)
            if callback then
                repeat
                    if entitylib.isAlive then
                        for _, v in entitylib.List do
                            if v.Targetable then
                                local part = getPart(v)
                                if v.Health > 0 and part and (entitylib.character.RootPart.Position - part.Position).Magnitude <= Range.Value then
                                    lplr.Character.Archivable = true

                                    local clone = entitylib.character:Clone()
                                    clone.Parent = game.Workspace
                                    clone.Head:ClearAllChildren()
                                    gameCamera.CameraSubject = clone:FindFirstChild('Humanoid')

                                    vape:Clean(runService.RenderStepped:Connect(function()
                                        if clone ~= nil and clone:FindFirstChild('HumanoidRootPart') then
                                            clone.HumanoidRootPart.CFrame = Vector3.new(entitylib.character.RootPart.Position.X, clone.HumanoidRootPart.Position.Y, entitylib.character.RootPart.Position.Z)
                                        end
                                    end))

                                    defend(clone.HumanoidRootPart.Position)
                                    gameCamera.CameraSubject = entitylib.Character.Humanoid
                                    clone:Destroy()

                                    break
                                end
                            end
                        end
                    end

                    task.wait(TimeDown.Value)
                until not AntiHit.Enabled
            end
        end,
        Tooltip = 'Prevents people from hitting you'
    })
    Range = AntiHit:CreateSlider({
		Name = 'Range',
		Min = 1,
		Max = 18,
		Default = 18,
		Suffix = function(val)
			return val == 1 and 'stud' or 'studs'
		end
	})
    TimeUp = AntiHit:CreateSlider({
		Name = 'Time up',
		Min = 0,
		Max = 1,
		Default = 0.4
	})
    TimeDown = AntiHit:CreateSlider({
		Name = 'Time down',
		Min = 0,
		Max = 1,
		Default = 0.1
	})
end)

run(function()
    local TrapDisabler

    local handletraps = function(trap) -- this is js so it doesn't LAG the client every time a descendant is added
        if not (trap:IsA('BasePart') and trap.Name == 'Hitbox') then
            return
        end

        if trap:FindFirstChild('Explosion') and trap:FindFirstChild('TouchInterest') then
            trap.TouchInterest:Destroy()
            return
        end
    end

    TrapDisabler = vape.Categories.Utility:CreateModule({
        Name = 'TrapDisabler',
        Function = function(callback)
            if callback then
                for i,v in game:GetDescendants() do
                    task.spawn(handletraps, v)
                end

                TrapDisabler:Clean(game.DescendantAdded:Connect(function(v)
                    task.spawn(handletraps, v)
                end))
            end
        end,
        Tooltip = 'Automatically disables traps'
    })
end)

run(function()
    AutoTool = vape.Categories.World:CreateModule({
		Name = 'AutoTool',
		Tooltip = 'Automatically selects the correct tool'
    })
end)