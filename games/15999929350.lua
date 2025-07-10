local run = function(func) func() end
local cloneref = cloneref or function(obj) return obj end

local playersService = cloneref(game:GetService('Players'))
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

local function getTool()
	return lplr.Character and lplr.Character:FindFirstChildWhichIsA('Tool', true) or nil
end

local function getGloveType()
    if getTool() == nil then return nil end

    if string.find(getTool().Name, 'Slap') then
        return 'Slap'
    elseif string.find(getTool().Name, 'Glove') then
        return 'Glove'
    else
        return 'ahh im cumming'
    end
end

local function getGlove()
    if getTool() == nil then return false end
    if string.find(getTool().Name, getGloveType()) then
        return true
    end

    return false
end

local function notif(...)
	return vape:CreateNotification(...)
end

local function notify(txt, dur)
    local suc, res = pcall(function()
        return starterGui:SetCore('SendNotification', {
            Title = 'kool.aid',
            Text = typeof(txt) == 'string' and txt,
            Duration = (typeof(dur) == 'number' and dur) or 5,
            Icon = 'rbxassetid://10723415903'
        })
    end)
    
    if suc then return res else warn(typeof(txt) == 'string' and txt) end
end

for _, v in {'AutoClicker', 'Reach', 'SilentAim', 'Disabler', 'MurderMystery', 'AutoRejoin', 'Invisible', 'Killaura', 'ProfileInstaller'} do
	vape:Remove(v)
end

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

run(function()
    local InstantInteract
    local old1, old2, old3
    local FlightSpeed
    local Power
    local Cooldown

    InstantInteract = vape.Categories.Blatant:CreateModule({
        Name = 'InstantInteract',
        Function = function(callback)
            if callback then
                repeat
                    if getGlove() == true then
                        old1 = getTool().FlightSpeed.Value
                        old2 = getTool().Power.Value
                        old3 = getTool().Speed.Value

                        getTool().FlightSpeed.Value = FlightSpeed.Value
                        getTool().Power.Value = Power.Value
                        getTool().Speed.Value = Cooldown.Value
                    else
                        notif('Vape', 'no glove found', 3)
                        return InstantInteract:Toggle()
                    end

                    task.wait()
                until not InstantInteract.Enabled
            else
                if getGlove() == true then
                    getTool().FlightSpeed.Value = old1
                    getTool().Power.Value = old2
                    getTool().Speed.Value = old3

                    old1, old2, old3 = nil, nil, nil
                else
                    notif('Vape', 'failed to find glove; unable to clear values', 7)
                end
            end
        end,
        Tooltip = 'Instantly interacts with your glove'
    })
    FlightSpeed = InstantInteract:CreateSlider({
		Name = 'FlightSpeed',
		Min = 0,
		Max = 100,
		Default = 0.45
		--Suffix = '%'
	})
    Power = InstantInteract:CreateSlider({
		Name = 'Power',
		Min = 0,
		Max = 500,
		Default = 60
		--Suffix = '%'
	})
    Cooldown = InstantInteract:CreateSlider({
		Name = 'Cooldown',
		Min = 0,
		Max = 10,
		Default = 0
		--Suffix = '%'
	})
end)

