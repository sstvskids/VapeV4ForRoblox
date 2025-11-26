--[[
    kool.aid --> BedwarZ
    by @stav and @sus
    
    Forever will, forever always undetected
]]

local run = function(func)
    func()
end
local cloneref = cloneref or function(obj)
    return obj
end

local playersService = cloneref(game:GetService('Players'))
local starterPlayer = cloneref(game:GetService('StarterPlayer'))
local inputService = cloneref(game:GetService('UserInputService'))
local replicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
local collectionService = cloneref(game:GetService('CollectionService'))
local runService = cloneref(game:GetService('RunService'))
local starterGui = cloneref(game:GetService('StarterGui'))
local textChatService = cloneref(game:GetService('TextChatService'))

local gameCamera = workspace.CurrentCamera
local lplr = playersService.LocalPlayer
local vape = shared.vape
local entitylib = vape.Libraries.entity
local targetinfo = vape.Libraries.targetinfo
local sessioninfo = vape.Libraries.sessioninfo
local whitelist = vape.Libraries.whitelist
local koolwl = vape.Libraries.koolwl

local function notif(...)
	return vape:CreateNotification(...)
end

local store = {
    items = {
        ['Swords'] = {
            [1] = 'Wooden Sword',
            [2] = 'Stone Sword',
            [3] = 'Iron Sword',
            [4] = 'Diamond Sword',
            [5] = 'Emerald Sword'
        },
        ['Pickaxes'] = {
            [1] = 'Wooden Pickaxe',
            [2] = 'Stone Pickaxe',
            [3] = 'Iron Pickaxe',
            [4] = 'Diamond Pickaxe'
        },
        ['Blocks'] = {
            [1] = 'Blastproof Ceramic',
            [2] = 'Blue Wool',
            [3] = 'Brown Wool',
            [4] = 'Green Wool',
            [5] = 'Obsidian',
            [6] = 'Orange Wool',
            [7] = 'Pink Wool',
            [8] = 'Purple Wool',
            [9] = 'Red Wool',
            [10] = 'Stone Brick',
            [11] = 'Wood Plank',
            [12] = 'Wool',
            [13] = 'Yellow Wool',
			[14] = 'Fake Block'
        }
    }
}

-- very sloppy functions but they work

local AutoTool = {}

local function hasTool(v)
    return lplr.Backpack and lplr.Backpack:FindFirstChild(v)
end

local function getTool(tool: string): string?
	return workspace.PlayersContainer:FindFirstChild(lplr.Name):FindFirstChild(tool)
	--return lplr.Character and lplr.Character:FindFirstChildWhichIsA('Tool', true) or nil
end

local function getItem(type, returnval)
    local tog = {}
    if not returnval then
        error('No return value')
    end

    for i, v in ipairs(store.items[type]) do
        local tool = getTool(v)
        if entitylib.isAlive then
            if returnval == 'tog' and tool then
                return true
            elseif returnval == 'table' and (hasTool(v) or tool) then
                tog[i] = v
            end
        end
    end

    if returnval == 'tog' then
        return false
    end

    return tog
end

local function isFriend(plr, recolor)
	if vape.Categories.Friends.Options['Use friends'].Enabled then
		local friend = table.find(vape.Categories.Friends.ListEnabled, plr.Name) and true
		if recolor then
			friend = friend and vape.Categories.Friends.Options['Recolor visuals'].Enabled
		end
		return friend
	end
	return nil
end

run(function()
	entitylib.targetCheck = function(ent)
		if ent.TeamCheck then
			return ent:TeamCheck()
		end
		if ent.NPC then return true end
		if isFriend(ent.Player) then return false end
		if not (select(2, whitelist:get(ent.Player)) or select(2, koolwl:get(ent.Player.UserId))) then return false end
        if not ent.Player:GetAttribute('PVP') or not lplr:GetAttribute('PVP') then return false end

        if vape.Categories.Main.Options['Teams by server'].Enabled then
			if not lplr.Team then return true end
			if not ent.Player.Team then return true end
			if (ent.Player.Team.Name and lplr.Team.Name) == 'Spectators' then return true end
			if ent.Player.Team ~= lplr.Team then return true end
			return #ent.Player.Team:GetPlayers() == #playersService:GetPlayers()
		end

		return false
	end
end)

