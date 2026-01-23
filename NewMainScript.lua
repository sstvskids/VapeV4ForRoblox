if identifyexecutor then
	if string.find(string.lower(({identifyexecutor()})[1]), 'jjsploit') or string.find(string.lower(({identifyexecutor()})[1]), 'bytebreaker') then
		getgenv().identifyexecutor = function()
			return 'Xeno'
		end
	end
	if table.find({'Xeno', '5.0'}, ({identifyexecutor()})[1]) or not (debug.getupvalue or debug.getupvalues or debug.getproto or debug.getconstants or hookfunction or hookmetamethod or getconnections or require) then
		shared.badexecs = true
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/skidvape/KoolForRoblox/main/NewMainScript.lua", true))()
	end
end

if require then
	local cloneref = cloneref or function(val) return val end
	
	local lplr = cloneref(game:GetService('Players')).LocalPlayer
	local suc = pcall(function() return require(lplr.PlayerScripts.PlayerModule).controls end)

	if not suc then
		shared.badexecs = true
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/skidvape/KoolForRoblox/main/NewMainScript.lua", true))()
	end
end

local isfile = isfile or function(file)
	local suc, res = pcall(function()
		return readfile(file)
	end)
	return suc and res ~= nil and res ~= ''
end
local delfile = delfile or function(file)
	writefile(file, '')
end

local function downloadFile(path, func)
	if not isfile(path) then
		local suc, res = pcall(function()
			return game:HttpGet('https://raw.githubusercontent.com/sstvskids/VapeV4ForRoblox/'..readfile('newvape/profiles/commit.txt')..'/'..select(1, path:gsub('newvape/', '')), true)
		end)
		if not suc or res == '404: Not Found' then
			error(res)
		end
		if path:find('.lua') then
			res = '--This watermark is used to delete the file if its cached, remove it to make the file persist after vape updates.\n'..res
		end
		writefile(path, res)
	end
	return (func or readfile)(path)
end

local function wipeFolder(path)
	if not isfolder(path) then return end
	for _, file in listfiles(path) do
		if file:find('loader') then continue end
		if isfile(file) and select(1, readfile(file):find('--This watermark is used to delete the file if its cached, remove it to make the file persist after vape updates.')) == 1 then
			delfile(file)
		end
	end
end

for _, folder in {'newvape', 'newvape/games', 'newvape/profiles', 'newvape/assets', 'newvape/libraries', 'newvape/guis', 'newvape/cache'} do
	if not isfolder(folder) then
		makefolder(folder)
	end
end

if not shared.VapeDeveloper then
	local _, subbed = pcall(function()
		return game:HttpGet('https://github.com/sstvskids/VapeV4ForRoblox')
	end)
	local commit = subbed:find('currentOid')
	commit = commit and subbed:sub(commit + 13, commit + 52) or nil
	commit = commit and #commit == 40 and commit or 'main'
	if commit == 'main' or (isfile('newvape/profiles/commit.txt') and readfile('newvape/profiles/commit.txt') or '') ~= commit then
		wipeFolder('newvape')
		wipeFolder('newvape/games')
		wipeFolder('newvape/guis')
		wipeFolder('newvape/libraries')
	end
	writefile('newvape/profiles/commit.txt', commit)
end

return loadstring(downloadFile('newvape/main.lua'), 'main')()