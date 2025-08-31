--[[

    kool.aid --> Killstreak
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
local virtualinputService = cloneref(game:GetService('VirtualInputManager'))
local replicatedStorage = cloneref(game:GetService('ReplicatedStorage'))
local collectionService = cloneref(game:GetService('CollectionService'))
local runService = cloneref(game:GetService('RunService'))
local starterGui = cloneref(game:GetService('StarterGui'))

local gameCamera = workspace.CurrentCamera
local lplr = playersService.LocalPlayer
local vape = shared.vape
local entitylib = vape.Libraries.entity
local targetinfo = vape.Libraries.targetinfo
local prediction = vape.Libraries.prediction

local function notif(...)
	return vape:CreateNotification(...)
end

local ks = {}

run(function()
	ks = setmetatable({
		ItemData = require(replicatedStorage.ClientModules.ItemDatabase),
		getCoolDown = function()
			for _, v in ks.ItemData.GetKits(lplr)[lplr.GameStats.Kit.Value].Cooldowns do
				return tonumber(v)
			end
		end
	}, nil)
end)

for _, v in {'Reach', 'SilentAim', 'HitBoxes', 'MurderMystery', 'AutoRejoin', 'AutoClicker', 'ProfileInstaller'} do
	vape:Remove(v)
end

run(function()
    local Killaura
    local Mode
    local Max
    local AttackRange
    local SwingRange
    local AngleSlider
    local Targets
	local Swing
	local Face
	local SwordSwing = 'Right'
    local BoxSwingColor
    local BoxAttackColor
	local ParticleTexture
	local ParticleColor1
	local ParticleColor2
	local ParticleSize
    local Particles, Boxes, AttackDelay, SwingDelay = {}, {}, tick(), tick()

    Killaura = vape.Categories.Blatant:CreateModule({
        Name = 'Killaura',
        Function = function(callback)
            if callback then
                repeat
                    local attacked, args = {}, {}
                    local plrs = entitylib.AllPosition({
                        Range = SwingRange.Value,
                        Wallcheck = Targets.Walls.Enabled,
                        Part = 'RootPart',
                        Players = Targets.Players.Enabled,
                        NPCs = Targets.NPCs.Enabled,
                        Limit = Max.Value
                    })

                    if #plrs > 0 and entitylib.isAlive then
                        local selfpos = entitylib.character.RootPart.Position
						local localfacing = entitylib.character.RootPart.CFrame.LookVector * Vector3.new(1, 0, 1)

                        for _, v in plrs do
                            local delta = ((v.RootPart.Position + v.Humanoid.MoveDirection) - selfpos)
							local angle = math.acos(localfacing:Dot((delta * Vector3.new(1, 0, 1)).Unit))
							if angle > (math.rad(AngleSlider.Value) / 2) then continue end

							if lplr.SafeZone.Value == true or v.Player.SafeZone.Value == true then continue end
							if lplr.Blocking.Value == true then continue end

                            table.insert(attacked, {
                                Entity = v,
                                Check = delta.Magnitude > AttackRange.Value and BoxSwingColor or BoxAttackColor
                            })

							if Mode.Value == 'Remote' and not Swing.Enabled and SwingDelay < tick() then
								SwingDelay = tick() + 0.26

								if lplr.GameStats.Kit.Value == 'Berserk' or (lplr.GameStats.Kit.Value == 'Assasssin' or lplr.GameStats.Kit.Value == 'Frostwalker') then
									if SwordSwing == 'Right' then
										SwordSwing = "Left"
										entitylib.character.Humanoid:LoadAnimation(lplr.PlayerGui.MobileButtons.New.LocalInputHandling.LeftHitAnimation):Play(0, 1, 4)
									else
										SwordSwing = "Right"
										entitylib.character.Humanoid:LoadAnimation(lplr.PlayerGui.MobileButtons.New.LocalInputHandling.RightHitAnimation):Play(0, 1, 4)
									end
								else
									entitylib.character.Humanoid:LoadAnimation(lplr.PlayerGui.MobileButtons.New.LocalInputHandling.RightHitAnimation):Play(0, 1, 2.5)
								end

								lplr.PlayerGui.MobileButtons.New.LocalInputHandling.Swing:Play()
							end

							targetinfo.Targets[v] = tick() + 1

							if Face.Enabled then
                            	local vec = v.RootPart.Position * Vector3.new(1, 0, 1)
                            	entitylib.character.RootPart.CFrame = CFrame.lookAt(entitylib.character.RootPart.Position, Vector3.new(vec.X, entitylib.character.RootPart.Position.Y + 0.001, vec.Z))
							end

                            if delta.Magnitude > AttackRange.Value then continue end
							if AttackDelay < tick() then
								if Mode.Value == 'Mouse' then
									AttackDelay = tick() + 0.11
									virtualinputService:SendMouseButtonEvent(gameCamera.ViewportSize.X / 2, gameCamera.ViewportSize.Y / 2, 0, true, game, 0)
									virtualinputService:SendMouseButtonEvent(gameCamera.ViewportSize.X / 2, gameCamera.ViewportSize.Y / 2, 0, false, game, 0)
								elseif Mode.Value == 'Remote' then
									if args[v.Player.Name] then continue end

									args[v.Player.Name] = {
										Victim = v.Player,
										Vector = Vector3.new(0, 0, -1)
									}
								end
							end
                        end

						if AttackDelay < tick() and Mode.Value == 'Remote' then
							AttackDelay = tick() + 0.18
							if next(args) then
								replicatedStorage.Remotes.Hit:FireServer(args)
								args = {}
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
        ExtraText = function()
            return Mode.Value
        end,
        Tooltip = 'Attack players around you\nwithout aiming at them.'
    })
    Targets = Killaura:CreateTargets({Players = true})
    Mode = Killaura:CreateDropdown({
		Name = 'Mode',
		List = {'Mouse', 'Remote'},
        Function = function()
            vape:UpdateTextGUI()
        end,
        Tooltip = 'Mouse - Simulates a mouse click\nRemote - Sends a RemoteEvent to the server'
	})
    SwingRange = Killaura:CreateSlider({
		Name = 'Swing range',
		Min = 1,
		Max = 10,
		Default = 10,
		Suffix = function(val)
			return val == 1 and 'stud' or 'studs'
		end
	})
    AttackRange = Killaura:CreateSlider({
		Name = 'Attack range',
		Min = 1,
		Max = 10,
		Default = 10,
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
    local AntiFall
    local voiditems = {}

    AntiFall = vape.Categories.Blatant:CreateModule({
        Name = 'AntiFall',
        Function = function(callback)
            if callback then
                for i,v in workspace.Interactives:GetDescendants() do
                    if string.find(v.Name, 'Water') then
                        local platform = Instance.new('Part')
                        platform.Size = Vector3.new(v.Size.X, 1, v.Size.Z)
                        platform.CFrame = v.CFrame + Vector3.new(0, v.Size.Y/2 + 2, 0) 
                        platform.Anchored = true
                        platform.CanCollide = true
                        platform.Parent = workspace
                        platform.Transparency = 1

                        table.insert(voiditems, platform)
                    end
                end
            else
                for i,v in voiditems do
                    v:Destroy()
                end
            end
        end
    })
end)

run(function()
    local AutoKit
	local Toggles = {}

	local AutoKitFunctions = {
		Tank = function()
			repeat
				if entitylib.isAlive and lplr.UnlockedKits[lplr.GameStats.Kit.Value].Level.Value >= 5 then
					if entitylib.character.Humanoid.Health <= 30 and lplr.Blocking.Value == false then
						lplr.Blocking.Value = true
					end

					if entitylib.character.Humanoid.Health >= 50 and lplr.Blocking.Value == true then
						lplr.Blocking.Value = false
					end
				end

				task.wait()
			until not AutoKit.Enabled
		end,
		Healer = function()
			repeat
				if lplr.UnlockedKits[lplr.GameStats.Kit.Value].Level.Value >= 10 then
					if entitylib.character.Humanoid.Health <= 30 then
						replicatedStorage.Remotes.AbilityRemotes.HealRemote:FireServer()

						lplr.PlayerGui.MobileButtons.New.RightSide.Buttons1[ks.ItemData.GetKitAbilities().Heal['UI']].Visible = false
						task.wait(ks.getCoolDown())
						lplr.PlayerGui.MobileButtons.New.RightSide.Buttons1[ks.ItemData.GetKitAbilities().Heal['UI']].Visible = true
					end
				end

				task.wait()
			until not AutoKit.Enabled
		end,
		Runner = function()
			repeat
				if lplr.UnlockedKits[lplr.GameStats.Kit.Value].Level.Value >= 10 then
					local plr = entitylib.EntityPosition({
						Range = 6,
						Part = 'RootPart',
						Players = true
					})

					if plr and entitylib.isAlive and plr.Player.SafeZone.Value == false then
						replicatedStorage.Remotes.AbilityRemotes.TeleportAbility:FireServer()

						lplr.PlayerGui.MobileButtons.New.RightSide.Buttons1[ks.ItemData.GetKitAbilities().Teleport['UI']].Visible = false
						task.wait(ks.getCoolDown())
						lplr.PlayerGui.MobileButtons.New.RightSide.Buttons1[ks.ItemData.GetKitAbilities().Teleport['UI']].Visible = true
					end
				end
				task.wait()
			until not AutoKit.Enabled
		end
	}

	AutoKit = vape.Categories.Utility:CreateModule({
		Name = 'AutoKit',
		Function = function(callback)
			if callback then
				repeat task.wait() until lplr.GameStats.Kit.Value ~= 'Basic' and lplr.SafeZone.Value == false or (not AutoKit.Enabled)

				if AutoKit.Enabled and AutoKitFunctions[lplr.GameStats.Kit.Value] and Toggles[lplr.GameStats.Kit.Value].Enabled then
					AutoKitFunctions[lplr.GameStats.Kit.Value]()
				end
			end
		end,
		ExtraText = function()
			return lplr.GameStats.Kit.Value
		end,
		Tooltip = 'Automatically uses kit abilities.'
	})
	local sortTable = {}
	for i in AutoKitFunctions do
		table.insert(sortTable, i)
	end
	table.sort(sortTable, function(a, b)
		return a < b
	end)
	for _, v in sortTable do
		Toggles[v] = AutoKit:CreateToggle({
			Name = v,
			Default = true
		})
	end

	vape:Clean(lplr.GameStats.Kit:GetPropertyChangedSignal('Value'):Connect(function()
		vape:UpdateTextGUI()
	end))
end)

notif('Vape', 'Good things come to those who wait :)', 10)