entitylib.start()

for _, v in {'Reach', 'SilentAim', 'Disabler', 'HitBoxes', 'MurderMystery', 'AutoRejoin', 'AutoClicker'} do
	vape:Remove(v)
end

run(function()
	local Kills = sessioninfo:AddItem('Kills')
	local Beds = sessioninfo:AddItem('Beds')
	local Wins = sessioninfo:AddItem('Wins')

	vape:Clean(replicatedStorage.Remotes.KillLog.OnClientEvent:Connect(function(killer, killed)
		if killer == lplr.Name and killed ~= lplr.Name then
			Kills:Increment()
		end
	end))

	vape:Clean(lplr.Stats['Total Beds Broken']:GetPropertyChangedSignal('Value'):Connect(function()
		Beds:Increment()
	end))

	vape:Clean(lplr.Stats.Wins:GetPropertyChangedSignal('Value'):Connect(function()
        Wins:Increment()
	end))
end)

local Killaura
run(function()
    local Max
    local AttackRange
    local SwingRange
    local AngleSlider
    local Targets
	local Swing
	local Face
    local ItemAliveCheck
    local BoxSwingColor
    local BoxAttackColor
	local ParticleTexture
	local ParticleColor1
	local ParticleColor2
	local ParticleSize
    local Particles, Boxes, AttackDelay, SwingDelay = {}, {}, tick(), tick()
	local Anim

    Killaura = vape.Categories.Blatant:CreateModule({
        Name = 'Killaura',
        Function = function(callback)
            if callback then
				Anim = Instance.new('Animation')
                Anim.AnimationId = 'rbxassetid://123800159244236'

                repeat
                    local attacked = {}

                    local plrs = entitylib.AllPosition({
                        Range = SwingRange.Value,
                        Wallcheck = Targets.Walls.Enabled or nil,
                        Part = 'RootPart',
                        Players = Targets.Players.Enabled,
                        NPCs = Targets.NPCs.Enabled,
                        Limit = Max.Value
                    })

                    if #plrs > 0 then
                        local selfpos = entitylib.character.RootPart.Position
						local localfacing = entitylib.character.RootPart.CFrame.LookVector * Vector3.new(1, 0, 1)

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
								SwingDelay = tick() + 0.35
								entitylib.character.Humanoid.Animator:LoadAnimation(Anim):Stop()
                                entitylib.character.Humanoid.Animator:LoadAnimation(Anim):Play()
							end

                            if Face.Enabled then
                                local vec = v.RootPart.Position * Vector3.new(1, 0, 1)
                                entitylib.character.RootPart.CFrame = CFrame.lookAt(entitylib.character.RootPart.Position, Vector3.new(vec.X, entitylib.character.RootPart.Position.Y + 0.001, vec.Z))
                            end

							for _, i in getItem('Swords', 'table') do
								if AttackDelay < tick() then
									AttackDelay = tick() + 0.35

									if ItemAliveCheck.Enabled and getItem('Swords', 'tog') == false then continue end
									replicatedStorage.Remotes.ItemsRemotes.SwordHit:FireServer(v.Character, i)
								end
							end
                        end
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
                for _, v in Boxes do
					v.Adornee = nil
				end

				for _, v in Particles do
					v.Parent = nil
				end
            end
        end,
        Tooltip = 'Attack players around you\nwithout aiming at them.'
    })
    Targets = Killaura:CreateTargets({Players = true})
    SwingRange = Killaura:CreateSlider({
		Name = 'Swing range',
		Min = 1,
		Max = 18,
		Default = 18,
		Suffix = function(val)
			return val == 1 and 'stud' or 'studs'
		end
	})
    AttackRange = Killaura:CreateSlider({
		Name = 'Attack range',
		Min = 1,
		Max = 18,
		Default = 18,
		Suffix = function(val)
			return val == 1 and 'stud' or 'studs'
		end
	})
	Max = Killaura:CreateSlider({
		Name = 'Max targets',
		Min = 1,
		Max = 10,
		Default = 10
	})
    AngleSlider = Killaura:CreateSlider({
		Name = 'Max angle',
		Min = 1,
		Max = 360,
		Default = 360
	})
	Face = Killaura:CreateToggle({Name = 'Face target'})
	Swing = Killaura:CreateToggle({Name = 'No Swing'})
    ItemAliveCheck = Killaura:CreateToggle({Name = 'Item/Alive Check'})
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
end)

