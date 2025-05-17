-- bridge duels (cheat engine!!)
local run = function(func) func() end
local cloneref = cloneref or function(obj) return obj end

local playersService = cloneref(game:GetService('Players'))
local inputService = cloneref(game:GetService('UserInputService'))
local replicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
local collectionService = cloneref(game:GetService('CollectionService'))
local runService = cloneref(game:GetService('RunService'))

local gameCamera = workspace.CurrentCamera
local lplr = playersService.LocalPlayer
local vape = shared.vape
local entitylib = vape.Libraries.entity
local targetinfo = vape.Libraries.targetinfo
local prediction = vape.Libraries.prediction

local bd = {}
local store = {
	blocks = {},
	serverBlocks = {}
}

local function getTool()
	return lplr.Character and lplr.Character:FindFirstChildWhichIsA('Tool', true) or nil
end

local function notif(...)
	return vape:CreateNotification(...)
end

local function parsePositions(v, func)
	if v:IsA('Part') then
		local start = -(v.Size / 2) + Vector3.new(1.5, 1.5, 1.5)
		for x = 0, v.Size.X - 1, 3 do
			for y = 0, v.Size.Y - 1, 3 do
				for z = 0, v.Size.Z - 1, 3 do
					local vec = start + Vector3.new(x, y, z)
					vec = v.CFrame:PointToWorldSpace(vec)
					vec = Vector3.new(math.round(vec.X), math.round(vec.Y), math.round(vec.Z))
					func(vec)
				end
			end
		end
	end
end

run(function()
    bd.GetRemote = function(name: RemoteEvent | RemoteFunction): RemoteEvent | RemoteFunction
        local remote
        for _,v in pairs(game:GetDescendants()) do
            if (v:IsA('RemoteEvent') or v:IsA('RemoteFunction')) and v.Name == name then
                remote = v
                break
            end
        end
        if name == nil then return Instance.new('RemoteEvent') end
        return remote
    end
    bd.Remotes = {
        AttackPlayer = bd.GetRemote('AttackPlayerWithSword'),
        PlaceBlock = bd.GetRemote('PlaceBlock'),
        BlockSword = bd.GetRemote('ToggleBlockSword'),
        Entity = require(replicatedStorage.Modules.Entity) or {
            added = bd.GetRemote('EntityAdded'),
            removed = bd.GetRemote('EntityRemoving'),
            changed = bd.GetRemote('EntityChanged'),
            toolchanged = bd.GetRemote('EntityToolChanged'),
            toolremoved = bd.GetRemote('EntityToolRemoved'),
            invchanged = bd.GetRemote('EntityInventoryChanged'),
        } -- not sure about this one
    }

    task.spawn(function()
		local map = workspace:WaitForChild('Map', 99999)
		if map and vape.Loaded ~= nil then
			vape:Clean(map.DescendantAdded:Connect(function(v)
				parsePositions(v, function(pos)
					store.blocks[pos] = v
				end)
			end))
			vape:Clean(map.DescendantRemoving:Connect(function(v)
				parsePositions(v, function(pos)
					if store.blocks[pos] == v then
						store.blocks[pos] = nil
						store.serverBlocks[pos] = nil
					end
				end)
			end))
			for _, v in map:GetDescendants() do
				parsePositions(v, function(pos)
					store.blocks[pos] = v
					store.serverBlocks[pos] = v
				end)
			end
		end
	end)

	vape:Clean(function()
		table.clear(store.blocks)
		table.clear(store)
	end)
end)

for _, v in {'Reach', 'SilentAim', 'Disabler', 'HitBoxes', 'MurderMystery', 'AutoRejoin'} do
	vape:Remove(v)
end

