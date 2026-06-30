local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local VIM = game:GetService("VirtualInputManager")

local lasers = workspace:FindFirstChild("MAP") and workspace.MAP:FindFirstChild("Indestructible") and workspace.MAP.Indestructible:FindFirstChild("Lasers")
if lasers then
	for _, child in ipairs(lasers:GetDescendants()) do
		if child:IsA("BasePart") then
			child:Destroy()
		end
	end
	for _, child in ipairs(lasers:GetChildren()) do
		child:Destroy()
	end
	lasers:Destroy()
end

local function log(msg)
	print("[BankAutoFarm] " .. msg)
end

local function getCenter()
	return Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
end

local function throwGrenade()
	local center = getCenter()
	VIM:SendMouseMoveEvent(center.X, center.Y, game)
	task.wait(0.05)
	VIM:SendMouseButtonEvent(center.X, center.Y, 0, true, game, 1)
	task.wait(0.1)
	VIM:SendMouseButtonEvent(center.X, center.Y, 0, false, game, 1)
	task.wait(0.1)
	VIM:SendMouseButtonEvent(center.X, center.Y, 0, true, game, 1)
	task.wait(0.1)
	VIM:SendMouseButtonEvent(center.X, center.Y, 0, false, game, 1)
end

local function reload()
	VIM:SendKeyEvent(true, Enum.KeyCode.R, false, game)
	task.wait(0.1)
	VIM:SendKeyEvent(false, Enum.KeyCode.R, false, game)
	log("Reloaded")
end

local function resetAndTeleport()
	local char = Player.Character or Player.CharacterAdded:Wait()
	local humanoid = char:WaitForChild("Humanoid")
	humanoid.Health = 0
	char = Player.CharacterAdded:Wait()
	local hum = char:WaitForChild("Humanoid")
	while hum.Health < 100 do
		task.wait(0.1)
	end
	local root = char:WaitForChild("HumanoidRootPart")
	root.CFrame = CFrame.lookAt(Vector3.new(-588.7, -31.2, -272.7), Vector3.new(-588.7, -31.2, -272.7) + Vector3.new(-0.9, 0, -0.3))
	workspace.CurrentCamera.CFrame = CFrame.lookAt(Vector3.new(-588.7, -31.2, -272.7), Vector3.new(-588.7, -31.2, -272.7) + Vector3.new(-0.9, 0, -0.3))
	log("Teleported")
end

local function vaultHasParts()
	local vault = workspace:FindFirstChild("MAP")
		and workspace.MAP:FindFirstChild("Map")
		and workspace.MAP.Map:FindFirstChild("Vault")
	if not vault then
		return false
	end
	for _, child in ipairs(vault:GetDescendants()) do
		if child:IsA("BasePart") then
			return true
		end
	end
	return false
end

local function teleportToVaults()
	local cashiersFolder = workspace:FindFirstChild("Cashiers")
	if not cashiersFolder then return end

	local char = Player.Character
	local bp = Player:FindFirstChild("Backpack")
	if char and bp then
		local shotgun = bp:FindFirstChild("[Drum-Shotgun]")
		if shotgun then
			char.Humanoid:EquipTool(shotgun)
			task.wait(0.2)
			log("Equipped Drum-Shotgun before vault teleport")
		end
	end

	for _, vaultModel in ipairs(cashiersFolder:GetChildren()) do
		if vaultModel.Name == "VAULT" then
			local head = vaultModel:FindFirstChild("Head")
			if head then
				local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
				if root then
					root.CFrame = CFrame.new(head.Position)
					log("Teleported to first VAULT head: " .. vaultModel:GetFullName())
				end
			end
			break
		end
	end
end

local function getMoneyDropsInRange(radius)
	local char = Player.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root then return {} end

	local drops = {}
	local dropFolder = workspace:FindFirstChild("Ignored") and workspace.Ignored:FindFirstChild("Drop")
	if not dropFolder then return {} end

	for _, obj in ipairs(dropFolder:GetChildren()) do
		if obj.Name == "MoneyDrop" then
			local part = obj:FindFirstChildOfClass("BasePart") or (obj:IsA("BasePart") and obj)
			if part and (root.Position - part.Position).Magnitude <= radius then
				table.insert(drops, obj)
			end
		end
	end
	return drops
end

