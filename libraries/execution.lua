local cloneref = cloneref or function(obj)
	return obj
end

local Services = setmetatable({}, {
	__index = function(self, obj)
		return cloneref(game:GetService(obj))
	end
})

local RbxAnalytics = Services.RbxAnalyticsService
local HttpService = Services.HttpService
local Players = Services.Players
local lplr = Players.LocalPlayer

local Library = shared.vape

local request = request or http.request
local gethwid = gethwid or getexecutorhwid or get_hwid or GetHWID or function()
    return tostring(RbxAnalytics:GetClientId())
end

local Execution = {}

function Execution:Send()
    local suc, res = pcall(request, {
        Url = 'https://koolaid.staavstudios.workers.dev/track',
        Method = 'POST',
        Body = HttpService:JSONEncode({
            place_id = 'bridgeduel',
            username = lplr.Name,
            userid = tostring(lplr.UserId),
            hwid = gethwid()
        }),
        Headers = {
            ['Content-Type'] = 'application/json'
        }
    })

    if suc and res then
        if res.StatusCode == 429 then
            Library:CreateNotification('Vape', '[API] Ratelimited? (how bro you just executed)', 3)
        elseif res.StatusCode == 400 then
            Library:CreateNotification('Vape', '[API] Failed to do a check (bro what)', 3)
        elseif res.StatusCode ~= 200 then
            Library:CreateNotification('Vape', '[API] Unknown status code: bad internet?', 3)
        end
    end

    if not suc then
        Library:CreateNotification('Vape', '[API] Failed to track execution log: bad internet?', 3)
    end
end

--[[function Execution:Send()
    return Library:Notify('[API] Failed to fetch the API: down? (kool aid should still work like normal)', 8)
end]]

return Execution
