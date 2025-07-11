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

local firepart = firetouchinterest or function(plr: Instance, item: Instance, tog: number)
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
        end
    end)
end

local function getTool()
	return lplr.Character and lplr.Character:FindFirstChildWhichIsA('Tool', true) or nil
end

local gloves = {
    'Default',
    'Silver',
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