local function hasMoneyDropsInRange(radius)
	return #getMoneyDropsInRange(radius) > 0
end

local function collectMoneyDrops()
	while true do
		local drops = getMoneyDropsInRange(15)
		if #drops == 0 then break end

		for _, obj in ipairs(drops) do
					local part = obj:FindFirstChildOfClass("BasePart") or (obj:IsA("BasePart") and obj)
			if part then
				local r = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
				if r then
					r.CFrame = CFrame.new(part.Position)
					task.wait(0.15)
				end
			end

			local cd = obj:FindFirstChildOfClass("ClickDetector")
			if cd then
				fireclickdetector(cd)
				log("Collected MoneyDrop")
			end
		end
		task.wait(0.2)
	end
	log("All MoneyDrops collected")
end

local function getAliveVaults()
	local cashiersFolder = workspace:FindFirstChild("Cashiers")
	if not cashiersFolder then return {} end
	local alive = {}
	for _, vault in ipairs(cashiersFolder:GetChildren()) do
		if vault.Name == "VAULT" then
			local hum = vault:FindFirstChildOfClass("Humanoid")
			if hum and hum.Health > 0 then
				table.insert(alive, vault)
			end
		end
	end
	return alive
end

local function performReconnect()
	log("No MoneyDrops found — reconnecting to random server...")
	local ts = game:GetService("TeleportService")
	local player = game:GetService("Players").LocalPlayer

	local success, result = pcall(function()
		local HttpService = game:GetService("HttpService")
		local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
		return HttpService:JSONDecode(game:HttpGet(url)).data
	end)

	if success and result then
		local validServers = {}
		for _, server in ipairs(result) do
			if server.playing and server.playing >= 10 and server.playing <= 35 and server.id ~= game.JobId then
				table.insert(validServers, server)
			end
		end

		if #validServers > 0 then
			local chosen = validServers[math.random(1, #validServers)]
			ts:TeleportToPlaceInstance(game.PlaceId, chosen.id, player)
		else
			ts:Teleport(game.PlaceId, player)
		end
	else
		ts:Teleport(game.PlaceId, player)
	end
end

-- ============================================
-- НОВАЯ ФУНКЦИЯ: Проверка и автоматический ресет при низком HP
-- ============================================
local healthCheckActive = false
local shouldRestartCycle = false

local function startHealthCheck()
	healthCheckActive = true
	log("Проверка HP активирована (лимит: 30 HP)")
	
	task.spawn(function()
		while healthCheckActive do
			local char = Player.Character
			if char then
				local humanoid = char:FindFirstChildOfClass("Humanoid")
				if humanoid then
					if humanoid.Health < 30 then
						log("HP < 30! Текущий HP: " .. humanoid.Health .. " — РЕСЕТ!")
						healthCheckActive = false
						shouldRestartCycle = true
						
						-- Ждем небольшой момент перед ресетом
						task.wait(0.5)
						
						-- Выполняем полный ресет
						resetAndTeleport()
						
						-- Ждем пока персонаж полностью заспаунится и восстановится
						task.wait(3)
						
						log("Ресет завершен, перезапуск цикла...")
						return
					end
				end
			end
			task.wait(0.2)
		end
	end)
end

-- ============================================
-- ОСНОВНОЙ ЦИКЛ: Закупка -> Телепорт -> Фарм
-- ============================================
local function mainFarmingLoop()
	while true do
		shouldRestartCycle = false
		
		resetAndTeleport()
		task.wait(2)

		local cashiers = workspace:FindFirstChild("Cashiers")
		if not cashiers then
			log("Cashiers not found!")
			return
		end

		local opened = 0
		local closed = 0

		for _, vault in ipairs(cashiers:GetChildren()) do
			if vault.Name == "VAULT" then
				local hum = vault:FindFirstChildOfClass("Humanoid")
				if hum then
					if hum.Health > 0 then
						closed = closed + 1
						log(vault:GetFullName() .. " -> CLOSED (HP: " .. hum.Health .. ")")
					else
						opened = opened + 1
						log(vault:GetFullName() .. " -> OPENED (HP: " .. hum.Health .. ")")
					end
				else
					log(vault:GetFullName() .. " -> No Humanoid found")
				end
			end
		end

		log("Открытых: " .. opened .. " | Закрытых: " .. closed)

		local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
		if root then
			root.CFrame = CFrame.new(108.82489, -29.6502247, -267.508881, 0.99999994, -0.000258947432, 8.6377906e-05, 0.000258984684, 0.999999881, -0.00043159895, -8.62661327e-05, 0.000431621302, 0.999999881)
			log("Teleported to shop")
		end
		task.wait(0.2)

		local shop = workspace.Ignored.Shop["[Grenade] - $788"]
		if shop then
			for _, v in ipairs(shop:GetDescendants()) do
				if v:IsA("ClickDetector") then
					log("Buying grenades until 2 in inventory...")
					while true do
						local count = 0
						local bp = Player:FindFirstChild("Backpack")
						if bp then
							for _, item in ipairs(bp:GetChildren()) do
								if item.Name == "[Grenade]" then
									count += 1
								end
							end
						end
						local ch = Player.Character
						if ch then
							for _, item in ipairs(ch:GetChildren()) do
								if item.Name == "[Grenade]" then
									count += 1
								end
							end
						end
						if count >= 2 then
							log("Got 2 grenades, stopping purchase")
							break
						end
						fireclickdetector(v)
						task.wait(0.1)
					end
					break
				end
			end
		end
		task.wait(0.2)

		local function checkGrenade()
			local backpack = Player:FindFirstChild("Backpack")
			if backpack then
				for _, item in ipairs(backpack:GetChildren()) do
					if item.Name == "[Grenade]" then
						return true
					end
				end
			end
			local char = Player.Character
			if char then
				for _, item in ipairs(char:GetChildren()) do
					if item.Name == "[Grenade]" then
						return true
					end
				end
			end
			return false
		end

		local found = false
		for i = 1, 50 do
			if checkGrenade() then
				found = true
				break
			end
			task.wait(0.1)
		end

		if found then
			local foundShotgun = false

			local bp0 = Player:FindFirstChild("Backpack")
			local ch0 = Player.Character
			if (bp0 and bp0:FindFirstChild("[Drum-Shotgun]")) or (ch0 and ch0:FindFirstChild("[Drum-Shotgun]")) then
				foundShotgun = true
				log("[Drum-Shotgun] already in inventory, skipping purchase")
			end

			if not foundShotgun then
				log("Going to Drum-Shotgun shop")
				root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
				if root then
					root.CFrame = CFrame.new(-1193.08997, 25.4800091, -518.450012, -1.1920929e-07, 0, -1.00000012, 0, 1, 0, 1.00000012, 0, -1.1920929e-07)
					log("Teleported to Drum-Shotgun shop")
				end
				task.wait(0.6)

				local shop2 = workspace.Ignored.Shop["[Drum-Shotgun] - $1238"]
				if shop2 then
					for _, v in ipairs(shop2:GetDescendants()) do
						if v:IsA("ClickDetector") then
							fireclickdetector(v)
							log("Clicked Drum-Shotgun shop")
							break
						end
					end
				end

				for i = 1, 50 do
					local bp = Player:FindFirstChild("Backpack")
					if bp and bp:FindFirstChild("[Drum-Shotgun]") then
						foundShotgun = true
						break
					end
					local ch = Player.Character
					if ch and ch:FindFirstChild("[Drum-Shotgun]") then
						foundShotgun = true
						break
					end
					task.wait(0.1)
				end
			end

			if foundShotgun then
				log("[Drum-Shotgun] found, going to ammo shop")
				root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
				if root then
					root.CFrame = CFrame.new(-1193.52014, 25.480011, -530.22998, -1.1920929e-07, 0, -1.00000012, 0, 1, 0, 1.00000012, 0, -1.1920929e-07)
					log("Teleported to ammo shop")
				end
				task.wait(0.42)

				local ammoShop = workspace.Ignored.Shop["18 [Drum-Shotgun Ammo] - $73"]
				if ammoShop then
					for _, v in ipairs(ammoShop:GetDescendants()) do
						if v:IsA("ClickDetector") then
							for j = 1, 8 do
								fireclickdetector(v)
								task.wait(0.05)
							end
							log("Clicked ammo shop 8x")
							break
						end
					end
				end
				task.wait(0.2)
			else
				log("[BankAutoFarm] [Drum-Shotgun] NOT found in inventory")
			end

			log("Teleporting back")
			root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
			if root then
				root.CFrame = CFrame.lookAt(Vector3.new(-588.7, -31.2, -272.7), Vector3.new(-588.7, -31.2, -272.7) + Vector3.new(-0.9, 0, -0.3))
				workspace.CurrentCamera.CFrame = CFrame.lookAt(Vector3.new(-588.7, -31.2, -272.7), Vector3.new(-588.7, -31.2, -272.7) + Vector3.new(-0.9, 0, -0.3))
			end

			local grenade2Done = false
			local grenade2Started = false
			local throwTime = nil

			if vaultHasParts() then
				log("Vault has parts — throwing grenade 1")

				local char = Player.Character
				local bp = Player:FindFirstChild("Backpack")
				if char and bp then
					local grenade = bp:FindFirstChild("[Grenade]")
					if grenade then
						root = char:FindFirstChild("HumanoidRootPart")
						if root then
							root.CFrame = CFrame.lookAt(
								Vector3.new(-588.7, -31.2, -272.7),
								Vector3.new(-588.7, -31.2, -272.7) + Vector3.new(-0.9, 0, -0.3)
							)
							workspace.CurrentCamera.CFrame = root.CFrame
						end
						task.wait(0.3)

						char.Humanoid:EquipTool(grenade)
						task.wait(0.2)
						throwGrenade()
						log("Grenade 1 thrown — ждем 1.5s перед телепортом к сейфам...")
						
						-- ============================================
						-- АКТИВИРУЕМ ПРОВЕРКУ HP ПОСЛЕ ПЕРВОЙ ГРАНАТЫ
						-- ============================================
						startHealthCheck()
						
						task.wait(1.5)

						-- Если уже должен быть ресет, пропускаем дальнейшее
						if shouldRestartCycle then
							log("Срабатила проверка HP, перезапуск цикла...")
							continue
						end

						teleportToVaults()

						throwTime = tick()
						task.spawn(function()
							while true do
								-- Проверяем флаг перезапуска
								if shouldRestartCycle then
									log("Прерывание фарма из-за ресета HP...")
									break
								end
								
								if tick() - throwTime >= 5 and vaultHasParts() then
									grenade2Started = true
									log("Parts appeared in vault after 5s — throwing grenade 2")

									local bp2 = Player:FindFirstChild("Backpack")
									local grenade2 = bp2 and bp2:FindFirstChild("[Grenade]")
									if grenade2 then
										local root2 = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
										if root2 then
											root2.CFrame = CFrame.lookAt(
												Vector3.new(-588.7, -31.2, -272.7),
												Vector3.new(-588.7, -31.2, -272.7) + Vector3.new(-0.9, 0, -0.3)
											)
											workspace.CurrentCamera.CFrame = root2.CFrame
										end
										task.wait(0.3)

										Player.Character.Humanoid:EquipTool(grenade2)
										task.wait(0.2)
										throwGrenade()
										log("Grenade 2 thrown")
									else
										log("Grenade 2 not found in backpack")
									end

									grenade2Done = true
									break
								end
								task.wait(0.25)
							end
						end)
					else
						log("Grenade not in backpack")
					end
				end
			else
				log("Vault is empty — skipping grenades, teleporting to vaults anyway")
				teleportToVaults()
				-- Активируем проверку HP и здесь
				startHealthCheck()
			end

			task.wait(3)
			
			-- Проверяем флаг перезапуска
			if shouldRestartCycle then
				log("Срабатила проверка HP, перезапуск цикла...")
				continue
			end
			
			if grenade2Started and not grenade2Done then
				log("Waiting for grenade 2 to finish...")
				while not grenade2Done and not shouldRestartCycle do
					task.wait(0.1)
				end
			end

			-- Еще раз проверяем флаг
			if shouldRestartCycle then
				log("Срабатила проверка HP, перезапуск цикла...")
				continue
			end

			local ammoPath = workspace.Players:FindFirstChild(Player.Name)
			ammoPath = ammoPath and ammoPath:FindFirstChild("[Drum-Shotgun]")
			ammoPath = ammoPath and ammoPath:FindFirstChild("Ammo")

			if ammoPath then
				reload()
				task.wait(0)

				local charEq = Player.Character
				local bpEq = Player:FindFirstChild("Backpack")
				if charEq and bpEq then
					local shotgun = bpEq:FindFirstChild("[Drum-Shotgun]")
					if shotgun then
						charEq.Humanoid:EquipTool(shotgun)
						task.wait(0.3)
					end
				end

				local aliveVaults = getAliveVaults()
				log("Alive vaults: " .. #aliveVaults)

				if #aliveVaults == 0 then
				  log("Нету сейфов — реконнект")
			      performReconnect()
			      return
				end

				local function mouseMoveClick(x, y, down)
					VIM:SendMouseMoveEvent(x, y, game)
					task.wait(0.05)
					VIM:SendMouseButtonEvent(x, y, 0, down, game, 1)
				end

				local function shootUntilVaultDead(vaultHumanoid)
					-- Сначала собираем деньги если есть
					while hasMoneyDropsInRange(15) and not shouldRestartCycle do
						collectMoneyDrops()
						task.wait(0.3)
					end

					-- Ждем пока будет минимум 6 патронов для стрельбы
					while ammoPath.Value < 6 and not shouldRestartCycle and vaultHumanoid.Health > 0 do
						task.wait(0.1)
					end

					if shouldRestartCycle or vaultHumanoid.Health <= 0 then return end

					local center = getCenter()
					log("Holding LMB... Shooting until vault dies")
					mouseMoveClick(center.X, center.Y, true)

					-- СТРЕЛЯЕМ ПОКА СЕЙФ НЕ УМРЕТ (не по амо)
					while vaultHumanoid.Health > 0 and not shouldRestartCycle do
						if hasMoneyDropsInRange(15) then
							mouseMoveClick(center.X, center.Y, false)
							log("MoneyDrop appeared — collecting...")
							collectMoneyDrops()
							if vaultHumanoid.Health > 0 then
								log("Resuming LMB...")
								mouseMoveClick(center.X, center.Y, true)
							end
						end
						task.wait(0.1)
					end

					mouseMoveClick(center.X, center.Y, false)
					log("Vault destroyed! Starting reload cycle...")
					task.wait(0.3)
					
					-- ПЕРЕЗАРЯЖАЕМСЯ В ЦИКЛЕ ДО 6 ПАТРОНОВ И ПРИ ЭТОМ СОБИРАЕМ MoneyDrop
					while ammoPath.Value < 6 and not shouldRestartCycle do
						log("Reloading... Current ammo: " .. ammoPath.Value .. "/6")
						VIM:SendKeyEvent(true, Enum.KeyCode.R, false, game)
						task.wait(0.15)
						VIM:SendKeyEvent(false, Enum.KeyCode.R, false, game)
						task.wait(0.5)
						if hasMoneyDropsInRange(15) then
							log("MoneyDrop found during reload — collecting...")
							collectMoneyDrops()
						end
					end
					
					log("Fully reloaded to 6 ammo")
				end

				for _, vault in ipairs(aliveVaults) do
					if shouldRestartCycle then break end
					
					local hum = vault:FindFirstChildOfClass("Humanoid")
					if not hum or hum.Health <= 0 then continue end

					local head = vault:FindFirstChild("Head")
					if not head then continue end

					local r = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
					if r then
						r.CFrame = CFrame.new(head.Position)
						log("Teleported to vault: " .. vault:GetFullName())
					end
					task.wait(0.3)

					while hasMoneyDropsInRange(15) and not shouldRestartCycle do
						collectMoneyDrops()
						task.wait(0.3)
					end

					-- Передаем humanoid сейфа в функцию
					shootUntilVaultDead(hum)

					log("Vault destroyed: " .. vault:GetFullName())
					task.wait(0.5)
					collectMoneyDrops()
				end

				while hasMoneyDropsInRange(15) and not shouldRestartCycle do
					collectMoneyDrops()
					task.wait(0.3)
				end

				if shouldRestartCycle then
					log("Прерывание фарма, перезапуск цикла...")
					continue
				end

				local remainingVaults = getAliveVaults()
				if #remainingVaults == 0 and not hasMoneyDropsInRange(15) then
				  log("Все сейфы убиты и нет MoneyDrop — реконнект")
				  healthCheckActive = false
				  performReconnect()
				  return
				end
			else
				log("Ammo path not found")
			end

		else
			log("[BankAutoFarm] Grenade NOT found in inventory")
		end
		
		-- Отключаем проверку HP перед следующей итерацией
		healthCheckActive = false
		task.wait(1)
	end
end

-- Запускаем основной цикл
mainFarmingLoop()