run(function()
	local NoFall
	local Mode
	local rayParams = RaycastParams.new()
	
	NoFall = vape.Categories.Blatant:CreateModule({
		Name = 'NoFall',
		Function = function(callback)
			if callback then
				local tracked = 0
				if Mode.Value == 'Gravity' then
					local extraGravity = 0
					NoFall:Clean(runService.PreSimulation:Connect(function(dt)
						if entitylib.isAlive then
							local root = entitylib.character.RootPart
							if root.AssemblyLinearVelocity.Y < -85 then
								rayParams.FilterDescendantsInstances = {lplr.Character, gameCamera}
								rayParams.CollisionGroup = root.CollisionGroup
	
								local rootSize = root.Size.Y / 2 + entitylib.character.HipHeight
								local ray = workspace:Blockcast(root.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, (tracked * 0.1) - rootSize, 0), rayParams)
								if not ray then
									root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, -86, root.AssemblyLinearVelocity.Z)
									root.CFrame += Vector3.new(0, extraGravity * dt, 0)
									extraGravity += -workspace.Gravity * dt
								end
							else
								extraGravity = 0
							end
						end
					end))
				else
					repeat
						if entitylib.isAlive then
							local root = entitylib.character.RootPart
							tracked = entitylib.character.Humanoid.FloorMaterial == Enum.Material.Air and math.min(tracked, root.AssemblyLinearVelocity.Y) or 0
	
							if tracked < -85 then
								if Mode.Value == 'Teleport' then
									rayParams.FilterDescendantsInstances = {lplr.Character, gameCamera}
									rayParams.CollisionGroup = root.CollisionGroup
	
									local rootSize = root.Size.Y / 2 + entitylib.character.HipHeight
									if Mode.Value == 'Teleport' then
										local ray = workspace:Blockcast(root.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, -1000, 0), rayParams)
										if ray then
											root.CFrame -= Vector3.new(0, root.Position.Y - (ray.Position.Y + rootSize), 0)
										end
									else
										local ray = workspace:Blockcast(root.CFrame, Vector3.new(3, 3, 3), Vector3.new(0, (tracked * 0.1) - rootSize, 0), rayParams)
										if ray then
											tracked = 0
											root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, -80, root.AssemblyLinearVelocity.Z)
										end
									end
								end
							end
						end
	
						task.wait(0.03)
					until not NoFall.Enabled
				end
			end
		end,
		Tooltip = 'Prevents taking fall damage.'
	})
	Mode = NoFall:CreateDropdown({
		Name = 'Mode',
		List = {'Teleport', 'Bounce', 'Gravity'},
		Function = function()
			if NoFall.Enabled then
				NoFall:Toggle()
				NoFall:Toggle()
			end
		end
	})
end)

