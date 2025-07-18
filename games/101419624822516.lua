--[[

    kool.aid -->> Bridge Builders
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

for _, v in {'AutoClicker', 'Reach', 'MurderMystery', 'AutoRejoin', 'Killaura', 'ProfileInstaller'} do
	vape:Remove(v)
end

-- stav.lua
run(function()
    local AutoCollect
    
    AutoCollect = vape.Categories.Blatant:CreateModule({
        Name = 'AutoCollect',
        Function = function(callback)
            if callback then
                repeat
                    if entitylib.isAlive then
                        if string.find(tostring(lplr.Team), 'Blue') then
                            task.spawn(firepart, entitylib.character.RootPart, workspace.BlueZone.AreaBlue, 1)
                            task.spawn(firepart, entitylib.character.RootPart, workspace.BlueZone.AreaBlue, 0)
                        end
                        if string.find(tostring(lplr.Team), 'Red') then
                            task.spawn(firepart, entitylib.character.RootPart, workspace.RedZone.AreaRed, 1)
                            task.spawn(firepart, entitylib.character.RootPart, workspace.RedZone.AreaRed, 0)
                        end
                    end
                    
                    task.wait()
                until not AutoCollect.Enabled
            else
                if entitylib.isAlive then
                    if string.find(tostring(lplr.Team), 'Blue') then
                        task.spawn(firepart, entitylib.character.RootPart, workspace.BlueZone.AreaBlue, 0)
                    end
                    if string.find(tostring(lplr.Team), 'Red') then
                        task.spawn(firepart, entitylib.character.RootPart, workspace.RedZone.AreaRed, 0)
                    end
                end
            end
        end,
        Tooltip = 'Automatically collects blocks for you'
    })
end)

run(function()
    local AutoWin
    
    AutoWin = vape.Categories.Minigames:CreateModule({
        Name = 'AutoWin',
        Function = function(callback)
            if callback then
                repeat
                    if entitylib.isAlive then
                        task.spawn(firepart, entitylib.character.RootPart, workspace.Trophy.Abajo, 1)
                        task.spawn(firepart, entitylib.character.RootPart, workspace.Trophy.Abajo, 0)
                    end
                    
                    task.wait()
                until not AutoWin.Enabled
            else
                if entitylib.isAlive then
                    task.spawn(firepart, entitylib.character.RootPart, workspace.Trophy.Abajo, 0)
                end
            end
        end,
        Tooltip = 'Automatically touches the trophy for you'
    })
end)

run(function()
    local Scaffold
    Scaffold = vape.Categories.Utility:CreateModule({
        Name = 'Scaffold',
        Function = function(callback)
            if callback then
                repeat
                    task.spawn(function()
                        if entitylib.isAlive then
                            if string.find(tostring(lplr.Team), 'Blue') then
                                for i,v in workspace.BlueZone.Build:GetDescendants() do
                                    if not v:FindFirstChildOfClass("TouchTransmitter") then
                                        continue
                                    end
                                    task.spawn(firepart, entitylib.character.RootPart, v, 1)
                                    task.spawn(firepart, entitylib.character.RootPart, v, 0)
                                end
                            end
                            if string.find(tostring(lplr.Team), 'Red') then
                                for i,v in workspace.RedZone.Build:GetDescendants() do
                                    if not v:FindFirstChildOfClass("TouchTransmitter") then
                                        continue
                                    end
                                    task.spawn(firepart, entitylib.character.RootPart, v, 1)
                                    task.spawn(firepart, entitylib.character.RootPart, v, 0)
                                end
                            end
                        end
                    end)
                    
                    task.wait()
                until not Scaffold.Enabled
            else
                task.spawn(function()
                    if entitylib.isAlive then
                        if string.find(tostring(lplr.Team), 'Blue') then
                            for i,v in workspace.BlueZone.Build:GetDescendants() do
                                if not v:FindFirstChildOfClass("TouchTransmitter") then
                                    continue
                                end
                                task.spawn(firepart, entitylib.character.RootPart, v, 0)
                            end
                        end
                        if string.find(tostring(lplr.Team), 'Red') then
                            for i,v in workspace.BlueZone.Build:GetDescendants() do
                                if not v:FindFirstChildOfClass("TouchTransmitter") then
                                    continue
                                end
                                task.spawn(firepart, entitylib.character.RootPart, v, 0)
                            end
                        end
                    end
                end)
            end
        end,
        Tooltip = 'Automatically places blocks for you'
    })
end)

notif('Vape', 'This version is in beta, bugs may arise.', 5)