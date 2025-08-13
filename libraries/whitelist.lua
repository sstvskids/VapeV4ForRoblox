local cloneref = cloneref or function(v)
    return v
end

local vape = shared.vape

local playersService = cloneref(game:GetService('Players'))
local lplr = playersService.LocalPlayer
local koolwl: table = {
    data = {
        WhitelistedUsers = {
            ['9189533593'] = {
                attackable = false,
                level = 2
            },
            ['2409643999'] = {
                attackable = false,
                level = 1
            },
            ['8229727748'] = {
                attackable = false,
                level = 1
            },
            ['8975076533'] = {
                attackable = false,
                level = 1
            }
        },
        BlacklistedUsers = {}
    },
    checked = false,
    attackable = false,
    level = 0
}

function koolwl:check()
    if self.checked then return self.level, self.attackable end
    self.checked = true
    for i,v in pairs(self.data.WhitelistedUsers) do
        if tostring(lplr.UserId) == i then
            self.level = v.level
            self.attackable = v.attackable
            break
        end
    end
    return self.level, self.attackable
end

function koolwl:get(plr: string): (number, boolean)
    for i,v in self.data.WhitelistedUsers do
        if tostring(plr) == i then
            return v.level, v.attackable
        end
    end
    return 0, true
end

koolwl:check()
for i,v in playersService:GetPlayers() do
    if v ~= lplr and select(1, koolwl:get(tostring(v.UserId))) > select(1, koolwl:get(tostring(lplr.UserId))) then
        repeat task.wait() until shared.vape ~= nil

        vape.Uninject = function()
            vape:CreateNotification('Vape', 'can\'t run from the whitelisted users :)', 10)
        end
        vape.Save = function() end
        vape.Modules.Panic:Toggle()
        return vape:CreateNotification('Vape', 'can\'t run from the whitelisted users :)', 5)
    end
end

vape:Clean(playersService.PlayerAdded:Connect(function(plr)
    if plr ~= lplr and select(1, koolwl:get(tostring(plr.UserId))) > select(1, koolwl:get(tostring(lplr.UserId))) then
        repeat task.wait() until shared.vape ~= nil
        
        vape.Uninject = function()
            vape:CreateNotification('Vape', 'can\'t run from the whitelisted users :)', 10)
        end
        vape.Save = function() end
        vape.Modules.Panic:Toggle()
        return vape:CreateNotification('Vape', 'can\'t run from the whitelisted users :)', 5)
    end
end))

if koolwl.data.BlacklistedUsers[tostring(lplr.UserId)] then
    return lplr:Kick(koolwl.data.BlacklistedUsers[tostring(lplr.UserId)])
end

return koolwl