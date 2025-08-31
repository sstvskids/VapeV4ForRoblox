--// nucleus.rip dumper used :)

return {
	["GetKillEffects"] = function(_)
		local v1 = {
			["Blessing"] = {
				["Name"] = "Blessing",
				["Rarity"] = "Common",
				["UniqueID"] = "BlessingParticle",
				["UnlockType"] = "Crate"
			},
			["Electro"] = {
				["Name"] = "Electro",
				["Rarity"] = "Common",
				["UniqueID"] = "ElectroParticle"
			},
			["UnlockType"] = "Crate",
			["Fire"] = {
				["Name"] = "Fire",
				["Rarity"] = "Common",
				["UniqueID"] = "FireParticle",
				["UnlockType"] = "Crate"
			},
			["Pulse"] = {
				["Name"] = "Pulse",
				["Rarity"] = "Common",
				["UniqueID"] = "PulseParticle",
				["UnlockType"] = "Crate"
			},
			["Water"] = {
				["Name"] = "Water",
				["Rarity"] = "Common",
				["UniqueID"] = "WaterParticle",
				["UnlockType"] = "Crate"
			},
			["Whirl"] = {
				["Name"] = "Whirl",
				["Rarity"] = "Common",
				["UniqueID"] = "WhirlParticle",
				["UnlockType"] = "Crate"
			},
			["Aura"] = {
				["Name"] = "Aura",
				["Rarity"] = "Rare",
				["UniqueID"] = "AuraParticle",
				["UnlockType"] = "Crate"
			},
			["Blue Eye"] = {
				["Name"] = "Blue Eye",
				["Rarity"] = "Rare",
				["UniqueID"] = "Blue EyeParticle",
				["UnlockType"] = "Crate"
			},
			["Fusion"] = {
				["Name"] = "Fusion",
				["Rarity"] = "Rare",
				["UniqueID"] = "FusionParticle",
				["UnlockType"] = "Crate"
			},
			["Red Eye"] = {
				["Name"] = "Red Eye",
				["Rarity"] = "Rare",
				["UniqueID"] = "Red EyeParticle",
				["UnlockType"] = "Crate"
			},
			["Star"] = {
				["Name"] = "Star",
				["Rarity"] = "Rare",
				["UniqueID"] = "StarParticle",
				["UnlockType"] = "Crate"
			},
			["Octon"] = {
				["Name"] = "Octon",
				["Rarity"] = "Rare",
				["UniqueID"] = "OctonParticle",
				["UnlockType"] = "Crate"
			},
			["Ascend"] = {
				["Name"] = "Ascend",
				["Rarity"] = "Epic",
				["UniqueID"] = "AscendParticle",
				["UnlockType"] = "Crate"
			},
			["Bluespark"] = {
				["Name"] = "Bluespark",
				["Rarity"] = "Epic",
				["UniqueID"] = "BluesparkParticle",
				["UnlockType"] = "Crate"
			},
			["Greenspark"] = {
				["Name"] = "Greenspark",
				["Rarity"] = "Epic",
				["UniqueID"] = "GreensparkParticle",
				["UnlockType"] = "Crate"
			},
			["Power"] = {
				["Name"] = "Power",
				["Rarity"] = "Epic",
				["UniqueID"] = "PowerParticle",
				["UnlockType"] = "Crate"
			},
			["Redspark"] = {
				["Name"] = "Redspark",
				["Rarity"] = "Epic",
				["UniqueID"] = "RedsparkParticle",
				["UnlockType"] = "Crate"
			},
			["Bluehole"] = {
				["Name"] = "Blue Hole",
				["Rarity"] = "Legendary",
				["UniqueID"] = "BlueholeParticle",
				["UnlockType"] = "Crate"
			},
			["Orangehole"] = {
				["Name"] = "Orange Hole",
				["Rarity"] = "Legendary",
				["UniqueID"] = "OrangeholeParticle",
				["UnlockType"] = "Crate"
			},
			["Purplehole"] = {
				["Name"] = "Purple Hole",
				["Rarity"] = "Legendary",
				["UniqueID"] = "PurpleholeParticle",
				["UnlockType"] = "Crate"
			},
			["Redhole"] = {
				["Name"] = "Red Hole",
				["Rarity"] = "Legendary",
				["UniqueID"] = "RedholeParticle",
				["UnlockType"] = "Crate"
			},
			["Hollow Purple"] = {
				["Name"] = "Hollow Purple",
				["Rarity"] = "Mythic",
				["UniqueID"] = "Hollow PurpleParticle",
				["UnlockType"] = "Crate"
			},
			["Milky Way"] = {
				["Name"] = "Milky Way",
				["Rarity"] = "Mythic",
				["UniqueID"] = "Milky WayParticle",
				["UnlockType"] = "Crate"
			},
			["Galactic Fusion"] = {
				["Name"] = "FUSION",
				["Rarity"] = "Secret",
				["UniqueID"] = "Galactic FusionParticle",
				["UnlockType"] = "Crate"
			},
			["Fart"] = {
				["Name"] = "Fart",
				["Rarity"] = "Epic",
				["UniqueID"] = "FartParticle",
				["UnlockType"] = "Reward"
			},
			["Splash"] = {
				["Name"] = "Splash",
				["Rarity"] = "Epic",
				["UniqueID"] = "SplashParticle",
				["UnlockType"] = "Reward"
			},
			["Glitch"] = {
				["Name"] = "Glitch",
				["Rarity"] = "Mythic",
				["UniqueID"] = "GlitchParticle",
				["UnlockType"] = "Reward"
			},
			["Ghost"] = {
				["Name"] = "Ghost",
				["Rarity"] = "Rare",
				["UniqueID"] = "GhostParticle",
				["UnlockType"] = "Reward"
			},
			["Poison"] = {
				["Name"] = "Poison",
				["Rarity"] = "Epic",
				["UniqueID"] = "PoisonParticle",
				["UnlockType"] = "Reward"
			},
			["Pumpkin"] = {
				["Name"] = "Pumpkin",
				["Rarity"] = "Mythic",
				["UniqueID"] = "PumpkinParticle2",
				["UnlockType"] = "Reward"
			},
			["Flora"] = {
				["Name"] = "Flora",
				["Rarity"] = "Rare",
				["UniqueID"] = "FloraParticle",
				["UnlockType"] = "Reward"
			},
			["Music"] = {
				["Name"] = "Music",
				["Rarity"] = "Epic",
				["UniqueID"] = "MusicParticle",
				["UnlockType"] = "Reward"
			},
			["Lightning"] = {
				["Name"] = "Lightning",
				["Rarity"] = "Legendary",
				["UniqueID"] = "LightningParticle",
				["UnlockType"] = "Reward"
			},
			["Hades"] = {
				["Name"] = "Hades Fire",
				["Rarity"] = "Mythic",
				["UniqueID"] = "HadesParticle",
				["UnlockType"] = "Reward"
			},
			["Snowflakes"] = {
				["Name"] = "Snowflakes",
				["Rarity"] = "Rare",
				["UniqueID"] = "SnowflakesParticle",
				["UnlockType"] = "Reward"
			},
			["SparkleStars"] = {
				["Name"] = "Stars",
				["Rarity"] = "Epic",
				["UniqueID"] = "SparkleStarsarticle",
				["UnlockType"] = "Reward"
			},
			["CandyCanes"] = {
				["Name"] = "Candy Canes",
				["Rarity"] = "Legendary",
				["UniqueID"] = "CandyCanesParticle",
				["UnlockType"] = "Reward"
			},
			["Snowman"] = {
				["Name"] = "Snowman",
				["Rarity"] = "Mythic",
				["UniqueID"] = "SnowmanParticle2",
				["UnlockType"] = "Reward"
			},
			["Sparkles"] = {
				["Name"] = "Sparkles",
				["Rarity"] = "Rare",
				["UniqueID"] = "SparklesParticle",
				["UnlockType"] = "Reward"
			},
			["Roses"] = {
				["Name"] = "Roses",
				["Rarity"] = "Epic",
				["UniqueID"] = "RosesParticle",
				["UnlockType"] = "Reward"
			},
			["Hearts"] = {
				["Name"] = "Hearts",
				["Rarity"] = "Legendary",
				["UniqueID"] = "HeartsParticle",
				["UnlockType"] = "Reward"
			},
			["Love"] = {
				["Name"] = "LOVE",
				["Rarity"] = "Mythic",
				["UniqueID"] = "LoveParticle",
				["UnlockType"] = "Reward"
			},
			["Treasure"] = {
				["Name"] = "Treasure",
				["Rarity"] = "Rare",
				["UniqueID"] = "TreasureParticle",
				["UnlockType"] = "Reward"
			}
		}
		return v1
	end,
	["GetTitles"] = function(_)
		local v2 = {}
		local v3 = {
			["Rarity"] = "Mythic",
			["UniqueID"] = "MasterTitle2",
			["Properties"] = {
				["Text"] = "MASTER",
				["TextColor"] = Color3.new(1, 0.584314, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.3
			}
		}
		v2.Master = v3
		local v4 = {
			["Rarity"] = "Mythic",
			["UniqueID"] = "SigmaTitle2",
			["Properties"] = {
				["Text"] = "SIGMA",
				["TextColor"] = Color3.new(1, 0, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Sigma = v4
		local v5 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "AscendedTitle",
			["Properties"] = {
				["Text"] = "ASCENDED",
				["TextColor"] = Color3.new(0.666667, 0.333333, 1),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.ASCENDED = v5
		local v6 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "PopularTitle",
			["Properties"] = {
				["Text"] = "Popular",
				["TextColor"] = Color3.new(0, 0.333333, 1),
				["FontFace"] = Enum.Font.Oswald,
				["Italic"] = true,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Popular = v6
		local v7 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "GodTitle",
			["Properties"] = {
				["Text"] = "GOD",
				["TextColor"] = Color3.new(1, 1, 1),
				["FontFace"] = Enum.Font.LuckiestGuy,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.GOD = v7
		local v8 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "ProTitle",
			["Properties"] = {
				["Text"] = "PRO",
				["TextColor"] = Color3.new(1, 0.717647, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.PRO = v8
		local v9 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "VIPTitle",
			["Properties"] = {
				["Text"] = "**VIP**",
				["TextColor"] = Color3.new(1, 0.835294, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = true,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.2
			}
		}
		v2.VIP = v9
		local v10 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "RebornTitle",
			["Properties"] = {
				["Text"] = "REBORN",
				["TextColor"] = Color3.new(1, 0, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.2
			}
		}
		v2.Reborn = v10
		local v11 = {
			["Rarity"] = "Mythic",
			["UniqueID"] = "EmperorTitle",
			["Properties"] = {
				["Text"] = "EMPEROR",
				["TextColor"] = Color3.new(0.647059, 0.215686, 1),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.2
			}
		}
		v2.Emperor = v11
		local v12 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "SpookyTitle",
			["Properties"] = {
				["Text"] = "Spooky",
				["TextColor"] = Color3.new(0, 0.670588, 0.0431373),
				["FontFace"] = Enum.Font.Creepster,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Spooky = v12
		local v13 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "CursedTitle",
			["Properties"] = {
				["Text"] = "CURSED",
				["TextColor"] = Color3.new(0.580392, 0, 0),
				["FontFace"] = Enum.Font.Creepster,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Cursed = v13
		local v14 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "EternalTitle",
			["Properties"] = {
				["Text"] = "ETERNAL",
				["TextColor"] = Color3.new(0.254902, 0.14902, 0.854902),
				["FontFace"] = Enum.Font.Creepster,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Eternal = v14
		local v15 = {
			["Rarity"] = "Mythic",
			["UniqueID"] = "PumpkinKingTitle2",
			["Properties"] = {
				["Text"] = "PUMPKIN KING",
				["TextColor"] = Color3.new(1, 0.25098, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.5
			}
		}
		v2.PumpkinKing = v15
		local v16 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "ElfTitle",
			["Properties"] = {
				["Text"] = "Elf",
				["TextColor"] = Color3.new(0.266667, 0.796078, 0.0392157),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Elf = v16
		local v17 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "HollyTitle",
			["Properties"] = {
				["Text"] = "Holly",
				["TextColor"] = Color3.new(0.968627, 0.615686, 1),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Holly = v17
		local v18 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "StarTitle",
			["Properties"] = {
				["Text"] = "-Star-",
				["TextColor"] = Color3.new(1, 0.917647, 0),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Star = v18
		local v19 = {
			["Rarity"] = "Mythic",
			["UniqueID"] = "BossSantaTitle2",
			["Properties"] = {
				["Text"] = "BOSS SANTA",
				["TextColor"] = Color3.new(1, 0.0627451, 0.282353),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.75
			}
		}
		v2["BOSS SANTA"] = v19
		local v20 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "MoggerTitle",
			["Properties"] = {
				["Text"] = "Mogger",
				["TextColor"] = Color3.new(1, 0.262745, 0.643137),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Mogger = v20
		local v21 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "CuteTitle",
			["Properties"] = {
				["Text"] = "Cute",
				["TextColor"] = Color3.new(1, 0.560784, 0.976471),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Cute = v21
		local v22 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "AmorTitle",
			["Properties"] = {
				["Text"] = "Amor",
				["TextColor"] = Color3.new(0.647059, 0.0823529, 1),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Amor = v22
		local v23 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "RedFlagTitle",
			["Properties"] = {
				["Text"] = "Red Flag",
				["TextColor"] = Color3.new(1, 0.117647, 0.117647),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2["Red Flag"] = v23
		local v24 = {
			["Rarity"] = "Mythic",
			["UniqueID"] = "HeartbreakerTitle2",
			["Properties"] = {
				["Text"] = "HEART BREAKER",
				["TextColor"] = Color3.new(1, 0, 0.94902),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.75
			}
		}
		v2.HEARTBREAKER = v24
		local v25 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "MoggerTitle",
			["Properties"] = {
				["Text"] = "Rizzard",
				["TextColor"] = Color3.new(0.45098, 0.462745, 0.341176),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Rizzard = v25
		local v26 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "ZeusTitle",
			["Properties"] = {
				["Text"] = "Zeus",
				["TextColor"] = Color3.new(0.803922, 0.87451, 0.14902),
				["FontFace"] = Enum.Font.GrenzeGotisch,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Zeus = v26
		local v27 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "EliteTitle",
			["Properties"] = {
				["Text"] = "E.L.I.T.E",
				["TextColor"] = Color3.new(1, 0, 0.14902),
				["FontFace"] = Enum.Font.GrenzeGotisch,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Elite = v27
		local v28 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "ParagonTitle",
			["Properties"] = {
				["Text"] = "PARAGON",
				["TextColor"] = Color3.new(0, 1, 0.498039),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.PARAGON = v28
		local v29 = {
			["Rarity"] = "Mythic",
			["UniqueID"] = "EternalOverlordTitle",
			["Properties"] = {
				["Text"] = "Eternal Overlord",
				["TextColor"] = Color3.new(1, 0, 0),
				["FontFace"] = Enum.Font.GrenzeGotisch,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.75
			}
		}
		v2.EternalOverlord = v29
		local v30 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "BasicTitle",
			["Properties"] = {
				["Text"] = "Gigachad",
				["TextColor"] = Color3.new(0.815686, 0.815686, 0.815686),
				["FontFace"] = Enum.Font.GothamBold,
				["Italic"] = true,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Basic = v30
		local v31 = {
			["Rarity"] = "Common",
			["UniqueID"] = "Basic2Title",
			["Properties"] = {
				["Text"] = "Grinder",
				["TextColor"] = Color3.new(0.815686, 0.815686, 0.815686),
				["FontFace"] = Enum.Font.GothamBold,
				["Italic"] = true,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Basic2 = v31
		local v32 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "Basic3Title",
			["Properties"] = {
				["Text"] = "TooEz",
				["TextColor"] = Color3.new(1, 1, 1),
				["FontFace"] = Enum.Font.GothamBold,
				["Italic"] = true,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Basic3 = v32
		local v33 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "TankTitle",
			["Properties"] = {
				["Text"] = "TheROCK",
				["TextColor"] = Color3.new(0.301961, 0.301961, 0.301961),
				["FontFace"] = Enum.Font.BuilderSansMedium,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Tank = v33
		local v34 = {
			["Rarity"] = "Common",
			["UniqueID"] = "Tank2Title",
			["Properties"] = {
				["Text"] = "Turtle",
				["TextColor"] = Color3.new(0.160784, 0.301961, 0.0313725),
				["FontFace"] = Enum.Font.BuilderSansMedium,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Tank2 = v34
		local v35 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "Tank3Title",
			["Properties"] = {
				["Text"] = "Titan",
				["TextColor"] = Color3.new(0.0862745, 0.47451, 0.415686),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Tank3 = v35
		local v36 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "RunnerTitle",
			["Properties"] = {
				["Text"] = "Usain",
				["TextColor"] = Color3.new(0.815686, 0.74902, 0),
				["FontFace"] = Enum.Font.Bangers,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Runner = v36
		local v37 = {
			["Rarity"] = "Common",
			["UniqueID"] = "Runner2Title",
			["Properties"] = {
				["Text"] = "Cheetah",
				["TextColor"] = Color3.new(0.815686, 0.47451, 0),
				["FontFace"] = Enum.Font.Bangers,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Runner2 = v37
		local v38 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "Runner3Title",
			["Properties"] = {
				["Text"] = "SPEED",
				["TextColor"] = Color3.new(0, 1, 1),
				["FontFace"] = Enum.Font.Bangers,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Runner3 = v38
		local v39 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "HealerTitle",
			["Properties"] = {
				["Text"] = "Healthy",
				["TextColor"] = Color3.new(0, 1, 0.498039),
				["FontFace"] = Enum.Font.Bangers,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Healer = v39
		local v40 = {
			["Rarity"] = "Common",
			["UniqueID"] = "Healer2Title",
			["Properties"] = {
				["Text"] = "VEGAN",
				["TextColor"] = Color3.new(0.0117647, 0.603922, 1),
				["FontFace"] = Enum.Font.Bangers,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Healer2 = v40
		local v41 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "Healer3Title",
			["Properties"] = {
				["Text"] = "Druid",
				["TextColor"] = Color3.new(0, 1, 0.498039),
				["FontFace"] = Enum.Font.Bangers,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Healer3 = v41
		local v42 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "LuckyTitle",
			["Properties"] = {
				["Text"] = "Gambler",
				["TextColor"] = Color3.new(0.666667, 0, 1),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = true,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Lucky = v42
		local v43 = {
			["Rarity"] = "Common",
			["UniqueID"] = "Lucky2Title",
			["Properties"] = {
				["Text"] = "RNG",
				["TextColor"] = Color3.new(1, 0.0784314, 0.0941176),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = true,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Lucky2 = v43
		local v44 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "Lucky3Title",
			["Properties"] = {
				["Text"] = "Risky",
				["TextColor"] = Color3.new(0.870588, 0.0666667, 0.0941176),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = true,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Lucky3 = v44
		local v45 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "BerserkTitle",
			["Properties"] = {
				["Text"] = "BEAST",
				["TextColor"] = Color3.new(0, 0, 1),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Berserk = v45
		local v46 = {
			["Rarity"] = "Common",
			["UniqueID"] = "Berserk2Title",
			["Properties"] = {
				["Text"] = "Monster",
				["TextColor"] = Color3.new(0.729412, 1, 0.223529),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Berserk2 = v46
		local v47 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "Berserk3Title",
			["Properties"] = {
				["Text"] = "BARBARIAN",
				["TextColor"] = Color3.new(1, 0, 0),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Berserk3 = v47
		local v48 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "ScoutTitle",
			["Properties"] = {
				["Text"] = "CAMPER",
				["TextColor"] = Color3.new(1, 0.333333, 0),
				["FontFace"] = Enum.Font.Cartoon,
				["Italic"] = true,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Scout = v48
		local v49 = {
			["Rarity"] = "Common",
			["UniqueID"] = "Scout2Title",
			["Properties"] = {
				["Text"] = "BOINK",
				["TextColor"] = Color3.new(1, 0.858824, 0.858824),
				["FontFace"] = Enum.Font.Cartoon,
				["Italic"] = true,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Scout2 = v49
		local v50 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "Scout3Title",
			["Properties"] = {
				["Text"] = "OOF",
				["TextColor"] = Color3.new(0.47451, 0.101961, 1),
				["FontFace"] = Enum.Font.Cartoon,
				["Italic"] = true,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Scout3 = v50
		local v51 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "BoltTitle",
			["Properties"] = {
				["Text"] = "eLeCtRiCiTy",
				["TextColor"] = Color3.new(0, 1, 1),
				["FontFace"] = Enum.Font.Cartoon,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Bolt = v51
		local v52 = {
			["Rarity"] = "Common",
			["UniqueID"] = "Bolt2Title",
			["Properties"] = {
				["Text"] = "VOLT",
				["TextColor"] = Color3.new(0.384314, 0.937255, 1),
				["FontFace"] = Enum.Font.Cartoon,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Bolt2 = v52
		local v53 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "Bolt3Title",
			["Properties"] = {
				["Text"] = "T.E.S.L.A",
				["TextColor"] = Color3.new(0.737255, 0.972549, 1),
				["FontFace"] = Enum.Font.Cartoon,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Bolt3 = v53
		local v54 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "ValkyrieTitle",
			["Properties"] = {
				["Text"] = "ANGEL",
				["TextColor"] = Color3.new(1, 1, 1),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Valkyrie = v54
		local v55 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "Valkyrie2Title",
			["Properties"] = {
				["Text"] = "TORNADO",
				["TextColor"] = Color3.new(0.713725, 0.713725, 0.713725),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Valkyrie2 = v55
		local v56 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "Valkyrie3Title",
			["Properties"] = {
				["Text"] = "BLESSED",
				["TextColor"] = Color3.new(1, 1, 1),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Valkyrie3 = v56
		local v57 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "ChampionTitle",
			["Properties"] = {
				["Text"] = "ROYAL",
				["TextColor"] = Color3.new(1, 0.666667, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Champion = v57
		local v58 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "Chamion2Title",
			["Properties"] = {
				["Text"] = "Knight",
				["TextColor"] = Color3.new(0.713725, 0.713725, 0.713725),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Champion2 = v58
		local v59 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "Champion3Title",
			["Properties"] = {
				["Text"] = "GOLIATH",
				["TextColor"] = Color3.new(0.333333, 0.666667, 1),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Champion3 = v59
		local v60 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "SpearmanTitle",
			["Properties"] = {
				["Text"] = "SLICER",
				["TextColor"] = Color3.new(0, 0.815686, 0.270588),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Spearman = v60
		local v61 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "Spearman2Title",
			["Properties"] = {
				["Text"] = "REACH",
				["TextColor"] = Color3.new(0.368627, 0, 0.815686),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Spearman2 = v61
		local v62 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "Spearman3Title",
			["Properties"] = {
				["Text"] = "KNIGHT",
				["TextColor"] = Color3.new(0.321569, 1, 0.423529),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Spearman3 = v62
		local v63 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "InfernoTitle",
			["Properties"] = {
				["Text"] = "DRAGON",
				["TextColor"] = Color3.new(0.815686, 0.054902, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Inferno = v63
		local v64 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "Inferno2Title",
			["Properties"] = {
				["Text"] = "FIRE",
				["TextColor"] = Color3.new(0.815686, 0.203922, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Inferno2 = v64
		local v65 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "Inferno3Title",
			["Properties"] = {
				["Text"] = "HOT",
				["TextColor"] = Color3.new(1, 0, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Inferno3 = v65
		local v66 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "AssassinTitle",
			["Properties"] = {
				["Text"] = "NINJA",
				["TextColor"] = Color3.new(0, 0, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(1, 1, 1),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Assassin = v66
		local v67 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "Assassin2Title",
			["Properties"] = {
				["Text"] = "Shadow",
				["TextColor"] = Color3.new(0, 0, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(1, 1, 1),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Assassin2 = v67
		local v68 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "Assassin3Title",
			["Properties"] = {
				["Text"] = "DARKNESS",
				["TextColor"] = Color3.new(0, 0, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(1, 1, 1),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Assassin3 = v68
		local v69 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "FrostwalkerTitle",
			["Properties"] = {
				["Text"] = "P2W",
				["TextColor"] = Color3.new(0.552941, 0.384314, 0.235294),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Frostwalker = v69
		local v70 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "Frostwalker2Title",
			["Properties"] = {
				["Text"] = "ICY",
				["TextColor"] = Color3.new(0.584314, 0.956863, 1),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Frostwalker2 = v70
		local v71 = {
			["Rarity"] = "Mythic",
			["UniqueID"] = "Frostwalker3Title",
			["Properties"] = {
				["Text"] = "FREEZE",
				["TextColor"] = Color3.new(0.756863, 1, 0.972549),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Frostwalker3 = v71
		local v72 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "BoomTitle",
			["Properties"] = {
				["Text"] = "TNT",
				["TextColor"] = Color3.new(1, 0, 0),
				["FontFace"] = Enum.Font.Bangers,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Boom = v72
		local v73 = {
			["Rarity"] = "Common",
			["UniqueID"] = "Boom2Title",
			["Properties"] = {
				["Text"] = "KABOOM!",
				["TextColor"] = Color3.new(1, 0, 0),
				["FontFace"] = Enum.Font.Bangers,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Boom2 = v73
		local v74 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "Boom3Title",
			["Properties"] = {
				["Text"] = "CAUTION!",
				["TextColor"] = Color3.new(1, 0, 0),
				["FontFace"] = Enum.Font.Bangers,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Boom3 = v74
		local v75 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "MimeTitle",
			["Properties"] = {
				["Text"] = "Rizzler",
				["TextColor"] = Color3.new(1, 1, 1),
				["FontFace"] = Enum.Font.Cartoon,
				["Italic"] = true,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Mime = v75
		local v76 = {
			["Rarity"] = "Common",
			["UniqueID"] = "Mime2Title",
			["Properties"] = {
				["Text"] = "SKIBIDI",
				["TextColor"] = Color3.new(0.647059, 1, 0.482353),
				["FontFace"] = Enum.Font.Cartoon,
				["Italic"] = true,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Mime2 = v76
		local v77 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "Mime3Title",
			["Properties"] = {
				["Text"] = "OHIO",
				["TextColor"] = Color3.new(0.666667, 0.333333, 1),
				["FontFace"] = Enum.Font.Cartoon,
				["Italic"] = true,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Mime3 = v77
		local v78 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "ViperTitle",
			["Properties"] = {
				["Text"] = "COBRA",
				["TextColor"] = Color3.new(0.666667, 1, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Viper = v78
		local v79 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "Viper2Title",
			["Properties"] = {
				["Text"] = "Toxic",
				["TextColor"] = Color3.new(0, 1, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Viper2 = v79
		local v80 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "Viper3Title",
			["Properties"] = {
				["Text"] = "POISON",
				["TextColor"] = Color3.new(0, 1, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Viper3 = v80
		local v81 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "LeechTitle",
			["Properties"] = {
				["Text"] = "HUNGRY",
				["TextColor"] = Color3.new(1, 0, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(1, 1, 1),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Leech = v81
		local v82 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "Leech2Title",
			["Properties"] = {
				["Text"] = "Vampire",
				["TextColor"] = Color3.new(1, 0, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Leech2 = v82
		local v83 = {
			["Rarity"] = "Mythic",
			["UniqueID"] = "Leech3Title",
			["Properties"] = {
				["Text"] = "PARASITE",
				["TextColor"] = Color3.new(1, 0.435294, 0.435294),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Leech3 = v83
		local v84 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "TigerTitle",
			["Properties"] = {
				["Text"] = "PREDATOR",
				["TextColor"] = Color3.new(1, 0.835294, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Tiger = v84
		local v85 = {
			["Rarity"] = "Common",
			["UniqueID"] = "Tiger2Title",
			["Properties"] = {
				["Text"] = "Apex",
				["TextColor"] = Color3.new(1, 0.415686, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Tiger2 = v85
		local v86 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "Tiger3Title",
			["Properties"] = {
				["Text"] = "HUNTER",
				["TextColor"] = Color3.new(0.764706, 0.560784, 1),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Tiger3 = v86
		local v87 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "RunehunterTitle",
			["Properties"] = {
				["Text"] = "womp womp\226\129\173",
				["TextColor"] = Color3.new(1, 0, 1),
				["FontFace"] = Enum.Font.Fondamento,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Runehunter = v87
		local v88 = {
			["Rarity"] = "Common",
			["UniqueID"] = "Runehunter2Title",
			["Properties"] = {
				["Text"] = "Witch",
				["TextColor"] = Color3.new(0.666667, 0.333333, 1),
				["FontFace"] = Enum.Font.Fondamento,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Runehunter2 = v88
		local v89 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "Runehunter3Title",
			["Properties"] = {
				["Text"] = "Avatar",
				["TextColor"] = Color3.new(0.654902, 1, 0.133333),
				["FontFace"] = Enum.Font.Fondamento,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Runehunter3 = v89
		local v90 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "ReaperTitle",
			["Properties"] = {
				["Text"] = "TERROR\226\129\173",
				["TextColor"] = Color3.new(0, 0, 0),
				["FontFace"] = Enum.Font.Creepster,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(1, 1, 1),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.2
			}
		}
		v2.Reaper = v90
		local v91 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "Reaper2Title",
			["Properties"] = {
				["Text"] = "Death",
				["TextColor"] = Color3.new(0, 0, 0),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(1, 1, 1),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Reaper2 = v91
		local v92 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "Reaper3Title",
			["Properties"] = {
				["Text"] = "WHOOSH",
				["TextColor"] = Color3.new(0.105882, 0.105882, 0.105882),
				["FontFace"] = Enum.Font.BuilderSansExtraBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(1, 1, 1),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Reaper3 = v92
		local v93 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "ApolloTitle",
			["Properties"] = {
				["Text"] = "Glorious",
				["TextColor"] = Color3.new(1, 1, 0),
				["FontFace"] = Enum.Font.GrenzeGotisch,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.2
			}
		}
		v2.Apollo = v93
		local v94 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "Apollo2Title",
			["Properties"] = {
				["Text"] = "Olympian",
				["TextColor"] = Color3.new(0, 1, 1),
				["FontFace"] = Enum.Font.GrenzeGotisch,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Apollo2 = v94
		local v95 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "Apollo3Title",
			["Properties"] = {
				["Text"] = "Radiant",
				["TextColor"] = Color3.new(0.654902, 0.870588, 0.054902),
				["FontFace"] = Enum.Font.GrenzeGotisch,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Apollo3 = v95
		local v96 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "GolemTitle",
			["Properties"] = {
				["Text"] = "CHILL",
				["TextColor"] = Color3.new(0.145098, 0.670588, 1),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.2
			}
		}
		v2.Golem = v96
		local v97 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "Golem2Title",
			["Properties"] = {
				["Text"] = "Cold",
				["TextColor"] = Color3.new(0.717647, 0.862745, 1),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Golem2 = v97
		local v98 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "Golem3Title",
			["Properties"] = {
				["Text"] = "FROSTBITE",
				["TextColor"] = Color3.new(0.356863, 0.243137, 1),
				["FontFace"] = Enum.Font.FredokaOne,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Golem3 = v98
		local v99 = {
			["Rarity"] = "Epic",
			["UniqueID"] = "HydraTitle",
			["Properties"] = {
				["Text"] = "Abysall",
				["TextColor"] = Color3.new(0.0313725, 0.113725, 0.560784),
				["FontFace"] = Enum.Font.ArimoBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.1
			}
		}
		v2.Hydra = v99
		local v100 = {
			["Rarity"] = "Rare",
			["UniqueID"] = "Hydra2Title",
			["Properties"] = {
				["Text"] = "Serpent",
				["TextColor"] = Color3.new(0.501961, 0.254902, 1),
				["FontFace"] = Enum.Font.ArimoBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1
			}
		}
		v2.Hydra2 = v100
		local v101 = {
			["Rarity"] = "Legendary",
			["UniqueID"] = "Hydra3Title",
			["Properties"] = {
				["Text"] = "DEVOURER",
				["TextColor"] = Color3.new(0.533333, 0, 1),
				["FontFace"] = Enum.Font.ArimoBold,
				["Italic"] = false,
				["StrokeColor"] = Color3.new(0, 0, 0),
				["StrokeThickness"] = 1.5,
				["GeneralSize"] = 1.2
			}
		}
		v2.Hydra3 = v101
		return v2
	end,
	["GetKits"] = function(_)
		local v102 = {}
		local v103 = {
			["Rarity"] = "Common",
			["UnlockType"] = "Souls",
			["Price"] = 0,
			["Layout"] = 0,
			["Description"] = {
				["ShortText"] = "Starter Kit without any perks.",
				["Abilities"] = {}
			},
			["Cooldowns"] = {},
			["Cycle"] = 0
		}
		v102.Basic = v103
		local v104 = {
			["Rarity"] = "Common",
			["UnlockType"] = "Souls",
			["Price"] = 150,
			["Layout"] = 1
		}
		local v105 = {
			["ShortText"] = "Use a shield to block damage and knockback and permanent +10% Health! 25% slower walk speed.",
			["Abilities"] = {
				["Shield"] = "Blocks 100% knockback and reduces damage by half. Cannot attack while shielding."
			}
		}
		v104.Description = v105
		v104.Cooldowns = {
			["Shield"] = 0
		}
		v104.Cycle = 0
		v102.Tank = v104
		local v106 = {
			["Rarity"] = "Common",
			["UnlockType"] = "Souls",
			["Price"] = 150,
			["Layout"] = 2
		}
		local v107 = {
			["ShortText"] = "50% increased walk speed and jump height.",
			["Abilities"] = {
				["Teleport"] = "Instantly teleport to any Player in a 6 Block Radius. Cooldown: 20s"
			}
		}
		v106.Description = v107
		v106.Cooldowns = {
			["Teleport"] = 20
		}
		v106.Cycle = 0
		v102.Runner = v106
		local v108 = {
			["Rarity"] = "Rare",
			["UnlockType"] = "Souls",
			["Price"] = 500,
			["Layout"] = 3
		}
		local v109 = {
			["ShortText"] = "Use powerful heal Ability. Deals 10% less Damage and slower Attack Speed.",
			["Abilities"] = {
				["Heal"] = "Grants back 22 Health. Cooldown: 12s"
			}
		}
		v108.Description = v109
		v108.Cooldowns = {
			["Heal"] = 12
		}
		v108.Cycle = 0
		v102.Healer = v108
		local v110 = {
			["Rarity"] = "Rare",
			["UnlockType"] = "Souls",
			["Price"] = 500,
			["Layout"] = 4
		}
		local v111 = {
			["ShortText"] = "Chance for additional Rewards every Kill [Souls, Additional Levels, Mastery XP]. Has 10% less Health",
			["Abilities"] = {
				["Roll"] = "85% Chance to heal 30 Health, 15% Chance to set Health to 1. Cooldown: 14s"
			}
		}
		v110.Description = v111
		v110.Cooldowns = {
			["Roll"] = 14
		}
		v110.Cycle = 0
		v102.Lucky = v110
		local v112 = {
			["Rarity"] = "Rare",
			["UnlockType"] = "Souls",
			["Price"] = 750,
			["Layout"] = 5
		}
		local v113 = {
			["ShortText"] = "Equip 2 weapons at once for increased hit-speed. Has 15% less Health",
			["Abilities"] = {
				["Thorns"] = "Reflect 25% of Damage for 4 Seconds! Cooldown: 20s"
			}
		}
		v112.Description = v113
		v112.Cooldowns = {
			["Thorns"] = 20
		}
		v112.Cycle = 0
		v102.Berserk = v112
		local v114 = {
			["Rarity"] = "Rare",
			["UnlockType"] = "Souls",
			["Price"] = 750,
			["Layout"] = 6
		}
		local v115 = {
			["ShortText"] = "Wield powerful Knockback Sticks and walk 25% faster. Deals 0 Damage and has less hit-speed.",
			["Abilities"] = {
				["Dash"] = "Dash 5 Blocks infront of you! Cooldown: 8s"
			}
		}
		v114.Description = v115
		v114.Cooldowns = {
			["Dash"] = 8
		}
		v114.Cycle = 0
		v102.Scout = v114
		local v116 = {
			["Rarity"] = "Epic",
			["UnlockType"] = "Souls",
			["Price"] = 2000,
			["Layout"] = 7
		}
		local v117 = {
			["ShortText"] = "Electrify enemies with stunning lightning attacks. Slower attack speed.",
			["Abilities"] = {
				["Lightning"] = "Start a chain Lightning attack damaging nearby enemies! Cooldown: 20s",
				["Shock"] = "Stun enemies in a 4 Block radius! Cooldown: 10s"
			}
		}
		v116.Description = v117
		v116.Cooldowns = {
			["Lightning"] = 20,
			["Shock"] = 10
		}
		v116.Cycle = 0
		v102.Bolt = v116
		local v118 = {
			["Rarity"] = "Epic",
			["UnlockType"] = "Souls",
			["Price"] = 2000,
			["Layout"] = 8
		}
		local v119 = {
			["ShortText"] = "5% chance to inflict Burn, Blindness or Electroshock to Enemies on hit + 3 Abilities!",
			["Abilities"] = {
				["\240\159\148\165 Rune"] = "Shoot a fire Rune on an enemy to make him burn. Cooldown: 20s",
				["\240\159\145\129\239\184\143 Rune"] = "Shoot Blindness Rune on enemy to block his Vision. Cooldown: 30s",
				["\226\154\161 Rune"] = "Shoot Electro Rune on enemy to stun him. Cooldown: 25s"
			}
		}
		v118.Description = v119
		v118.Cooldowns = {
			["\240\159\148\165 Rune"] = 20,
			["\226\154\161 Rune"] = 25,
			["\240\159\145\129\239\184\143 Rune"] = 30
		}
		v118.Cycle = 6
		v102.Runehunter = v118
		local v120 = {
			["Rarity"] = "Legendary",
			["UnlockType"] = "Robux",
			["Price"] = 299,
			["PurchaseID"] = 250128126
		}
		local v121 = {
			["ShortText"] = "Use spears for increased reach. Attack enemies from a distance. Block Enemy Attacks with your Shield!",
			["Abilities"] = {
				["Shield"] = "Blocks 100% knockback and reduces damage by half. Cannot attack while shielding.",
				["Repulse"] = "Deal Knockback when taking damage to keep enemies at a distance for 5 seconds! Cooldown: 20s"
			}
		}
		v120.Description = v121
		v120.Cooldowns = {
			["Repulse"] = 20,
			["Shield"] = 0
		}
		v120.Cycle = 0
		v102.Spearman = v120
		local v122 = {
			["Rarity"] = "Legendary",
			["UnlockType"] = "Robux",
			["Price"] = 299,
			["PurchaseID"] = 250127960
		}
		local v123 = {
			["ShortText"] = "Use burning weapons to light enemies on fire. Deal additional Fire damage. Careful SUPER HOT!!",
			["Abilities"] = {
				["Fire Burst"] = "Light all Enemies around you on fire in a 3 Block radius. Cooldown: 9s"
			}
		}
		v122.Description = v123
		v122.Cooldowns = {
			["Fire Burst"] = 9
		}
		v122.Cycle = 0
		v102.Inferno = v122
		local v124 = {
			["Rarity"] = "Legendary",
			["UnlockType"] = "Robux",
			["Price"] = 299,
			["PurchaseID"] = 250127816
		}
		local v125 = {
			["ShortText"] = "Become invisible using Shadow Abilities! Wield 2 Daggers for faster HitSpeed, Higher Crit Chance and +25% WalkSpeed!",
			["Abilities"] = {
				["Shadow"] = "Turn invisible only leaving a small trail of smoke. Cooldown: 14s",
				["Shockwave"] = "Deal Knockback to all Enemies in 3 Block radius. Cooldown: 9s"
			}
		}
		v124.Description = v125
		v124.Cooldowns = {
			["Shadow"] = 14,
			["Shockwave"] = 9
		}
		v124.Cycle = 0
		v102.Assassin = v124
		local v126 = {
			["Rarity"] = "Legendary",
			["UnlockType"] = "Robux",
			["Price"] = 299,
			["PurchaseID"] = 250128648
		}
		local v127 = {
			["ShortText"] = "Use Heavenly Abilities such as the TORNADO to destroy everyone in PvP. 2x Health regeneration!",
			["Abilities"] = {
				["Tornado"] = "Spin like a Tornado and hit every Player around you! Cooldown: 9s",
				["Blessing"] = "Give 10 Health and OP Shield for 1.25 seconds blocking 100% Damage and Knockback! Cooldown: 35s"
			}
		}
		v126.Description = v127
		v126.Cooldowns = {
			["Tornado"] = 9,
			["Blessing"] = 35
		}
		v126.Cycle = 0
		v102.Valkyrie = v126
		local v128 = {
			["Rarity"] = "Legendary",
			["UnlockType"] = "Robux",
			["Price"] = 299,
			["PurchaseID"] = 950714434
		}
		local v129 = {
			["ShortText"] = "Wield big Hammers instead of Swords for increased Knockback and Crit Chance! Build up Rage Combo to increase Hit Speed!",
			["Abilities"] = {
				["Smash"] = "Use Earths Power to Hit and Poison all Enemies infront of you, weakening them for your next hit! Cooldown: 15s",
				["Fury"] = "Instantly grant yourself a Rage-Combo of 2 for insane Hitspeed! Cooldown: 35s"
			}
		}
		v128.Description = v129
		v128.Cooldowns = {
			["Smash"] = 15,
			["Fury"] = 60
		}
		v128.Cycle = 0
		v102.Champion = v128
		local v130 = {
			["Rarity"] = "Mythic",
			["UnlockType"] = "Robux",
			["Price"] = 1299,
			["PurchaseID"] = 648079476
		}
		local v131 = {
			["ShortText"] = "You can Walk on water due to it turning to Ice and double Jump. Passive: Slow enemy hit-speed by 20% when fighting you.",
			["Abilities"] = {
				["Freeze Beam"] = "Deal 25 damage to Enemies infront of you hit by your Beam. Cooldown: 20s",
				["Double Jump"] = "Double jump in mid-air."
			}
		}
		v130.Description = v131
		v130.Cooldowns = {
			["Freeze Beam"] = 20
		}
		v130.Cycle = 0
		v102.Frostwalker = v130
		local v132 = {
			["Rarity"] = "Epic",
			["UnlockType"] = "IndexLuckyWheel",
			["Price"] = 0
		}
		local v133 = {
			["ShortText"] = "Use Jet-Pack to launch into air. Drop TNT from the Sky onto your enemies.",
			["Abilities"] = {
				["TNT"] = "Drop 1 TNT infront of You hitting everyone in a 2 block radius. Deals 40 damage. Cooldown: 20s",
				["Launch"] = "Jet-Pack yourself 10 Blocks into the air and escape any trouble. Cooldown: 15s"
			}
		}
		v132.Description = v133
		v132.Cooldowns = {
			["TNT"] = 20,
			["Launch"] = 15
		}
		v132.Cycle = 0
		v102.Boom = v132
		local v134 = {
			["Rarity"] = "Epic",
			["UnlockType"] = "IndexRebirth",
			["Price"] = 0
		}
		local v135 = {
			["ShortText"] = "5% chance to poison Enemies when they hit you (Snake)! Troll your enemies by disguising yourself with level 1 gear in Battle!",
			["Abilities"] = {
				["Illusion"] = "Give yourself Level 1 Armor and weapons to lure enemies into fighting you. Cooldown: 25s",
				["Flex"] = "Give yourself max Level Armor and weapons to scare strong Enemies away from you. Cooldown: 25s"
			}
		}
		v134.Description = v135
		v134.Cooldowns = {
			["Illusion"] = 25,
			["Flex"] = 25
		}
		v134.Cycle = 0
		v102.Mime = v134
		local v136 = {
			["Rarity"] = "Epic",
			["UnlockType"] = "IndexStats",
			["Price"] = 0
		}
		local v137 = {
			["ShortText"] = "Attacks have a 10% chance to poison and weaken enemies. Additionally use strong Toxic Abilities.",
			["Abilities"] = {
				["Rush"] = "Perform three ultrafast rapid attacks. Cooldown: 15s",
				["Fang"] = "Grab nearest enemy with your Deadly fang and pull him towards you. Cooldown: 25s"
			}
		}
		v136.Description = v137
		v136.Cooldowns = {
			["Rush"] = 15,
			["Fang"] = 25
		}
		v136.Cycle = 6
		v102.Viper = v136
		local v138 = {
			["Rarity"] = "Mythic",
			["UnlockType"] = "IndexStats",
			["Price"] = 0
		}
		local v139 = {
			["ShortText"] = "10% chance to Life Steal on hit! Use Strong Bloodsucking abilities!",
			["Abilities"] = {
				["Harvest"] = "Steal 5 hp from every Enemy in 6 Block Radius. Cooldown: 15s",
				["Wrath"] = "Put nearest Enemy in a trance and damage them the longer you hit them. Cooldown: 35s"
			}
		}
		v138.Description = v139
		v138.Cooldowns = {
			["Harvest"] = 15,
			["Wrath"] = 35
		}
		v138.Cycle = 6
		v102.Leech = v138
		local v140 = {
			["Rarity"] = "Epic",
			["UnlockType"] = "IndexDailyEvent",
			["Price"] = 0
		}
		local v141 = {
			["ShortText"] = "6% chance to Blind enemies on hit, Hunt Enemies with primal Abilities!",
			["Abilities"] = {
				["Claw"] = "Dash Forward and perform a strong Claw Slash. Cooldown: 15s",
				["Quake"] = "Stomp on the ground to Knock out and Blind all nearby enemies. Cooldown: 35s"
			}
		}
		v140.Description = v141
		v140.Cooldowns = {
			["Claw"] = 15,
			["Quake"] = 35
		}
		v140.Cycle = 6
		v102.Tiger = v140
		local v142 = {
			["Rarity"] = "Legendary",
			["UnlockType"] = "Event",
			["UnlockEvent"] = "Halloween_Event",
			["Price"] = 0
		}
		local v143 = {
			["ShortText"] = "1/10 Enemies are cursed granting 2 Levels on Kill and Healing you on Hit. Use additional cursed Abilities!",
			["Abilities"] = {
				["Curse"] = "Curse all Enemies in a 3 Block Radius. Cooldown: 15s",
				["Death Mark"] = "Death Mark 1 Enemy making him Explode on death dealing massive Damage and Blindness: 40s"
			}
		}
		v142.Description = v143
		v142.Cooldowns = {
			["Curse"] = 15,
			["Death Mark"] = 40
		}
		v142.Cycle = 6
		v102.Reaper = v142
		local v144 = {
			["Rarity"] = "Legendary",
			["UnlockType"] = "Event",
			["UnlockEvent"] = "Olymp_Event",
			["Price"] = 0
		}
		local v145 = {
			["ShortText"] = "20% Chance for Attacks to chain Lightning [OP]. Use additional blessed Light Abilities!",
			["Abilities"] = {
				["Spark"] = "Instantly Regain 15 Health. Cooldown: 10s",
				["Wings"] = "Quickly shoot up into the Air. Cooldown: 25s"
			}
		}
		v144.Description = v145
		v144.Cooldowns = {
			["Spark"] = 10,
			["Wings"] = 25
		}
		v144.Cycle = 6
		v102.Apollo = v144
		local v146 = {
			["Rarity"] = "Legendary",
			["UnlockType"] = "Event",
			["UnlockEvent"] = "Winter_Event",
			["Price"] = 0
		}
		local v147 = {
			["ShortText"] = "+10% Health, Use Ice Abilities to slow and damage Enemies!",
			["Abilities"] = {
				["Glacier"] = "Slow All Enemies in Surrounding, Cooldown: 14s",
				["Spikes"] = "Damage and Freeze all Enemies around with strong Ice Spikes. Cooldown: 25s"
			}
		}
		v146.Description = v147
		v146.Cooldowns = {
			["Glacier"] = 14,
			["Spikes"] = 25
		}
		v146.Cycle = 6
		v102.Golem = v146
		local v148 = {
			["Rarity"] = "Legendary",
			["UnlockType"] = "Event",
			["UnlockEvent"] = "Valentine_Event",
			["Price"] = 0
		}
		local v149 = {
			["ShortText"] = "Attack in short bursts of Combo Hits! Use Additional Vicious Abilities...",
			["Abilities"] = {
				["Shift"] = "Quick Backwards Dash, Cooldown: 8s",
				["Frenzy"] = "Increased Knockback and 2x Crit Chance for 6 seconds. Cooldown: 30s"
			}
		}
		v148.Description = v149
		v148.Cooldowns = {
			["Shift"] = 8,
			["Frenzy"] = 30
		}
		v148.Cycle = 6
		v102.Hydra = v148
		return v102
	end,
	["GetArmorTiers"] = function(_)
		local v150 = {
			{
				["Title"] = "Magma Armor",
				["StartingLevel"] = 60,
				["SoulsPrice"] = 125,
				["ShardsPrice"] = 25
			},
			{
				["Title"] = "Emerald Armor",
				["StartingLevel"] = 70,
				["SoulsPrice"] = 260,
				["ShardsPrice"] = 65
			},
			{
				["Title"] = "Ice Armor",
				["StartingLevel"] = 80,
				["SoulsPrice"] = 600,
				["ShardsPrice"] = 150
			},
			{
				["Title"] = "Dragon Armor",
				["StartingLevel"] = 90,
				["SoulsPrice"] = 950,
				["ShardsPrice"] = 220
			},
			{
				["Title"] = "Leaf Armor",
				["StartingLevel"] = 100,
				["SoulsPrice"] = 1250,
				["ShardsPrice"] = 275
			},
			{
				["Title"] = "Celestial Armor",
				["StartingLevel"] = 110,
				["SoulsPrice"] = 1650,
				["ShardsPrice"] = 425
			}
		}
		return v150
	end,
	["GetConsumables"] = function()
		local v151 = {
			["Immunity"] = {
				["Title"] = "Immunity",
				["Duration"] = 180,
				["Description"] = "Loose 0 Levels on death for 3 Minutes.",
				["Rarity"] = "Epic",
				["Price"] = 75,
				["Type"] = "Potion"
			},
			["MasteryXP"] = {
				["Title"] = "2x Mastery",
				["Duration"] = 480,
				["Description"] = "Earn 2x Mastery XP from Kills for 8 Minutes.",
				["Rarity"] = "Common",
				["Price"] = 20,
				["Type"] = "Potion"
			},
			["DoubleLevel"] = {
				["Title"] = "2x Level",
				["Duration"] = 300,
				["Description"] = "Earn 2 Levels per Kill for 5 Minutes.",
				["Rarity"] = "Rare",
				["Price"] = 50,
				["Type"] = "Potion"
			},
			["DoubleHitSpeed"] = {
				["Title"] = "1.25x HitSpeed",
				["Duration"] = 120,
				["Description"] = "Hit 1.25x Faster for 2 Minutes.",
				["Rarity"] = "Rare",
				["Price"] = 50,
				["Type"] = "Potion"
			},
			["GodPotion"] = {
				["Title"] = "God Potion",
				["Duration"] = 120,
				["Description"] = "2x HitSpeed, Earn 2 Levels per Kill, Loose 0 Levels on death and set Ability cooldowns to 3sec, Active: 2 Minutes",
				["Rarity"] = "Mythic",
				["Price"] = 200,
				["Type"] = "Potion"
			},
			["Hypercharge"] = {
				["Title"] = "Hypercharge",
				["Duration"] = 120,
				["Description"] = "All your Abilities have a 3 second cooldown for 2 Minutes",
				["Rarity"] = "Legendary",
				["Price"] = 140,
				["Type"] = "Potion"
			},
			["Speed"] = {
				["Title"] = "2x Speed",
				["Duration"] = 80,
				["Description"] = "Run at 2x your normal Speed for 80s.",
				["Rarity"] = "Rare",
				["Price"] = 50,
				["Type"] = "Potion"
			},
			["Jump"] = {
				["Title"] = "3x JumpPower",
				["Duration"] = 60,
				["Description"] = "Jump super high for 60s",
				["Rarity"] = "Common",
				["Price"] = 20,
				["Type"] = "Potion"
			},
			["DoubleJump"] = {
				["Title"] = "Double Jump",
				["Duration"] = 120,
				["Description"] = "Use Double Jump ability for 2 Minutes",
				["Rarity"] = "Common",
				["Price"] = 20,
				["Type"] = "Potion"
			},
			["Bloodfang"] = {
				["Title"] = "Bloodfang",
				["Duration"] = 480,
				["Description"] = "3x Health regeneration for 8 Minutes.",
				["Rarity"] = "Rare",
				["Price"] = 125,
				["Type"] = "Potion"
			},
			["BloodyEye"] = {
				["Title"] = "Bloody Eye",
				["Duration"] = 120,
				["Description"] = "Gain 4 Health per Hit on every Enemy for 2 Minutes.",
				["Rarity"] = "Epic",
				["Price"] = 100,
				["Type"] = "Potion"
			},
			["PumpkinGift"] = {
				["Title"] = "Pumpkin Gift",
				["Duration"] = 0,
				["Description"] = "Consume this magical Gift to instantly receive 10 Levels.",
				["Rarity"] = "Legendary",
				["Price"] = 0,
				["Type"] = "Item"
			},
			["TNTRain"] = {
				["Title"] = "TNT Rain",
				["Duration"] = 1,
				["Description"] = "Start a deadly TNT rain!",
				["Rarity"] = "Legendary",
				["Price"] = 380,
				["Type"] = "Item"
			},
			["Flood"] = {
				["Title"] = "Flood",
				["Duration"] = 1,
				["Description"] = "Start a deadly Flood!",
				["Rarity"] = "Legendary",
				["Price"] = 380,
				["Type"] = "Item"
			},
			["LuckyCrate"] = {
				["Title"] = "Lucky Crate",
				["Duration"] = 1,
				["Description"] = "Drop a lucky Crate from the sky!",
				["Rarity"] = "Epic",
				["Price"] = 175,
				["Type"] = "Item"
			},
			["Onyx"] = {
				["Title"] = "Onyx Token",
				["Duration"] = 0,
				["Description"] = "Incredibly Rare currency holding to Value of 1 Robux per Onyx when purchasing paid Kits!",
				["Rarity"] = "Mythic",
				["Price"] = 0,
				["Type"] = "Currency",
				["UIFrame"] = "KitInventory"
			},
			["Gift"] = {
				["Title"] = "Gift",
				["Duration"] = 0,
				["Description"] = "Consume this winter Gift to instantly receive 20 Levels.",
				["Rarity"] = "Legendary",
				["Price"] = 200,
				["Type"] = "Item"
			}
		}
		return v151
	end,
	["GetKitAbilities"] = function()
		local v152 = {
			["Shield"] = {
				["UI"] = "A_Blocking",
				["Remote"] = "Block",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Tornado"] = {
				["UI"] = "B_Tornado",
				["Remote"] = "Spin",
				["Input"] = 2,
				["InputType"] = 1
			},
			["Fire Burst"] = {
				["UI"] = "C_FireBurst",
				["Remote"] = "FireBurst",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Shadow"] = {
				["UI"] = "D_ShadowWarp",
				["Remote"] = "ShadowWarp",
				["Input"] = 2,
				["InputType"] = 1
			},
			["Shockwave"] = {
				["UI"] = "E_Shockwave",
				["Remote"] = "Shockwave",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Heal"] = {
				["UI"] = "F_Heal",
				["Remote"] = "HealRemote",
				["Input"] = 1,
				["InputType"] = 1
			},
			["TNT"] = {
				["UI"] = "G_TNT",
				["Remote"] = "TNTKitSpawn",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Launch"] = {
				["UI"] = "H_Launch",
				["Remote"] = "LaunchKit",
				["Input"] = 2,
				["InputType"] = 1
			},
			["Illusion"] = {
				["UI"] = "I_Illusion",
				["Remote"] = "IllusionAbility",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Dash"] = {
				["UI"] = "J_Dash",
				["Remote"] = "DashAbility",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Thorns"] = {
				["UI"] = "K_Thorns",
				["Remote"] = "ThornsAbility",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Freeze Beam"] = {
				["UI"] = "L_Beam",
				["Remote"] = "BeamAbility",
				["Input"] = 1,
				["InputType"] = 2
			},
			["Teleport"] = {
				["UI"] = "M_Teleport",
				["Remote"] = "TeleportAbility",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Blessing"] = {
				["UI"] = "N_Blessing",
				["Remote"] = "BlessingAbility",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Shock"] = {
				["UI"] = "O_Shock",
				["Remote"] = "ShockAbility",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Lightning"] = {
				["UI"] = "P_Lightning",
				["Remote"] = "LightningAbility",
				["Input"] = 2,
				["InputType"] = 1
			},
			["Flex"] = {
				["UI"] = "Q_Flex",
				["Remote"] = "FlexAbility",
				["Input"] = 2,
				["InputType"] = 1
			},
			["Rush"] = {
				["UI"] = "R_Rush",
				["Remote"] = "RushAbility",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Fang"] = {
				["UI"] = "S_Fang",
				["Remote"] = "FangAbility",
				["Input"] = 2,
				["InputType"] = 1
			},
			["Harvest"] = {
				["UI"] = "T_Harvest",
				["Remote"] = "HarvestAbility",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Wrath"] = {
				["UI"] = "U_Wrath",
				["Remote"] = "WrathAbility",
				["Input"] = 2,
				["InputType"] = 1
			},
			["Roll"] = {
				["UI"] = "V_Slots",
				["Remote"] = "RollAbility",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Quake"] = {
				["UI"] = "W_Quake",
				["Remote"] = "QuakeAbility",
				["Input"] = 2,
				["InputType"] = 1
			},
			["Claw"] = {
				["UI"] = "X_Claw",
				["Remote"] = "ClawAbility",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Repulse"] = {
				["UI"] = "Y_Repulse",
				["Remote"] = "RepulseAbility",
				["Input"] = 2,
				["InputType"] = 1
			},
			["\240\159\148\165 Rune"] = {
				["UI"] = "FireRune",
				["Remote"] = "FireRuneAbility",
				["Input"] = 3,
				["InputType"] = 2
			},
			["\226\154\161 Rune"] = {
				["UI"] = "ElectroRune",
				["Remote"] = "ElectroRuneAbility",
				["Input"] = 2,
				["InputType"] = 2
			},
			["\240\159\145\129\239\184\143 Rune"] = {
				["UI"] = "BlindnessRune",
				["Remote"] = "BlindnessRuneAbility",
				["Input"] = 1,
				["InputType"] = 2
			},
			["Curse"] = {
				["UI"] = "Curse",
				["Remote"] = "CurseAbility",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Death Mark"] = {
				["UI"] = "DeathMark",
				["Remote"] = "DeathMarkAbility",
				["Input"] = 2,
				["InputType"] = 1
			},
			["Smash"] = {
				["UI"] = "Smash",
				["Remote"] = "SmashAbility",
				["Input"] = 1,
				["InputType"] = 2
			},
			["Fury"] = {
				["UI"] = "Fury",
				["Remote"] = "FuryAbility",
				["Input"] = 2,
				["InputType"] = 1
			},
			["Spark"] = {
				["UI"] = "Spark",
				["Remote"] = "SparkAbility",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Wings"] = {
				["UI"] = "Wings",
				["Remote"] = "WingsAbility",
				["Input"] = 2,
				["InputType"] = 1
			},
			["Glacier"] = {
				["UI"] = "Glacier",
				["Remote"] = "GlacierAbility",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Spikes"] = {
				["UI"] = "Spikes",
				["Remote"] = "SpikeAbility",
				["Input"] = 2,
				["InputType"] = 1
			},
			["Shift"] = {
				["UI"] = "Shift",
				["Remote"] = "ShiftAbility",
				["Input"] = 1,
				["InputType"] = 1
			},
			["Frenzy"] = {
				["UI"] = "Frenzy",
				["Remote"] = "FrenzyAbility",
				["Input"] = 2,
				["InputType"] = 1
			}
		}
		return v152
	end,
	["GetMaps"] = function()
		local v153 = {
			{
				["Name"] = "Lighthouse",
				["MapNumber"] = 1
			},
			{
				["Name"] = "Jungle",
				["MapNumber"] = 2
			},
			{
				["Name"] = "Island",
				["MapNumber"] = 3
			},
			{
				["Name"] = "Volcano",
				["MapNumber"] = 4
			},
			{
				["Name"] = "Desert",
				["MapNumber"] = 5
			},
			{
				["Name"] = "Castle",
				["MapNumber"] = 6
			}
		}
		return v153
	end
}