run(function()
	local TPAura
	local Targets
	local Range
	local AngleSlider

	TPAura = vape.Categories.Blatant:CreateModule({
		Name = 'TPAura',
		Function = function(callback)
			if callback then
				--notif('Vape', 'module works best with killaura thx', 8)
				repeat
					local plrs = entitylib.AllPosition({
                        Range = Range.Value,
                        Wallcheck = Targets.Walls.Enabled,
                        Part = 'RootPart',
                        Players = Targets.Players.Enabled,
                        NPCs = Targets.NPCs.Enabled,
                        Limit = 1
                    })

                    if #plrs > 0 and entitylib.isAlive then
                        local selfpos = entitylib.character.RootPart.Position
						local localfacing = entitylib.character.RootPart.CFrame.LookVector * Vector3.new(1, 0, 1)

                        for _, v in plrs do
                            local delta = ((v.RootPart.Position + v.Humanoid.MoveDirection) - selfpos)
							local angle = math.acos(localfacing:Dot((delta * Vector3.new(1, 0, 1)).Unit))
							if angle > (math.rad(AngleSlider.Value) / 2) then continue end

							if not Killaura.Enabled then continue end

							targetinfo.Targets[v] = tick() + 1

							entitylib.character.RootPart.CFrame = v.RootPart.CFrame + Vector3.new(0, math.random(6, 8), 0)
						end
					end
				
					task.wait()
				until not TPAura.Enabled
			end
		end,
		Tooltip = 'Automatically teleports to the player closest to you'
	})
	Targets = TPAura:CreateTargets({Players = true})
    Range = TPAura:CreateSlider({
		Name = 'Range',
		Min = 1,
		Max = 32,
		Default = 32,
		Suffix = function(val)
			return val == 1 and 'stud' or 'studs'
		end
	})
    AngleSlider = TPAura:CreateSlider({
		Name = 'Max angle',
		Min = 1,
		Max = 360,
		Default = 360
	})
end)

