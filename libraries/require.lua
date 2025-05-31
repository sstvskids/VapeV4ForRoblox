-- og by the_vrillionaire on github
if getgenv().EXEC_REQUIRE_LOADED == true then getgenv().EXEC_REQUIRE_LOADED = false end

local execrequire = {} :: table
local modulecache = {} :: table
local rbxrequire = require

-- functions
local function ismodule(filepath: string): boolean
	local isLuaFile = isfile(filepath:gsub("%.", "\\")..".lua")
	local isLuauFile = isfile(filepath:gsub("%.", "\\")..".luau")
	return (isLuaFile or isLuauFile)
end

local function getModuleFileExtension(filepath): string?
	if isfile(filepath .. ".lua") then
		return ".lua"
	elseif isfile(filepath .. ".luau") then
		return ".luau"
	end
end

local function loadModule(filepath: string)
    local filepaths = firepath:split(".")
    local currentPath: string = '.'

    local requiredFile: any
    local err: string

    for i, path in next, filepaths do
        currentPath ..= path .. (i < #filepaths and "\\" or "")
        if ismodule(currentpath) then
            currentPath ..= getModuleFileExtension(currentPath)
            requiredFile, err = loadfile(currentpath)
            return requiredFile, err
        end
    end
end

-- init
execrequire.require = function(file: string | any): any
    local rbxrequired, res = pcall(rbxrequire, file)
    if rbxrequired then
        return res
    end

    if modulecache[file] then
        return modulecache[file]
    else
        local filepath
        local requiredfile = isfile(file)
        local isAModule = ismodule(file) or ismodule(file..'.init')
        if not requiredfile then
            error("Attempt to require an invalid file: '"..file.."'", 2)
        end
        if not isAModule then
            error("Attempt to require a non-module file: '"..file.."'", 2)
        end
        if not ismodule(filepath) and ismodule(filepath .. ".init") then
			filepath = filepath .. ".init"
		end

        local loadedModule, err = loadModule(file)
        if not loadedModule and err then
            error("Attempt to load a module file failed: '"..filepath.."'", 2)
        end

        local returns = loadedModule()
        modulecache[file] = returns
        return returns
    end
end

execrequire.unload = function()
    getgenv().require = rbxrequire
    getgenv().EXEC_REQUIRE_LOADED = nil
    modulecache = nil
    execrequire = nil
end

getgenv().require = execrequire.require
getgenv().EXEC_REQUIRE_LOADED = true

return execrequire