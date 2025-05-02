-- cheat-engine version (autokit: NEVER!!!)
local run = function(func)
	pcall(func)
end
local cloneref = cloneref or function(obj)
	return obj
end
local vapeEvents = setmetatable({}, {
	__index = function(self, index)
		self[index] = Instance.new('BindableEvent')
		return self[index]
	end
})

local playersService = cloneref(game:GetService('Players'))
local replicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
local runService = cloneref(game:GetService('RunService'))
local inputService = cloneref(game:GetService('UserInputService'))
local tweenService = cloneref(game:GetService('TweenService'))
local httpService = cloneref(game:GetService('HttpService'))
local textChatService = cloneref(game:GetService('TextChatService'))
local collectionService = cloneref(game:GetService('CollectionService'))
local contextActionService = cloneref(game:GetService('ContextActionService'))
local coreGui = cloneref(game:GetService('CoreGui'))
local starterGui = cloneref(game:GetService('StarterGui'))
local stats = cloneref(game:GetService('Stats'))

local isnetworkowner = identifyexecutor and table.find({'AWP', 'Nihon'}, ({identifyexecutor()})[1]) and isnetworkowner or function()
	return true
end
local gameCamera = workspace.CurrentCamera
local lplr = playersService.LocalPlayer
local assetfunction = getcustomasset

local vape = shared.vape
local entitylib = vape.Libraries.entity
local targetinfo = vape.Libraries.targetinfo
local sessioninfo = vape.Libraries.sessioninfo
local uipallet = vape.Libraries.uipallet
local tween = vape.Libraries.tween
local color = vape.Libraries.color
local whitelist = vape.Libraries.whitelist
local koolwl = vape.Libraries.koolwl
local prediction = vape.Libraries.prediction
local getfontsize = vape.Libraries.getfontsize
local getcustomasset = vape.Libraries.getcustomasset

local store = {
	attackReach = 0,
	attackReachUpdate = tick(),
	damageBlockFail = tick(),
	hand = {},
	inventory = {
		inventory = {
			items = {},
			armor = {}
		},
		hotbar = {}
	},
	inventories = {},
	matchState = 0,
	queueType = 'bedwars_test',
	tools = {}
}

local Reach = {}
local HitBoxes = {}
local TrapDisabler
local AntiFallPart
local bedwars, sides, bedwars.client, oldinvrender = {}, {}, {}
local remotes = {
	ProjectileRemote = 'ProjectileFire',
    EquipItemRemote = 'SetInvItem',
    DamageBlockRemote = 'DamageBlock',
    ReportRemote = 'ReportPlayer',
    PickupRemote = 'PickupItemDrop',
    CannonAimRemote = 'AimCannon',
    CannonLaunchRemote = 'LaunchSelfFromCannon',
    AttackRemote = 'SwordHit',
    GuitarHealRemote = 'PlayGuitar',
	EatRemote = 'ConsumeItem',
	SpawnRavenRemote = 'SpawnRaven',
	MageRemote = 'LearnElementTome',
	DragonRemote = 'RequestDragonPunch',
	ConsumeSoulRemote = 'ConsumeGrimReaperSoul',
	TreeRemote = 'ConsumeTreeOrb',
	PickupMetalRemote = 'CollectCollectableEntity',
	BatteryRemote = 'ConsumeBattery'
}
koolwl:check()

bedwars.GetRemote = function(name: string)
    if name:IsA('RemoteEvent') or name:IsA('RemoteFunction') then return name end
	if name == nil then return Instance.new('RemoteEvent') end
end

run(function()
	local remoteNames: table = {}
	for i,v in pairs(remotes) do
		remoteName[i] = bedwars.GetRemote(v)
	end
end)

return lplr:Kick('solara support: NOT FINISHED!!, sub to @stavexploitz for updates')