run(function()
    local Scaffold
	local Expand
	local Tower
	local Downwards
	local Diagonal
	local lastpos = Vector3.zero
	
	local function roundPos(vec)
		return Vector3.new(math.round(vec.X / 3) * 3, math.round(vec.Y / 3) * 3, math.round(vec.Z / 3) * 3)
	end

    Scaffold = vape.Categories.Utility:CreateModule({
        Name = 'Scaffold',
        Function = function(callback)
            if callback then
                Scaffold:Clean(runService.Stepped:Connect(function()
                    if entitylib.isAlive then
                        task.spawn(function()
                            for _, v in getItem('Blocks', 'table') do
								local root = entitylib.character.RootPart
								if Tower.Enabled and inputService:IsKeyDown(Enum.KeyCode.Space) and (not inputService:GetFocusedTextBox()) then
									root.Velocity = Vector3.new(root.Velocity.X, 28, root.Velocity.Z)
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

									lastpos = currentpos

									if not getItem('Blocks', 'tog') then continue end
									local fakeblock = replicatedStorage.Blocks[v]:Clone()
									fakeblock.Name = v
									fakeblock.Position = currentpos
									fakeblock.Parent = string.find(v, 'Wool') and workspace.PlayersBlocksContainer.Wool or workspace.PlayersBlocksContainer[v]
											
									replicatedStorage.Remotes.ItemsRemotes.PlaceBlock:FireServer(v, 1, currentpos)

									task.delay(0.3, function()
										fakeblock:Destroy()
										fakeblock = nil
									end)
								end
							end
                        end)
                    end
                    
                    task.wait()
				end))
            end
        end
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
end)

run(function()
	local PickupRange
	local Range
	local Lower

	PickupRange = vape.Categories.Utility:CreateModule({
		Name = 'PickupRange',
		Function = function(callback)
			if callback then
				repeat
					if entitylib.isAlive then
						local localPosition = entitylib.character.RootPart.Position
						for _, v in workspace.DroppedItemsContainer:GetChildren() do
							if (localPosition - v.PrimaryPart.Position).Magnitude <= Range.Value then
								if Lower.Enabled and (localPosition.Y - v.Position.Y) < (entitylib.character.HipHeight - 1) then continue end
								if entitylib.character.Humanoid.Health > 0 then 
									v.PrimaryPart.CFrame = CFrame.new(localPosition - Vector3.new(0, 3, 0)) 
								end
							end
						end
					end

					task.wait()
				until not PickupRange.Enabled
			end
		end
	})
	Range = PickupRange:CreateSlider({
		Name = 'Range',
		Min = 1,
		Max = 6,
		Default = 6,
		Suffix = function(val) 
			return val == 1 and 'stud' or 'studs' 
		end
	})
	Lower = PickupRange:CreateToggle({Name = 'Feet Check'})
end)

run(function()
	local Velocity

	Velocity = vape.Categories.Combat:CreateModule({
		Name = 'Velocity',
		Function = function(callback)
			if callback then
				for i,v in replicatedStorage.Modules.VelocityUtils:GetChildren() do
					v:Destroy()
				end

				Velocity:Clean(replicatedStorage.Modules.VelocityUtils.ChildAdded:Connect(function(obj)
					obj:Destroy()
				end))
			end
		end,
		Tooltip = 'Prevents knockback\nCredits to @springs67 (Autumn Client) owner for method'
	})
end)

run(function()
	local AutoToxic
	local GG
	local Toggles, Lists, said = {}, {}, {}
	local cancel = false

	local function sendMessage(name, obj, default)
		local tab = Lists[name].ListEnabled
		local custommsg = #tab > 0 and tab[math.random(1, #tab)] or default
		if not custommsg then return end
		if #tab > 1 and custommsg == said[name] then
			repeat 
				task.wait() 
				custommsg = tab[math.random(1, #tab)] 
			until custommsg ~= said[name]
		end
		said[name] = custommsg
	
		custommsg = custommsg and custommsg:gsub('<obj>', obj or '') or ''
		if textChatService.ChatVersion == Enum.ChatVersion.TextChatService then
			textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync(custommsg)
		else
			replicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(custommsg, 'All')
		end
	end

	AutoToxic = vape.Categories.Utility:CreateModule({
		Name = 'AutoToxic',
		Function = function(callback)
			if callback then
				AutoToxic:Clean(replicatedStorage.Remotes.KillLog.OnClientEvent:Connect(function(killer, killed)
					if (killer == lplr.Name and killed ~= lplr.Name) and Toggles.Kill.Enabled then
						sendMessage('Kill', killed, 'kool.aid solos <obj>')
					elseif (killer ~= lplr.Name and killed == lplr.Name) and Toggles.Death.Enabled then
						sendMessage('Death', killer, 'kool.aid ALWAYS comes back stronger <obj>')
					end
				end))

				AutoToxic:Clean(lplr.Stats['Total Beds Broken']:GetPropertyChangedSignal('Value'):Connect(function()
					if Toggles.Bed.Enabled then
						sendMessage('Bed', nil, 'nice bed broo')
					end
				end))

				AutoToxic:Clean(replicatedStorage.Remotes.GameRemotes.OnWinningTeam.OnClientEvent:Connect(function(table)
					if cancel == false then return end
					cancel = true
					
					if GG.Enabled then
						if textChatService.ChatVersion == Enum.ChatVersion.TextChatService then
							textChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync('gg')
						else
							replicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer('gg', 'All')
						end
					end

					if tostring(lplr.Team) == tostring(table.WinningTeam) and Toggles.Win.Enabled then
						sendMessage('Win', nil, 'yall garbage')
					end

					cancel = false
				end))
			end
		end,
		Tooltip = 'Says a message after a certain action'
	})
	GG = AutoToxic:CreateToggle({
		Name = 'AutoGG',
		Default = true
	})
	for _, v in {'Kill', 'Death', 'Bed', 'Win'} do
		Toggles[v] = AutoToxic:CreateToggle({
			Name = v..' ',
			Function = function(callback)
				if Lists[v] then
					Lists[v].Object.Visible = callback
				end
			end
		})
		Lists[v] = AutoToxic:CreateTextList({
			Name = v,
			Darker = true,
			Visible = false
		})
	end
end)

notif('Vape', 'let the kool.aid begin', 5)
