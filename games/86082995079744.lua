--[[

    kool.aid -->> Slap Tower 4
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

local firepart = firetouchinterest or function(plr: Instance, item: Instance, tog: number): Instance, number
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

    return 'ahh im cumming'
end

local function getGlove()
    if getTool() == nil then return false end
    if string.find(getTool().Name, getGloveType()) then
        return true
    end

    return false
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

return notify('This version is a beta version, and should be used at your own risk. Detections may occur while using the product.', 20)