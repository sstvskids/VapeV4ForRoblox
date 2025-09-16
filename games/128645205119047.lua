--[[

    kool.aid -->> Troll is not a pinning tower
    by @stav

]]

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

local function notif(...)
	return vape:CreateNotification(...)
end

local firepart = firetouchinterest or function(plr: Instance, item: Instance, tog: number): Instance
    task.spawn(function()
        if tog == 0 or tog > 1 then return end

        local suc, res = pcall(function()
            if not item:FindFirstChildOfClass('TouchTransmitter') then
                return error('Item does not have a TouchTransmitter: '..item, 2)
            end
        end)

        if suc then
            local collision, cframe = item.CanCollide, item.CFrame
            item.CanCollide = false
            item.CFrame = plr.CFrame
            task.wait()
            item.CFrame = cframe
            item.CanCollide = collision

            -- checks to make sure they go somewhere (mhm!! soo good guys)
            if item.CFrame ~= cframe then
                item.CFrame = cframe
            end
            if item.CanCollide ~= collision then
                item.CanCollide = collision
            end
        end
    end)
end

local function getTool()
	return lplr.Character and lplr.Character:FindFirstChildWhichIsA('Tool', true) or nil
end

local gloves = {
    'Default',
    'Sliver',
    'Hollow',
    'Reflect',
    'Group'
}

local function getGloveType()
    if getTool() == nil then return nil end

    for i,v in gloves do
        if string.find(getTool().Name, v) then
            return v
        end
    end

    if string.find(getTool().Name, 'Glove') then
        return 'Glove'
    end

    return 'ahh im cumming'
end

local function getGlove()
    if getTool() == nil then return false end
    if string.find(getTool().Name, getGloveType()) then
        return true
    end

    return false
end

local function getStages()
    return {1, 2, 3, 5, 6}
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
    local old1, old2
    local FlightSpeed
    local Power
    local Cooldown

    InstantInteract = vape.Categories.Blatant:CreateModule({
        Name = 'InstantInteract',
        Function = function(callback)
            if callback then
                repeat
                    if getGlove() == true then
                        old1 = getTool().Power.Value
                        old2 = getTool().Speed.Value

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
                    getTool().Power.Value = old1
                    getTool().Speed.Value = old2

                    old1, old2 = nil, nil
                else
                    notif('Vape', 'no glove; unable to clear values', 7)
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
    local Method

    AutoTroll = vape.Categories.Minigames:CreateModule({
        Name = 'AutoTroll',
        Function = function(callback)
            if callback then
                repeat
                    if Method.Value == 'TouchInterest' and entitylib.isAlive then
                        firepart(entitylib.character.RootPart, workspace.Stages["2"].Button.Touch, 1)
                        firepart(entitylib.character.RootPart, workspace.Stages["2"].Button.Touch, 0)
                        if AntiWin.Enabled then
                            for i,d in getStages() do
                                for _, v in workspace.Stages[d]:GetChildren() do
                                    if not v:IsA('Part') and not v:IsA('BasePart') then continue end
                                    if not v:FindFirstChildOfClass("TouchTransmitter") then
                                        continue
                                    end
                                    if v.Transparency <= 0.1 and entitylib.isAlive and v.Name == 'Disappear' then
                                        firepart(entitylib.character.RootPart, v, 1)
                                        firepart(entitylib.character.RootPart, v, 0)
                                    end
                                end
                            end
                        end
                    elseif Method.Value == 'Teleport' and entitylib.isAlive then
                        entitylib.character.RootPart.CFrame = workspace.Stages["2"].Button.Touch.CFrame + Vector3.new(0, 1, 0)
                        if AntiWin.Enabled then
                            for i,d in getStages() do
                                for _, v in workspace.Stages[d]:GetChildren() do
                                    if not v:IsA('Part') and not v:IsA('BasePart') then continue end
                                    if not v:FindFirstChildOfClass("TouchTransmitter") then
                                        continue
                                    end
                                    if v.Transparency <= 0.1 and entitylib.isAlive and v.Name == 'Disappear' then
                                        entitylib.character.RootPart.CFrame = v.CFrame + Vector3.new(0, 1, 0)
                                    end
                                end
                            end
                        end
                    end

                    task.wait()
                until not AutoTroll.Enabled
            elseif Method.Value == 'TouchInterest' and entitylib.isAlive then
                firepart(entitylib.character.RootPart, workspace.Stages["2"].Button.Touch, 0)
                for i,d in getStages() do
                    for _, v in workspace.Stages[d]:GetChildren() do
                        if not v:IsA('Part') and not v:IsA('BasePart') then continue end
                        if not v:FindFirstChildOfClass("TouchTransmitter") then
                            continue
                        end
                        if v.Transparency <= 0.1 and entitylib.isAlive and v.Name == 'Disappear' then
                            firepart(entitylib.character.RootPart, v, 0)
                        end
                    end
                end
            end
        end,
        Tooltip = 'Automatically trolls people',
        ExtraText = function()
            return Method.Value
        end
    })
    Method = AutoTroll:CreateDropdown({
		Name = 'Method',
		List = {'Teleport', 'TouchInterest'},
        Tooltip = 'Teleport - Moves your character to all the parts\nTouchInterest - Manipulates the server into thinking you are touching the parts'
	})
    AntiWin = AutoTroll:CreateToggle({
        Name = 'AntiWin',
        Function = function()
            if AutoTroll.Enabled then
                AutoTroll:Toggle()
                AutoTroll:Toggle()
            end
        end,
        Tooltip = 'Does not allow anyone to win at all\nCan be a bit unreliable on Teleport'
    })
end)

run(function()
    local GodMode
    GodMode = vape.Categories.World:CreateModule({
        Name = 'Godmode',
        Function = function(callback)
            if callback then
                for _, v in game:GetDescendants() do
                    pcall(function()
                        if v.Name == 'Kill' then
                            if v.TouchInterest then
                                v.TouchInterest:Destroy()
                            end
                        end
                    end)
                end
            else
                notif('Vape', 'Godmode will be disabled the next time you rejoin', 7)
            end
        end,
        Tooltip = 'Prevents you from dying'
    })
end)

notify('AutoTroll has lag issues on some executors (e.g. Velocity, etc). It might be best to use Teleport.')
return notify('This version is a beta version, and should be used at your own risk. Detections may occur while using the product.', 20)