run(function()
	local oldstart = entitylib.start
	local function teamcheck(ent)
		local suc, res = pcall(function()
			if ent.Team or ent.Character.Humanoid.Team then
				return lplr.Team ~= (ent.Team or ent.Character.Humanoid.Team)
			end
		end)
		if suc then return res else return end
	end
	local function customEntity(ent)
		if not ent:HasTag('NPC') then return end
		if ent:IsDescendantOf(workspace) then
			if ent.Name:find("%[BOT%]") then
				ent.Name = ent.Name:gsub('<font.->', ''):gsub('</font>', ''):gsub('%[BOT%]%s*', '')
			end
			entitylib.addEntity(ent, nil, ent:HasTag('NPC') and function(self)
				return teamcheck(self)
			end)
		end
	end

	entitylib.start = function()
		oldstart()
		if entitylib.Running then
			for _, ent in collectionService:GetTagged('NPC') do
				customEntity(ent)
			end
			table.insert(entitylib.Connections, collectionService:GetInstanceAddedSignal('NPC'):Connect(customEntity))
			table.insert(entitylib.Connections, collectionService:GetInstanceRemovedSignal('NPC'):Connect(function(ent)
				entitylib.removeEntity(ent)
			end))
		end
	end
end)
entitylib.start()

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
	local Killaura
	local Targets
	local CPSToggle
	local CPS
	local AttackRange
	local SwingRange
	local AngleSlider
	local AutoBlock
	local Mouse
	local Swing
	local Max
	local BoxSwingColor
	local BoxAttackColor
	local ParticleTexture
	local ParticleColor1
	local ParticleColor2
	local ParticleSize
	local LegitAura
	local SortMode
	local Particles, Boxes, AttackDelay, SwingDelay, ClickDelay = {}, {}, tick(), tick(), tick()
	local lMouse = cloneref(lplr:GetMouse())
	
	local function getAttackData()
		if Mouse.Enabled then
			if not inputService:IsMouseButtonPressed(0) then return false end
		end
		if LegitAura.Enabled then
			if ClickDelay < tick() then return false end
		end
	
		return getTool()
	end
	
	Killaura = vape.Categories.Blatant:CreateModule({
		Name = 'Killaura',
		Function = function(callback)
			if callback then
				task.spawn(function()
					if LegitAura.Enabled then
						Killaura:Clean(inputService.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								ClickDelay = tick() + 0.1
							end
						end))
					end
					
					Killaura:Clean(runService.Stepped:Connect(function()
						local tool = getAttackData()
						local attacked = {}
						if tool and tool:HasTag('Sword') then
							local plrs = entitylib.AllPosition({
								Range = SwingRange.Value,
								Wallcheck = Targets.Walls.Enabled or nil,
								Part = 'RootPart',
								Players = Targets.Players.Enabled,
								NPCs = Targets.NPCs.Enabled,
								Limit = Max.Value
							})
		
							task.spawn(function()
								if #plrs > 0 then
									local selfpos = entitylib.character.RootPart.Position
									local localfacing = entitylib.character.RootPart.CFrame.LookVector * Vector3.new(1, 0, 1)

									task.spawn(function()
										if AutoBlock.Enabled and tool then
                                            bd.Remotes.BlockSword:FireServer(true, tool.Name)
											--bd.ToolService:ToggleBlockSword(true, tool.Name)
										end
									end)
			
									task.spawn(function()
										for _, v in plrs do
											local delta = ((v.RootPart.Position + v.Humanoid.MoveDirection) - selfpos)
											local angle = math.acos(localfacing:Dot((delta * Vector3.new(1, 0, 1)).Unit))
											if angle > (math.rad(AngleSlider.Value) / 2) then continue end
											table.insert(attacked, {
												Entity = v,
												Check = delta.Magnitude > AttackRange.Value and BoxSwingColor or BoxAttackColor
											})
											targetinfo.Targets[v] = tick() + 1
				
											if not Swing.Enabled and SwingDelay < tick() then
												SwingDelay = tick() + 0.25
												--entitylib.character.Humanoid.Animator:LoadAnimation(tool.Animations.Swing):Play()
				
												if vape.ThreadFix then
													setthreadidentity(2)
												end
                                                entitylib.character.Humanoid.Animator:LoadAnimation(tool.Animations.Swing):Play()
												--entitylib.character.Humanoid.Animator:PlayAnimation(tool.Animations.Swing)
												if vape.ThreadFix then
													setthreadidentity(8)
												end
											end
				
											if delta.Magnitude > AttackRange.Value then continue end
											if AttackDelay < tick() then
												AttackDelay = (CPSToggle.Enabled and tick() + (1 / CPS.GetRandomValue())) or 0
												--[[local bdent = bd.Entity.FindByCharacter(v.Character)
												if bdent then
													bd.Blink.item_action.attack_entity.fire({
														target_entity_id = bdent.Id,
														is_crit = entitylib.character.RootPart.AssemblyLinearVelocity.Y < 0,
														weapon_name = tool.Name,
														extra = {
															rizz = 'No.',
															sigma = 'The...',
															those = workspace.Name == 'Ok'
														}
													})
												end]]
												bd.Remotes.AttackPlayer:FireServer(v.Name, entitylib.character.RootPart.AssemblyLinearVelocity.Y < 0, tool.Name, '')
											end
										end
									end)
								elseif AutoBlock.Enabled then
                                    bd.Remotes.BlockSword:FireServer(false, tool.Name)
									--bd.ToolService:ToggleBlockSword(false, tool.Name)
								end
							end)
						end
		
						for i, v in Boxes do
							v.Adornee = attacked[i] and attacked[i].Entity.RootPart or nil
							if v.Adornee then
								v.Color3 = Color3.fromHSV(attacked[i].Check.Hue, attacked[i].Check.Sat, attacked[i].Check.Value)
								v.Transparency = 1 - attacked[i].Check.Opacity
							end
						end
		
						for i, v in Particles do
							v.Position = attacked[i] and attacked[i].Entity.RootPart.Position or Vector3.new(9e9, 9e9, 9e9)
							v.Parent = attacked[i] and gameCamera or nil
						end
		
						task.wait()
					end))
				end)
			else
				if AutoBlock.Enabled then
                    bd.Remotes.BlockSword:FireServer(false, tool.Name)
					--bd.ToolService:ToggleBlockSword(false, getAttackData().Name)
				end
				for _, v in Boxes do
					v.Adornee = nil
				end
				for _, v in Particles do
					v.Parent = nil
				end
			end
		end,
		Tooltip = 'Attack players around you\nwithout aiming at them.',
		ExtraText = function(call)
			repeat
				if Max.Value > 1 then return 'Mutliple' else return 'Single' end
			until not call
		end
	})
	Targets = Killaura:CreateTargets({Players = true})
	CPSToggle = Killaura:CreateToggle({
		Name = 'CPS Limit',
		Tooltip = 'Good for closet-cheaters',
		Function = function(callback)
			CPS.Object.Visible = callback
		end
	})
	CPS = Killaura:CreateTwoSlider({
		Name = 'Attacks per Second',
		Min = 1,
		Max = 20,
		DefaultMin = 12,
		DefaultMax = 12,
		Visible = false
	})
	SwingRange = Killaura:CreateSlider({
		Name = 'Swing range',
		Min = 1,
		Max = 16,
		Default = 16,
		Suffix = function(val)
			return val == 1 and 'stud' or 'studs'
		end
	})
	AttackRange = Killaura:CreateSlider({
		Name = 'Attack range',
		Min = 1,
		Max = 16,
		Default = 16,
		Suffix = function(val)
			return val == 1 and 'stud' or 'studs'
		end
	})
	AngleSlider = Killaura:CreateSlider({
		Name = 'Max angle',
		Min = 1,
		Max = 360,
		Default = 360
	})
	Max = Killaura:CreateSlider({
		Name = 'Max targets',
		Min = 1,
		Max = 10,
		Default = 10
	})
	AutoBlock = Killaura:CreateToggle({
		Name = 'AutoBlock',
		Tooltip = 'Automatically blocks for you'
	})
	Mouse = Killaura:CreateToggle({Name = 'Require mouse down'})
	Swing = Killaura:CreateToggle({Name = 'No Swing'})
	Killaura:CreateToggle({
		Name = 'Show target',
		Function = function(callback)
			BoxSwingColor.Object.Visible = callback
			BoxAttackColor.Object.Visible = callback
			if callback then
				for i = 1, 10 do
					local box = Instance.new('BoxHandleAdornment')
					box.Adornee = nil
					box.AlwaysOnTop = true
					box.Size = Vector3.new(3, 5, 3)
					box.CFrame = CFrame.new(0, -0.5, 0)
					box.ZIndex = 0
					box.Parent = vape.gui
					Boxes[i] = box
				end
			else
				for _, v in Boxes do
					v:Destroy()
				end
				table.clear(Boxes)
			end
		end
	})
	BoxSwingColor = Killaura:CreateColorSlider({
		Name = 'Target Color',
		Darker = true,
		DefaultHue = 0.6,
		DefaultOpacity = 0.5,
		Visible = false
	})
	BoxAttackColor = Killaura:CreateColorSlider({
		Name = 'Attack Color',
		Darker = true,
		DefaultOpacity = 0.5,
		Visible = false
	})
	Killaura:CreateToggle({
		Name = 'Target particles',
		Function = function(callback)
			ParticleTexture.Object.Visible = callback
			ParticleColor1.Object.Visible = callback
			ParticleColor2.Object.Visible = callback
			ParticleSize.Object.Visible = callback
			if callback then
				for i = 1, 10 do
					local part = Instance.new('Part')
					part.Size = Vector3.new(2, 4, 2)
					part.Anchored = true
					part.CanCollide = false
					part.Transparency = 1
					part.CanQuery = false
					part.Parent = Killaura.Enabled and gameCamera or nil
					local particles = Instance.new('ParticleEmitter')
					particles.Brightness = 1.5
					particles.Size = NumberSequence.new(ParticleSize.Value)
					particles.Shape = Enum.ParticleEmitterShape.Sphere
					particles.Texture = ParticleTexture.Value
					particles.Transparency = NumberSequence.new(0)
					particles.Lifetime = NumberRange.new(0.4)
					particles.Speed = NumberRange.new(16)
					particles.Rate = 128
					particles.Drag = 16
					particles.ShapePartial = 1
					particles.Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.fromHSV(ParticleColor1.Hue, ParticleColor1.Sat, ParticleColor1.Value)),
						ColorSequenceKeypoint.new(1, Color3.fromHSV(ParticleColor2.Hue, ParticleColor2.Sat, ParticleColor2.Value))
					})
					particles.Parent = part
					Particles[i] = part
				end
			else
				for _, v in Particles do
					v:Destroy()
				end
				table.clear(Particles)
			end
		end
	})
	ParticleTexture = Killaura:CreateTextBox({
		Name = 'Texture',
		Default = 'rbxassetid://14736249347',
		Function = function()
			for _, v in Particles do
				v.ParticleEmitter.Texture = ParticleTexture.Value
			end
		end,
		Darker = true,
		Visible = false
	})
	ParticleColor1 = Killaura:CreateColorSlider({
		Name = 'Color Begin',
		Function = function(hue, sat, val)
			for _, v in Particles do
				v.ParticleEmitter.Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.fromHSV(hue, sat, val)),
					ColorSequenceKeypoint.new(1, Color3.fromHSV(ParticleColor2.Hue, ParticleColor2.Sat, ParticleColor2.Value))
				})
			end
		end,
		Darker = true,
		Visible = false
	})
	ParticleColor2 = Killaura:CreateColorSlider({
		Name = 'Color End',
		Function = function(hue, sat, val)
			for _, v in Particles do
				v.ParticleEmitter.Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.fromHSV(ParticleColor1.Hue, ParticleColor1.Sat, ParticleColor1.Value)),
					ColorSequenceKeypoint.new(1, Color3.fromHSV(hue, sat, val))
				})
			end
		end,
		Darker = true,
		Visible = false
	})
	ParticleSize = Killaura:CreateSlider({
		Name = 'Size',
		Min = 0,
		Max = 1,
		Default = 0.14,
		Decimal = 100,
		Function = function(val)
			for _, v in Particles do
				v.ParticleEmitter.Size = NumberSequence.new(val)
			end
		end,
		Darker = true,
		Visible = false
	})
	LegitAura = Killaura:CreateToggle({
		Name = 'Swing only',
		Function = function()
			if Killaura.Enabled then
				Killaura:Toggle()
				Killaura:Toggle()
			end
		end,
		Tooltip = 'Only attacks while swinging manually'
	})
end)