if getgenv().EXEC_REQUIRE_LOADED == true then return end

-- og by the_vrillionaire on gitbub
local execrequire = {} :: table
local modulecache = {} :: table
local rbxrequire = require

-- functions
local function ismodule(filepath: string): boolean
    local isluaFile = select(1, filepath:find('.lua')) ~= nil
    local isluauFile = select(1, filepath:find('.luau')) ~= nil
    return isfile(filepath) and (isluaFile or isluauFile)
end

local function loadFile(filepath: string)
    local filepaths = firepath:split("\\")
    local currentPath: string = '.'

    local requiredFile: any
    local err: string

    for i, path in next, filepaths do
        currentpath ..="\\"..path
        if ismodule(currentpath) then
            requiredFile, err = loadfile(currentpath)
            return requiredFile, err
        end
    end
end

execrequire.require = function(file: string | any): any
    local rbxrequired, res = pcall(rbxrequire, file)
    if rbxrequired then
        return res
    end

    if modulecache[file] then
        return modulecache[file]
    else
        local requiredfile = isfile(file)
        local isAModule = ismodule(file)
        if not requiredfile then
            error("Attempt to require an invalid file: '"..file.."'", 2)
        end
        if not isAModule then
            error("Attempt to require a non-module file: '"..file.."'", 2)
        end

        local loadedModule, err = loadFile(file)
        if not loadedModule and err then
            error("Attempt to load a module file failed: '"..file.."'", 2)
        end

        local returns = loadedModule()
        modulecache[file] = returns
        return returns
    end
end

-- init
getgenv().require = execrequire.require
getgenv().EXEC_REQUIRE_LOADED = true

return execrequire