--[[

    kool.aid -->> Troll is a pinning tower 1 (Punch Tower)
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

local function getGloveType()
    if getTool() == nil then return nil end

    if string.find(getTool().Name, 'Slap') then
        return 'Slap'
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

local function isFriend(plr, recolor)
	if vape.Categories.Friends.Options['Use friends'].Enabled then
		local friend = table.find(vape.Categories.Friends.ListEnabled, plr.Name) and true
		if recolor then
			friend = friend and vape.Categories.Friends.Options['Recolor visuals'].Enabled
		end
		return friend
	end
	return nil
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
                    if Method.Value == 'TouchInterest' then
                        if workspace.MainGame.Button.Button.Color == Color3.fromRGB(0, 255, 0) and entitylib.isAlive then
                            firepart(entitylib.character.RootPart, workspace.MainGame.Button.Button, 1)
                            firepart(entitylib.character.RootPart, workspace.MainGame.Button.Button, 0)
                        end
                        if workspace.MainGame:GetChildren()[9].Button.Color == Color3.fromRGB(0, 255, 0) and entitylib.isAlive then
                            firepart(entitylib.character.RootPart, workspace.MainGame:GetChildren()[9].Button, 1)
                            firepart(entitylib.character.RootPart, workspace.MainGame:GetChildren()[9].Button, 0)
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
                                    firepart(entitylib.character.RootPart, v, 1)
                                    firepart(entitylib.character.RootPart, v, 0)
                                end
                            end
                        end
                    elseif Method.Value == 'Teleport' then
                        if workspace.MainGame.Button.Button.Color == Color3.fromRGB(0, 255, 0) and entitylib.isAlive then
                            entitylib.character.RootPart.CFrame = workspace.MainGame.Button.Button.CFrame + Vector3.new(0, 1, 0)
                        end
                        if workspace.MainGame:GetChildren()[9].Button.Color == Color3.fromRGB(0, 255, 0) and entitylib.isAlive then
                            entitylib.character.RootPart.CFrame = workspace.MainGame:GetChildren()[9].Button.CFrame + Vector3.new(0, 1, 0)
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
                                    entitylib.character.RootPart.CFrame = v.CFrame + Vector3.new(0, 1, 0)
                                end
                            end
                        end
                    end

                    task.wait()
                until not AutoTroll.Enabled
            elseif Method.Value == 'TouchInterest' and entitylib.isAlive then
                firepart(entitylib.character.RootPart, workspace.MainGame.Button.Button, 0)
                firepart(entitylib.character.RootPart, workspace.MainGame:GetChildren()[9].Button, 0)
                for i,v in workspace.MainGame.EndTower:GetChildren() do
                    if not v:IsA('Part') or not v:IsA('BasePart') then continue end
                    if v.Color == Color3.fromRGB(196, 40, 28) or v.Color == Color3.fromRGB(218, 133, 65) then
                        continue
                    end
                    if not v:FindFirstChildOfClass("TouchTransmitter") then
                        continue
                    end
                    firepart(entitylib.character.RootPart, v, 0)
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
        --Tooltip = 'Teleport - Moves you to all the parts\nTouchInterest - Manipulates the server into thinking you are touching the parts'
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
                elseif not fireproximityprompt then
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
    local Method
    AutoWin = vape.Categories.Minigames:CreateModule({
        Name = 'AutoWin',
        Function = function(callback)
            if callback then
                if entitylib.isAlive and Method.Value == 'Teleport' then
                    entitylib.character.RootPart.CFrame = workspace.FunnelCheckpoints["13"].CFrame + Vector3.new(0, 1, 0)
                end
                repeat
                    if entitylib.isAlive and fireproximityprompt and Method.Value == 'Automatic' then
                        entitylib.character.RootPart.CFrame = workspace.MainGame.WinPart.CFrame + Vector3.new(0, 1, 0)
                        task.wait(2)
                        fireproximityprompt(workspace.MainGame.WinPart.WinPrompt, 2)
                    elseif not fireproximityprompt then
                        notif('Vape', 'no fireproximityprompt (change to teleport)', 3)
                        AutoWin:Toggle()
                    end
                until Method.Value ~= 'Automatic' or not AutoWin.Enabled
            end
        end,
        Tooltip = 'Automatically wins for you',
        ExtraText = function()
            return Method.Value
        end
    })
    Method = AutoWin:CreateDropdown({
		Name = 'Method',
		List = {'Teleport', 'Automatic'},
        Function = function()
            if AutoWin.Enabled then
                AutoWin:Toggle()
                AutoWin:Toggle()
            end
        end
	})
end) -- until i find a proper way, itll be like this.

run(function()
    local GodMode
    GodMode = vape.Categories.World:CreateModule({
        Name = 'Godmode',
        Function = function(callback)
            if callback then
                for _, v in game:GetDescendants() do
                    pcall(function()
                        if v.Name == 'Laser' then
                            if v.TouchInterest then
                                v.TouchInterest:Destroy()
                            end
                        end
                        if v.Name == 'EndPart' and v.Color == Color3.fromRGB(196, 40, 28) then
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

run(function()
    local AutoSlap
    local tool
    local xval, yval, zval

    AutoSlap = vape.Categories.Blatant:CreateModule({
        Name = 'AutoSlap',
    	Function = function(callback)
        	if callback then
        		if getGlove() == true then
                    task.spawn(function()
                        for i,v in entitylib.List do
                            if isFriend(v.Player) then continue end
                            if v ~= v.Player and v.Character then
                                tool = getTool()
                                tool.Event:FireServer('slash', v.Character, Vector3.new(xval.Value, yval.Value, zval.Value))
                            end
                        end
                    end)

                    notif('Vape', 'Slapped all players', 3)
                    AutoSlap:Toggle()
                else
                    notif('Vape', 'no glove found', 3)
                    return AutoSlap:Toggle()
                end
    	    end
        end,
	    Tooltip = 'Automatically slaps everyone for you'
    })
    xval = AutoSlap:CreateSlider({
        Name = 'X',
        Min = 0,
        Max = 10,
        Default = 0,
        Tooltip = 'Represents the horizontal position or displacement along the x-axis.'
    })
    yval = AutoSlap:CreateSlider({
        Name = 'Y',
        Min = 0,
        Max = 10,
        Default = 0,
        Tooltip = 'Represents the vertical position or displacement along the y-axis.'
    })
    zval = AutoSlap:CreateSlider({
        Name = 'Z',
        Min = 0,
        Max = 10,
        Default = 0,
        Tooltip = 'Represents the depth position or displacement along the z-axis.'
    })
end)

run(function()
    local Velocity
    local bv, bav
    
    Velocity = vape.Categories.Combat:CreateModule({
        Name = 'Velocity',
        Function = function(callback)
            if callback then
                repeat
                    bv, bav = entitylib.character.RootPart:FindFirstChild('BodyVelocity'), entitylib.character.RootPart:FindFirstChild('BodyAngularVelocity')
                    if entitylib.isAlive then
                        if bv then
                            bv:Destroy()
                        end
                        if bav then
                            bav:Destroy()
                        end
                    end
                    task.wait()
                until not Velocity.Enabled
            end
        end
    })
end)

return notify('This version is a beta version, and should be used at your own risk. Detections may occur while using the product.', 20)