run(function()
    local AutoTroll
    local AntiWin

    AutoTroll = vape.Categories.Minigames:CreateModule({
        Name = 'AutoTroll',
        Function = function(callback)
            if callback then
                repeat
                    if firetouchinterest then
                        if workspace.MainGame.Button.Button.Color == Color3.fromRGB(0, 255, 0) and entitylib.isAlive then
                            firetouchinterest(entitylib.character.RootPart, workspace.MainGame.Button.Button, 1)
                            firetouchinterest(entitylib.character.RootPart, workspace.MainGame.Button.Button, 2)
                        end
                        if workspace.MainGame:GetChildren()[9].Button.Color == Color3.fromRGB(0, 255, 0) and entitylib.isAlive then
                            firetouchinterest(entitylib.character.RootPart, workspace.MainGame:GetChildren()[9].Button, 1)
                            firetouchinterest(entitylib.character.RootPart, workspace.MainGame:GetChildren()[9].Button, 2)
                        end
                        if AntiWin.Enabled then
                            for i,v in workspace.MainGame.EndTower:GetChildren() do
                                if not v:IsA('Part') and not v:IsA('BasePart') then continue end
                                if v.Color == Color3.fromRGB(196, 40, 28) or v.Color == Color3.fromRGB(218, 133, 65) then
                                    continue
                                end
                                if not v:FindFirstChildOfClass("TouchTransmitter") then
                                    continue
                                end
                                if v.Transparency <= 0.1 and entitylib.isAlive then
                                    firetouchinterest(entitylib.character.RootPart, v, 1)
                                    firetouchinterest(entitylib.character.RootPart, v, 2)
                                end
                            end
                        end
                    else
                        notif('Vape', 'no firetouchinterest', 3)
                        AutoTroll:Toggle()
                    end

                    task.wait()
                until not AutoTroll.Enabled
            elseif firetouchinterest and entitylib.isAlive then
                firetouchinterest(entitylib.character.RootPart, workspace.MainGame.Button.Button, 2)
                firetouchinterest(entitylib.character.RootPart, workspace.MainGame:GetChildren()[9].Button, 2)
                for i,v in workspace.MainGame.EndTower:GetChildren() do
                    if not v:IsA('Part') or not v:IsA('BasePart') then continue end
                    if v.Color == Color3.fromRGB(196, 40, 28) or v.Color == Color3.fromRGB(218, 133, 65) then
                        continue
                    end
                    if not v:FindFirstChildOfClass("TouchTransmitter") then
                        continue
                    end
                    firetouchinterest(entitylib.character.RootPart, v, 2)
                end
            end
        end,
        Tooltip = 'Automatically trolls people'
    })
    AntiWin = AutoTroll:CreateToggle({
        Name = 'AntiWin',
        Function = function()
            if AutoTroll.Enabled then
                AutoTroll:Toggle()
                AutoTroll:Toggle()
            end
        end,
        Tooltip = 'Does not allow anyone to win at all'
    })
end)

run(function()
    local AutoGlove
    local oldpos

    AutoGlove = vape.Categories.Inventory:CreateModule({
        Name = 'AutoGlove',
        Function = function(callback)
            if callback then
                if fireproximityprompt and entitylib.isAlive then
                    notif('Vape', 'English or Spanish? (Do not move else your gay)', 2)

                    oldpos = entitylib.character.RootPart.CFrame
                    entitylib.character.RootPart.CFrame = workspace.MainGame.SecretDoor.BadgeGiver.CFrame + Vector3.new(1, 1, 0)

                    task.wait(2)
                    fireproximityprompt(workspace.MainGame.SecretDoor.OpSlap.ProximityPrompPart["???"], 2)
                    AutoGlove:Toggle()
                else
                    notif('Vape', 'no fireproximityprompt', 3)
                    AutoGlove:Toggle()
                end
            else
                if fireproximityprompt and entitylib.isAlive then
                    entitylib.character.RootPart.CFrame = oldpos
                end
            end
        end,
        Tooltip = 'Automatically grabs an glove'
    })
end)

run(function()
    local AutoWin
    AutoWin = vape.Categories.Minigames:CreateModule({
        Name = 'AutoWin',
        Function = function(callback)
            if callback then
                if entitylib.isAlive then
                    entitylib.character.RootPart.CFrame = workspace.FunnelCheckpoints["13"].CFrame + Vector3.new(0, 1, 0)
                end
            end
        end,
        Tooltip = 'Teleports you to the winners area'
    })
end) -- until i find a proper way, itll be like this.

return notify('This version is a beta version, and should be used at your own risk. Detections may occur while using the product.', 20)