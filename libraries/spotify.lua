local cloneref = cloneref or function(obj)
    return obj
end
local httpService = cloneref(game:GetService('HttpService'))

local module = {
    HTTP = {
        request = function(options)
            local requestf = (request or http and http.request)

            return requestf(options)
        end
    },
    TOKEN = ''
}

module.setToken = function(token)
    if not token then
        if setclipboard then
            setclipboard('https://youtu.be/XoKfh4DBM9I')
        end
        
        return false, 'Read the documentation on how to setup'
    end

    local suc, res = pcall(function()
        return module.HTTP.request({
            Url = 'https://api.spotify.com/v1/me/player/currently-playing',
            Method = 'GET',
            Headers = {
                Accept = 'application/json',
                Authorization = 'Bearer '..token
            }
        })
    end)

    if suc and res.StatusCode == 200 then
        module.TOKEN = token
        return true, 'Success'
    end

    return false, 'Failed to set token (token invalid?)'
end

module.getTrackInfo = function()
    local suc, res = pcall(function()
        return module.HTTP.request({
            Url = 'https://api.spotify.com/v1/me/player/currently-playing',
            Method = 'GET',
            Headers = {
                Accept = 'application/json',
                Authorization = 'Bearer ' .. module.TOKEN
            }
        })
    end)

    if suc and res.StatusCode == 200 then
        local data, artist = httpService:JSONDecode(res.Body), ''

        if data and data.item then
            for i, v in data.item.artists do
                artist = artist .. v.name

                if i < #data.item.artists then
                    artist = artist .. ', '
                end
            end

            return {
                title = data.item.name,
                artists = artist,
                cover = data.item.album.images[1].url,
                isPlaying = data.is_playing,
                expired = false
            }
        end

        module.TOKEN = ''
        return {expired = true}
    end

    module.TOKEN = ''
    return false, 'Failed to get playing track'
end

return module