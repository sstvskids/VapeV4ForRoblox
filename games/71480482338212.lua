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
                    if (AliveItemCheck.Enabled and not entitylib.isAlive) then continue end

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

                                if Face.Enabled then
                                    local vec = v.RootPart.Position * Vector3.new(1, 0, 1)
                                    entitylib.character.RootPart.CFrame = CFrame.lookAt(entitylib.character.RootPart.Position, Vector3.new(vec.X, entitylib.character.RootPart.Position.Y + 0.001, vec.Z))
                                end

                                --[[task.spawn(function()
                                    for _, i in getSword() do
                                        if AliveItemCheck.Enabled and getItem('Swords') == false then continue end
                                        replicatedStorage.Remotes.ItemsRemotes.SwordHit:FireServer('Wooden Sword', v.Character)
                                    end
                                end)]]

                                replicatedStorage.Remotes.ItemsRemotes.SwordHit:FireServer('Wooden Sword', v.Character)
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