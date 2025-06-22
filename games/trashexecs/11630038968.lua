-- bridge duels (cheat engine!!)
local run = function(func) pcall(func) end
local cloneref = cloneref or function(obj) return obj end

local playersService = cloneref(game:GetService('Players'))
local inputService = cloneref(game:GetService('UserInputService'))
local replicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
local collectionService = cloneref(game:GetService('CollectionService'))
local httpService = cloneref(game:GetService('HttpService'))
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
		task.spawn(function()
			for _, v in pairs(game:GetDescendants()) do
				if (v:IsA('RemoteEvent') or v:IsA('RemoteFunction')) and v.Name == name then
					remote = v
					break
				end
			end
		end)
        if name == nil then return Instance.new('RemoteEvent') end
        return remote
    end
    bd.Remotes = {
        AttackPlayer = bd.GetRemote('AttackPlayerWithSword'),
		BlockSword = bd.GetRemote('ToggleBlockSword'),
		EnterQueue = bd.GetRemote('EnterQueue'),
        PlaceBlock = bd.GetRemote('PlaceBlock')
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

run(function()
	local oldstart = entitylib.start
	local function teamcheck(ent)
		local suc, res = pcall(function()
			if ent.Team or ent.Character.Humanoid.Team then
				return lplr.Team ~= (ent.Team or ent.Character.Humanoid.Team)
			end
		end)
		return (suc and res) or true
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
for _, v in {'Reach', 'SilentAim', 'Disabler', 'HitBoxes', 'MurderMystery', 'AutoRejoin'} do
	vape:Remove(v)
end

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
	local Reach
	local path = replicatedStorage.Constants.Melee.Reach
	local Value
	
	Reach = vape.Categories.Combat:CreateModule({
		Name = 'Reach',
		Function = function(callback)
			if callback then
				vape:Clean(path:GetPropertyChangedSignal('Value'):Connect(function()
					path.Value = Value.Value
				end))
				path.Value = Value.Value
			else
				path.Value = 9
			end
		end,
		Tooltip = 'Extends tool attack reach'
	})
	Value = Reach:CreateSlider({
		Name = 'Range',
		Min = 0,
		Max = 18,
		Default = 18,
		Decimal = 10,
		Suffix = function(val) 
			return val == 1 and 'stud' or 'studs' 
		end
	})
end)

local Criticals
run(function()
	Criticals = vape.Categories.Blatant:CreateModule({
		Name = 'Criticals',
		Tooltip = 'Always hit criticals'
	})
end)

run(function()
	vape.Categories.Combat:CreateModule({
		Name = 'Velocity',
		Function = function(callback)
			if callback then
				pcall(function()
					local old = replicatedStorage.Modules.Knit.Services.CombatService.RE.KnockBackApplied
					old:Destroy()
				end)
			else
				notif('Vape', 'Velocity will be disabled next game.', 7)
			end
		end,
		Tooltip = 'Reduces knockback taken'
	})
end)

run(function()
	local NoFall
	NoFall = vape.Categories.Blatant:CreateModule({
		Name = 'NoFall',
		Function = function(callback)
			if callback then
				repeat task.wait()
					if entitylib.character.Humanoid.FloorMaterial == Enum.Material.Air and (entitylib.character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall or entitylib.character.Humanoid:GetState() == Enum.HumanoidStateType.FallingDown) then
						entitylib.character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					end
				until not NoFall.Enabled
			end
		end,
		Tooltip = 'Prevents taking fall damage.'
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
	local BoxSwingColor
	local BoxAttackColor
	local ParticleTexture
	local ParticleColor1
	local ParticleColor2
	local ParticleSize
	local LegitAura
	local Max
	local Particles, Boxes, AttackDelay, SwingDelay, ClickDelay = {}, {}, tick(), tick(), tick()
	
	local function getAttackData()
		if Mouse.Enabled then
			if not inputService:IsMouseButtonPressed(0) then return false end
		end
		if LegitAura.Enabled then
			if ClickDelay < tick() then return false end
		end
	
		return getTool()
	end

	local function blockSword(bool: boolean, sword: string)
		task.spawn(function()
			return bd.Remotes.BlockSword:InvokeServer(bool, sword)
		end)
	end
	
	Killaura = vape.Categories.Blatant:CreateModule({
		Name = 'Killaura',
		Function = function(callback)
			if callback then
				if LegitAura and LegitAura.Enabled then
					Killaura:Clean(inputService.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							ClickDelay = tick() + 0.1
						end
					end))
				end
					
				repeat
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

								if AutoBlock.Enabled and tool then
									blockSword(true, tool.Name)
								end
			
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
			
										if not Swing.Enabled and SwingDelay < tick() and (tool and tool:HasTag('Sword')) then
											SwingDelay = tick() + 0.25
											lplr.Character.Humanoid.Animator:LoadAnimation(getTool().Animations.Swing):Play()
										end
				
										if delta.Magnitude > AttackRange.Value then continue end
										if AttackDelay < tick() then
											AttackDelay = (CPSToggle.Enabled and tick() + (1 / CPS.GetRandomValue())) or 0
											task.spawn(function()
												bd.Remotes.AttackPlayer:InvokeServer(v.Character, (Criticals.Enabled and true) or entitylib.character.RootPart.AssemblyLinearVelocity.Y < 0, tool.Name)
											end)
										end
									end
								end)
							elseif AutoBlock.Enabled then
								blockSword(false, tool.Name)
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
				until not Killaura.Enabled
			else
				if AutoBlock.Enabled then
					blockSword(false, getTool().Name)
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
		ExtraText = function()
			return 'Single'
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

run(function()
	local Scaffold
	local Expand
	local Tower
	local Downwards
	local Diagonal
	local LimitItem
	local adjacent, lastpos = {}, Vector3.zero
	
	for x = -3, 3, 3 do
		for y = -3, 3, 3 do
			for z = -3, 3, 3 do
				local vec = Vector3.new(x, y, z)
				if vec.Y ~= 0 and (vec.X ~= 0 or vec.Z ~= 0) then
					continue
				end
	
				if vec ~= Vector3.zero then
					table.insert(adjacent, vec)
				end
			end
		end
	end
	
	local function getBlocksInPoints(s, e)
		local list = {}
		for x = s.X, e.X, 3 do
			for y = s.Y, e.Y, 3 do
				for z = s.Z, e.Z, 3 do
					local vec = Vector3.new(x, y, z)
					if store.blocks[vec] then
						table.insert(list, vec)
					end
				end
			end
		end
		return list
	end
	
	local function roundPos(vec)
		return Vector3.new(math.round(vec.X / 3) * 3, math.round(vec.Y / 3) * 3, math.round(vec.Z / 3) * 3)
	end
	
	local function nearCorner(poscheck, pos)
		local startpos = poscheck - Vector3.new(3, 3, 3)
		local endpos = poscheck + Vector3.new(3, 3, 3)
		local check = poscheck + (pos - poscheck).Unit * 100
		if math.abs(check.Y - startpos.Y) > 3 then
			return Vector3.new(poscheck.X, math.clamp(check.Y, startpos.Y, endpos.Y), poscheck.Z)
		end
		return Vector3.new(math.clamp(check.X, startpos.X, endpos.X), math.clamp(check.Y, startpos.Y, endpos.Y), math.clamp(check.Z, startpos.Z, endpos.Z))
	end
	
	local function blockProximity(pos)
		local mag, returned = 60
		local tab = getBlocksInPoints(pos - Vector3.new(21, 21, 21), pos + Vector3.new(21, 21, 21))
		for _, v in tab do
			local blockpos = nearCorner(v, pos)
			local newmag = (pos - blockpos).Magnitude
			if newmag < mag then
				mag, returned = newmag, blockpos
			end
		end
		table.clear(tab)
		return returned
	end
	
	local function checkAdjacent(pos)
		for _, v in adjacent do
			if store.blocks[pos + v] then return true end
		end
		return false
	end
	
	local function getBlock()
		local tool = getTool()
		if tool and tool:HasTag('Blocks') then
			local btype = tool.Name == 'Blocks' and 'Clay' or tool.Name:sub(1, -6)
			return btype, btype == 'Clay' and 'Blocks' or ("%*Block"):format(btype)
		end
	
		if LimitItem.Enabled then return end
		for _, tool in lplr.Backpack:GetChildren() do
			if tool:IsA('Tool') and tool:HasTag('Blocks') then
				local btype = tool.Name == 'Blocks' and 'Clay' or tool.Name:sub(1, -6)
				return btype, btype == 'Clay' and 'Blocks' or ("%*Block"):format(btype)
			end
		end
	end
	
	Scaffold = vape.Categories.Utility:CreateModule({
		Name = 'Scaffold',
		Function = function(callback)
			if callback then
				Scaffold:Clean(runService.Stepped:Connect(function()
					if entitylib.isAlive then
						local btype, bname = getBlock()
	
						if btype then
							local root = entitylib.character.RootPart
							if Tower.Enabled and inputService:IsKeyDown(Enum.KeyCode.Space) and (not inputService:GetFocusedTextBox()) then
								root.Velocity = Vector3.new(root.Velocity.X, 38, root.Velocity.Z)
							end
	
							for i = Expand.Value, 1, -1 do
								local currentpos = roundPos(root.Position - Vector3.new(0, entitylib.character.HipHeight + (Downwards.Enabled and inputService:IsKeyDown(Enum.KeyCode.LeftShift) and 4.5 or 1.5), 0) + entitylib.character.Humanoid.MoveDirection * (i * 3))
								if Diagonal.Enabled then
									if math.abs(math.round(math.deg(math.atan2(-entitylib.character.Humanoid.MoveDirection.X, -entitylib.character.Humanoid.MoveDirection.Z)) / 45) * 45) % 90 == 45 then
										local dt = (lastpos - currentpos)
										if ((dt.X == 0 and dt.Z ~= 0) or (dt.X ~= 0 and dt.Z == 0)) and ((lastpos - root.Position) * Vector3.new(1, 0, 1)).Magnitude < 2.5 then
											currentpos = lastpos
										end
									end
								end

								pcall(function()
									local block = store.blocks[currentpos]
									if not block then
										blockpos = checkAdjacent(currentpos) and currentpos or blockProximity(currentpos)
										if blockpos then
											local fake = replicatedStorage.Assets.Blocks[btype]:Clone()
											fake.Name = 'TempBlock'
											fake.Position = blockpos
											fake:AddTag('TempBlock')
											fake:AddTag('Block')
											fake.Parent = workspace.Map
											--bd.EffectsController:PlaySound(blockpos)
											bd.Entity.LocalEntity:RemoveTool(bname, 1)
		
											task.spawn(function()
												local suc, block = bd.Remotes.PlaceBlock:InvokeServer({
													position = blockpos,
													block_type = btype,
													extra = {
														rizz = 'No.',
														sigma = 'The...',
														those = workspace.Name == 'Ok'
													}
												})
												fake:Destroy()
												if not (suc or block) then
													bd.Entity.LocalEntity:AddTool(bname, 1)
												end
											end)
										end
									end
								end)
								lastpos = currentpos
							end
						end
					end
					task.wait()
				end))
			end
		end,
		Tooltip = 'Helps you make bridges/scaffold walk.'
	})
	Expand = Scaffold:CreateSlider({
		Name = 'Expand',
		Min = 1,
		Max = 6
	})
	Tower = Scaffold:CreateToggle({
		Name = 'Tower',
		Default = true
	})
	Downwards = Scaffold:CreateToggle({
		Name = 'Downwards',
		Default = true
	})
	Diagonal = Scaffold:CreateToggle({
		Name = 'Diagonal',
		Default = true
	})
	LimitItem = Scaffold:CreateToggle({Name = 'Limit to items'})
end)

run(function()
	local AutoPlay
	local path = replicatedStorage.Modules.ServerData.Cache
	local jsonPath = httpService:JSONDecode(path.Value)
	AutoPlay = vape.Categories.Utility:CreateModule({
		Name = 'AutoPlay',
		Function = function(callback)
			if callback then
				repeat
					if jsonPath.Submode == 'Playground' then return end

					if lplr.PlayerGui.Hotbar.MainFrame.GameEndFrame.Visible == true and lplr.PlayerGui.Hotbar.MainFrame.MatchmakingFrame.Visible == false then
						bd.Remotes.EnterQueue:InvokeServer(jsonPath.Submode)
					end
					task.wait()
				until not AutoPlay.Enabled
			end
		end,
		Tooltip = 'Automatically queues after the match ends.'
	})
end)