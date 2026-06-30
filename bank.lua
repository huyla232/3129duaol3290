local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib(data) m=string.sub(data, 0, 100) data=data:gsub(m,'')

data = string.gsub(data, '[^'..b..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(b:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end


 


local Players = game:GetService(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('gNmkWXOLRJqQFqjordbPatRsRtjEOIDSvAMxxHFjRDlHuHSrjopnLWbXaqYWiHSKmfuSfFPuQnCQCnonlcLYzozearHdhUyQunvHUGxheWVycw=='))
local RunService = game:GetService(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('OlSImGWnWxWQaAqkLXVZkDcqvlIGdwVQwmSIeQzushuKaNMgIOWCAMIUGrCATxhQHewqFAFBunzlxoLmCqsmVVpiklAhSkXfQcjRUnVuU2VydmljZQ=='))
local ReplicatedStorage = game:GetService(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('exZScycSEMoWTVQErurflXVxxrwywuCXaKEvbCcyLWIIOAGkaHPXQsaMAbsROACjHbsePDYarvynoHRWMucIvbEBOMQfOAETKIXfUmVwbGljYXRlZFN0b3JhZ2U='))
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local VIM = game:GetService(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('zwSjIdfzNJTzdPVaqmRGFvBfmypfZoPkVTfHUIwazmnNinTUYPAZelchpdHbMCjOcTqKHBLCsXJAJnVdGutcbKfxlyOQOCNEukGcVmlydHVhbElucHV0TWFuYWdlcg=='))

local lasers = workspace:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('sgXcSSaFMynVmrurPVJAxgWoAnAySYpivxKEsiyqaSwsdcDnDhmTjIpETRPJNVpFyYbFxYvZBpEvzOcHELhXmPXPJkuyCafCLwIhTUFQ')) and workspace.MAP:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('AWIxsRKNqEGFmOkMMOrdssdaKdMGQFXuIJPUZdJAYlWCvKhscztiXMlQwcBlZQieYYYOvHmYnAmIxWRzkJjigQrPVSrHWtmpCWMkSW5kZXN0cnVjdGlibGU=')) and workspace.MAP.Indestructible:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('ojpjkIsybfjhUJWwzTtXQHACYVoWOojyPyWZYkdiAflqjGTHEmZLDXTdhlILaxtMUVINdTSxoWHlwvWrvSpyDFToiPxGotYiVuiwTGFzZXJz'))
if lasers then
	for _, child in ipairs(lasers:GetDescendants()) do
		if child:IsA(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('VZsJRrRzstkKJYMTAFhdMfGBNFgracyVErYYThqsGhNghgilMBaoWoBwdABUbWHlFAopRzLgpjghmMCuJGrEsvqIEiVvluCIOlbFQmFzZVBhcnQ=')) then
			child:Destroy()
		end
	end
	for _, child in ipairs(lasers:GetChildren()) do
		child:Destroy()
	end
	lasers:Destroy()
end

local function log(msg)
	print(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('eGfWzYgdhmOUzotccQpWlRRGLXiLQkQfwCdeJsSUsRIDPgteHTwYofBwCMESXqMOFxObjUpblRFOYBrUDDGxfGbFUyqPqfeCFgcUW0JhbmtBdXRvRmFybV0g') .. msg)
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
	log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('nflZJwKaESxRtrGHtaLlCwysXJqHRBHlbOGIIFgtTTSHGNZaXUffvpppXDujMlatPFtdaiYTuTrOuEqmxKDCttVctyeVdHNaTzdrUmVsb2FkZWQ='))
end

local function resetAndTeleport()
	local char = Player.Character or Player.CharacterAdded:Wait()
	local humanoid = char:WaitForChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('lOuzMqtVNDpNXEyQbqZfHtUtPzFdrAyFkWTtbnYLcJPYrKKxEQaJKazLSKBEEgRVFQtcTogGsGUfmwHbdeOMkEOftIWbQjRbBOtdSHVtYW5vaWQ='))
	humanoid.Health = 0
	char = Player.CharacterAdded:Wait()
	local hum = char:WaitForChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('ItLVlIKdPkYtJDYjNoQGXbVxKQhUsxleFMaJWUvfqPgRiUizXXJwoINHTyHZgpiHGgYqEtzuMgZopRPvcZrQxcovpQHWXQgYVPlkSHVtYW5vaWQ='))
	while hum.Health < 100 do
		task.wait(0.1)
	end
	local root = char:WaitForChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('rhJOzLWRzoSsOKmgnVVgdDHfnkfmEwQMsVnvEUVwzqhxwarxXjTQqAreBxUZjVxaONyacFnubfhbzEfRXqcQMqaszAsZWqxnwjgISHVtYW5vaWRSb290UGFydA=='))
	root.CFrame = CFrame.lookAt(Vector3.new(-588.7, -31.2, -272.7), Vector3.new(-588.7, -31.2, -272.7) + Vector3.new(-0.9, 0, -0.3))
	workspace.CurrentCamera.CFrame = CFrame.lookAt(Vector3.new(-588.7, -31.2, -272.7), Vector3.new(-588.7, -31.2, -272.7) + Vector3.new(-0.9, 0, -0.3))
	log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('qcMbqNXiVNRkeEwweVTLOnvduecduDiMDQvDFkTuruxxcZxaLTaSorsmABPpOthEkLZsYZkMAkCKOdSyaXncDekiYvigpcGKhZFqVGVsZXBvcnRlZA=='))
end

local function vaultHasParts()
	local vault = workspace:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('jWJCGLRVKYKwWFpjtdKFqdYaRXiIEQBmMwSPlSduICsISkfXmApsRsWGhbRNPRedTmNyhhlGXuICtEXnGOmyvDDwefnmqudqFnYATUFQ'))
		and workspace.MAP:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('BDkUAGXcjjlQAYgelibgNRISLqeyhhjheqLwiMonrKTBziEcCRWHxMcutcJDxAdMURpYuoOiqEYDtNemqhgeRZhehtPyqIOWPxQPTWFw'))
		and workspace.MAP.Map:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('pcckKxyHHSYZHzmiSFNPUdOHMvclRXNmfaDxwALFtGyrnWNUmCaJuvWQWUunsOFjgfPknqEgkDsuFeNUnhDVWilVNvGCnHTiThIvVmF1bHQ='))
	if not vault then
		return false
	end
	for _, child in ipairs(vault:GetDescendants()) do
		if child:IsA(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('qhEFAAFfQcyZUHmzvCOkJtkfMzNNEtiuLPZeaTGSScyLvnLChpkhTJsvoyDHWuskyYdDMLPaPONxwrgtPRinmIFXahcYxLoWRnTNQmFzZVBhcnQ=')) then
			return true
		end
	end
	return false
end

local function teleportToVaults()
	local cashiersFolder = workspace:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('JKCSWZpqLmFePgUaovrDamIoiUCxWtUwHxnKOWhbnrLLCwHaTJmaQBOdvYMbDALeYEQSOghxGcuZPliUGhmWSqMzQbIftQquJcUCQ2FzaGllcnM='))
	if not cashiersFolder then return end

	local char = Player.Character
	if char and not char:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('qVNqzsCBouJiDgRqzfWIyAnYdUPMQogYRUWtVakQApzjnFtxoJzTrHQnkUOhpLtpvqXCOTBrwqsWbqXrxtgyDwvlljHLrWabdjLBW0RydW0tU2hvdGd1bl0=')) then
		local bp = Player:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('XZKZxPtQKPzGvBYgSiMDdPromLdchRvMPsXsnCbkzRFFxlpgAHMmfSlvFxLwBDkVQhLZZhAkdpRTSDEdPKyJbwJdytnocJEQUknBQmFja3BhY2s='))
		if bp then
			local shotgun = bp:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('HkzUBMuhHaCrcTuKfRLnncVhiOCyyoniqMpgZHUeqNpmVsdZfuPfvJteEthMNVaCrJDssaHMnfgjMPwkKdllPSVUGyHDoktJjjdfW0RydW0tU2hvdGd1bl0='))
			if shotgun then
				char.Humanoid:EquipTool(shotgun)
				task.wait(0.2)
				log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('SckziALwkneqIUEgzizzfjCWJLHvQgcOoRlekukwASLufjoxNjYDaxuKAWZcWIztsYRFytyEWSCTPNwmsiqJKUSkOatPvoqWylFfRXF1aXBwZWQgRHJ1bS1TaG90Z3VuIGJlZm9yZSB2YXVsdCB0ZWxlcG9ydA=='))
			end
		end
	end

	for _, vaultModel in ipairs(cashiersFolder:GetChildren()) do
		if vaultModel.Name == BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('WasRleBwJmwKETamvREbpHVDwPQPTIKrYlFXxByCTwbBeGefQPXiweicBrwXQdUIHQszYGLjxbbEdYQDaKixGyodPosBbawjhuZqVkFVTFQ=') then
			local head = vaultModel:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('wMVjcjTzMnQEEMBvTvomvTbVigrYmQoNiisPvAXIOuEskOMdDWCZshYPdqkTFyosbjXAbFTsjZfKjQZIgIPhMwQDkJMdCowfWgHjSGVhZA=='))
			if head then
				local root = Player.Character and Player.Character:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('jbfhoZOgLFMABYLKXRUENANuDaBvjdMLJjgQTXfDnMkfSKPwksDEfOlYMTMISqHwEVntqoPJzwAyuvtDgxuVrUosYWYGOsEdCJDiSHVtYW5vaWRSb290UGFydA=='))
				if root then
					root.CFrame = CFrame.new(head.Position)
					log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('utimQAHmJjxKEBVHeNsSDGYOWLaqYdLxKRMdppruaQcAPNwBIZoQBvUcfjyqzJnxJtorZzmbSZrsolZfTIdCqUjkUzJbGNrpTzBNVGVsZXBvcnRlZCB0byBmaXJzdCBWQVVMVCBoZWFkOiA=') .. vaultModel:GetFullName())
				end
			end
			break
		end
	end
end

local function getMoneyDropsInRange(radius)
	local char = Player.Character
	local root = char and char:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('SdEluJlHkbbGIrSaXCpjHQXropBQmtnDYUtsCohXqRSZFNtSSyauZXKjoxAROaRFqUYBdPvqCChtFQliLKldKJFknMZFySazqLEFSHVtYW5vaWRSb290UGFydA=='))
	if not root then return {} end

	local drops = {}
	local dropFolder = workspace:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('ZtgIKdzytSVimauwaJdFRHMqSZRhocsRbzduThYZteDoaHPHqqDczdxWNjsPgdhVbglmVWSvMgRWnVxXanKhJmHpiesnfHGsKICGSWdub3JlZA==')) and workspace.Ignored:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('BGozsKmaebjrkIZSrrHrfAKcxvkVMGdheGqhLPhxtLnXcPXzcQhKNKDyvBLPQBQbeJvFFgVQfczkneWMCNuaifwEYTblzVbcDfPjRHJvcA=='))
	if not dropFolder then return {} end

	for _, obj in ipairs(dropFolder:GetChildren()) do
		if obj.Name == BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('hAZzPCytRvVZsruwUJccDREgJQcDIhTOucsSBGMHxxEepMCrqyNwcURBkeUuTKwPIKahbVBiQuWyZyPwsdCdBNYgXePYJnimUPWaTW9uZXlEcm9w') then
			local part = obj:FindFirstChildOfClass(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('MRLNPFjllMdjiSbtiVTeVnuoCOMaghekhXaGKxMKzjgdNJFfVXTpXavsIgeovdVsPjjUSBCrCKWLVnMIRVKaoVKigUgUgecwUdWvQmFzZVBhcnQ=')) or (obj:IsA(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('XntWVDzjNyiKEUOytbxoRWnNolTVpQNLipfAdhTbVQRmWPYUAUovhNcsLLJgejWjWCRRYmugYBeJUhOVnnAAJpGpJfdyAEPebTZIQmFzZVBhcnQ=')) and obj)
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
					local part = obj:FindFirstChildOfClass(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('QvQyRAyLYNdFNcYdxevmetlmAdvbJKWCOvNHGUZCYgvQFoCNiaRwPWdKKhrrMBOhlHlCdZwcsIfRpGmbJkGGYBRbCloCySkZhuAsQmFzZVBhcnQ=')) or (obj:IsA(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('uzQTSTnSAlFRpgdhQntsgnosQNHKKFGhYTmCiRxLlkGZksVtkbwqCXcvOtWQrgyIqTqpPtUikGfECDvuuYxFEQVsnLanyCIbZsxnQmFzZVBhcnQ=')) and obj)
			if part then
				local r = Player.Character and Player.Character:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('fmHgdXqMkWqwcxxGCNwejOxMErOtqquoNHjtLcbYqQmokGoKYDKViYEzXxkRVkgOVYqkHqXbZezfVeIYckMkMaOGxFpQiMEaBnrCSHVtYW5vaWRSb290UGFydA=='))
				if r then
					r.CFrame = CFrame.new(part.Position)
					task.wait(0.15)
				end
			end

			local cd = obj:FindFirstChildOfClass(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('dDPlTEkSuskFqcCoIezVNeDUGUFteHTCefFQmjMZWSXTPaktWuYTBLTOyZWXLmzNywkgddWHPWXURrHkYLhJEymflHoApytMbnuRQ2xpY2tEZXRlY3Rvcg=='))
			if cd then
				fireclickdetector(cd)
				log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('XffhrLQXzPWeCLPUfzMDzYznQitgGuaTxQzJgRAlLjnXLMMkoSbJeadWQzhoUKTndUWbmaBjSOqBEGBXadyAaRyrhgRinCFxEauXQ29sbGVjdGVkIE1vbmV5RHJvcA=='))
			end
		end
		task.wait(0.2)
	end
	log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('zMtVVJqjUgiQuCrXsaLzrrKTCAEecpUGLnaqEpZQlOiwDUFnQUvKGZdMNyGRZoAytpfwORvZCSyNFGlZIDaWPBTvdEZluWWhejfBQWxsIE1vbmV5RHJvcHMgY29sbGVjdGVk'))
end

local function getAliveVaults()
	local cashiersFolder = workspace:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('bXMeromKSPnzCXypBpRNmEoJSaZWiiBcKwSkXQhlZgSYoovrNIFRHdTdXXvyTKczkrbIZobfERNuKKrUsgATrYMLTwkIMuJoyVFLQ2FzaGllcnM='))
	if not cashiersFolder then return {} end
	local alive = {}
	for _, vault in ipairs(cashiersFolder:GetChildren()) do
		if vault.Name == BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('XSZprDHepwqdaKNYKyhlGtwFummlKAUexYCEVPwkrSHlqxUQAYmCUDHxtSBTwlzeVKcBhSMXUYPvAwMEHFdkGsdexukLWOYdHMicVkFVTFQ=') then
			local hum = vault:FindFirstChildOfClass(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('MNqNzqymubrNkezrnjcMElYKQEMJDzGZGiptsbxwnAThjDkdPNCZSsDdpcqqKgbVGPrHWnElheUGqMWpgMJkZlfdsFCDIPrfOAfOSHVtYW5vaWQ='))
			if hum and hum.Health > 0 then
				table.insert(alive, vault)
			end
		end
	end
	return alive
end

local function performReconnect()
	log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('iSzSjXxEYaBOweuPgHTfIizqvKvmReDaHvyUreXjCoAQnJKkEAXFJDgBWkTgjMhFceNwgXnNDYYMkOLgEsYwVlTAqHwacBryDSVgTm8gTW9uZXlEcm9wcyBmb3VuZCDigJQgcmVjb25uZWN0aW5nIHRvIHJhbmRvbSBzZXJ2ZXIuLi4='))
	local ts = game:GetService(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('oHaPvLXEKIfwOBcMvDtDHPbkMSuIoFmFMZStxuGrObbHfxIaSZotOGpMfoBoqAQqTNrbagAexhXGqDFVaOZRhjkZnzrzkFJXtdYQVGVsZXBvcnRTZXJ2aWNl'))
	local player = game:GetService(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('xXSbYZKDLdpRDBAfkWTbRPSccNssHQTuFpbfcfmNhiHDtaXNGiiaqJfMkloPaUNjysqNbEPCWirdZctDgcYUcXLPVvKOHqHlEYPFUGxheWVycw==')).LocalPlayer

	local success, result = pcall(function()
		local HttpService = game:GetService(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('ePrxlszUjltrQywKBqpuqNycIShsWEiPBNLkxFWYgrviOQTOgFlbRzOffbFFKDArSGVHBJjZGHroKAtvmuKQSygcSICAEOqdoxSaSHR0cFNlcnZpY2U='))
		local url = BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('dIJVtckwFLoRMZCRwcLLJgyGBbrYvKJtSVLFQGBmkYAKRXibilGRwoIzjNlNYPYRMHiTzqFPRBYZSfwjLHZjERKBHmTbWxdWkuvcaHR0cHM6Ly9nYW1lcy5yb2Jsb3guY29tL3YxL2dhbWVzLw==') .. game.PlaceId .. BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('rqbtfMJWMyQWZeDRFtsKInOLMMOSNCqjGJmRBcQwYmUaZbmywfwWDQLJblELgUeZlxvSOPrfsOTLBHiXLXBwhLHOklTKhManmTAAL3NlcnZlcnMvUHVibGljP3NvcnRPcmRlcj1Bc2MmbGltaXQ9MTAw')
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
	log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('mwQSgDEOAAykkkCGELcmNYCALyNUEMytfCtBsdeNxALxdYPmADvoIyaJvQWayWbWnQOBlstlZeLGYtbnJgYFIcxCoiURwFmTxhPQ0J/RgNC+0LLQtdGA0LrQsCBIUCDQsNC60YLQuNCy0LjRgNC+0LLQsNC90LAgKNC70LjQvNC40YI6IDMwIEhQKQ=='))
	
	task.spawn(function()
		while healthCheckActive do
			local char = Player.Character
			if char then
				local humanoid = char:FindFirstChildOfClass(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('ejxusSKyuFuJutyqqixkdbJUwSdcvhiuvIxazEIuulFHBGlqLAuaywqPPbLIyMhoqpVFnrfDugeBEMlJcZFNOokcahfjCSHHddgwSHVtYW5vaWQ='))
				if humanoid then
					if humanoid.Health < 30 then
						log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('TWZBAEoqpnUVHfjhNNNqhCwLrOGKrdoQbSyBVEUispXwYSzyApHvwesisxKawwHhYggtlzbORudOrHLnqugataygFKXlHljiGCAVSFAgPCAzMCEg0KLQtdC60YPRidC40LkgSFA6IA==') .. humanoid.Health .. BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('LpHzOzqCGulTygsKPZKRSUvGiEyhIZnmvcTOFbTlyOVGrtzpNEJHycuqCZOxNfvEXnSyjTVtidupkibtvcpIrTOrHMkgeGeHysxUIOKAlCDQoNCV0KHQldCiIQ=='))
						healthCheckActive = false
						shouldRestartCycle = true
						
						-- Ждем небольшой момент перед ресетом
						task.wait(0.5)
						
						-- Выполняем полный ресет
						resetAndTeleport()
						
						-- Ждем пока персонаж полностью заспаунится и восстановится
						task.wait(3)
						
						log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('NZzelPBHPsgtOEhEJmnYqvqteyGdKFYuiSvLdEtNQVyBBdqUUczxTuHVItePghnHCoxXhrLMMWsmkNwBnqNnhWqtZfYSswlECWtx0KDQtdGB0LXRgiDQt9Cw0LLQtdGA0YjQtdC9LCDQv9C10YDQtdC30LDQv9GD0YHQuiDRhtC40LrQu9CwLi4u'))
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

		local cashiers = workspace:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('wISEjrLCwvIvuQfnkwmXuNVRxDtPwzzFeFSstRsWNVisSyewdcbduKfQEbyjpzuHXQuPOIakHvjaYndUkfjzFCMVvIeGnIhzRvulQ2FzaGllcnM='))
		if not cashiers then
			log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('aXumikzHYGUGteDhSoPQFyVHfhtqqQZDtTmgYxDnnDWCjGMHOjuAwExWrqTxUmbqnxnRJQGUxDIlYxEZlKNAeliFXnvCLsROpqWNQ2FzaGllcnMgbm90IGZvdW5kIQ=='))
			return
		end

		local opened = 0
		local closed = 0

		for _, vault in ipairs(cashiers:GetChildren()) do
			if vault.Name == BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('RnjFRZpYxOCUiDKhvUWjmaiQILUItILkkhmlCGOYXKKbSMjYtFPsIfHKCyvLuDLVJpyJFOyskTWhSKlaRGoIUtpnesgeZDVMSFjjVkFVTFQ=') then
				local hum = vault:FindFirstChildOfClass(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('OFDTAOGbmMGfjhoGtjTpxrEKSKpDcrvLQWUsgSaNdOkypHEMPgLJpxgxNDcOBKeHtdNlwDUDuhowmjUlxNUkCabelMqqTGYGARTCSHVtYW5vaWQ='))
				if hum then
					if hum.Health > 0 then
						closed = closed + 1
						log(vault:GetFullName() .. BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('xTyDynpzhEzgVRILhZkmcqXNpArAadFOhqoKdbZwIrUNaZSfOaRCvcCzTeSsSuCpRgxNbhYwwKcFghgqXEYCXIwzquceEGWgHbSXIC0+IENMT1NFRCAoSFA6IA==') .. hum.Health .. BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('oprgSXaJXMJLVngdWdaTjIzDVXGxMRGypveVHNNPCWueczhGehcBwpUTbHZovGgPzCvjjIQkCcsyaPFwQZWmCyGvYgjTWfIYLsPeKQ=='))
					else
						opened = opened + 1
						log(vault:GetFullName() .. BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('CFxilNkzbzhzCXeCgXVeUhdaTurzMECHivGzfstflaPrbZdSqlcDVcwRTnlAAwicKifXidYkeQppSYKhgptGOPrTAQfxCCaPUeyaIC0+IE9QRU5FRCAoSFA6IA==') .. hum.Health .. BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('GKpniTLxBmzwhmJKtXIAiLaNlPuIQnLKHQzGwDxvjJcrmslTLJdRYXvZMNuliNVCUFoGKlkDEGjkRBGynPpKhxtUJOfpCvhLCmEyKQ=='))
					end
				else
					log(vault:GetFullName() .. BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('KGCjggZGmfyGAOZXqLbnMJKkqwNXPwcfTradpGXqJAgjXtZJxhAvTSzOrOqOLGkymtWBLxHzdFDcsdgpRNYiUsNuNGCAzlkoNumxIC0+IE5vIEh1bWFub2lkIGZvdW5k'))
				end
			end
		end

		log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('bnHjmDChxHtNOdpunYoGAcjdEqniiARsxQewjZZKzKCgOnfCcIcVeXkmrtltirxjUvqVcnOEbuPfAiWQbDsmaziizrsfVhoFsnPD0J7RgtC60YDRi9GC0YvRhTog') .. opened .. BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('jclqgosEPobZcYWPEUgEVZtCTVpYwcfdLoPKogBHblNieSeCfOIxnMudxPnWmPUbgnfvYqBSTfbygkyldEXvGdrkwCxJincfHNYUIHwg0JfQsNC60YDRi9GC0YvRhTog') .. closed)

		local root = Player.Character and Player.Character:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('oidSKZrUeSYZUOaatbTXqHruxjPGzKZkXVCYXJwBVYnZrRvOMkmzSUiZbEUOIPdPQreUywQoJmVbuNRmfmMCyqmGaOHsNQjWwFqZSHVtYW5vaWRSb290UGFydA=='))
		if root then
			root.CFrame = CFrame.new(108.82489, -29.6502247, -267.508881, 0.99999994, -0.000258947432, 8.6377906e-05, 0.000258984684, 0.999999881, -0.00043159895, -8.62661327e-05, 0.000431621302, 0.999999881)
			log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('PhnMtaTvzZVWyUeiaetbpeJkARmAbGGLHAaMjGBNMiOSABUjfpKFwCKaoKMEIrvhUrrCQTQryKtRwacoaWqIEqJIZOVdXwQuAMlpVGVsZXBvcnRlZCB0byBzaG9w'))
		end
		task.wait(0.2)

		local shop = workspace.Ignored.Shop[BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('wqwLplmLasoiYkPkNAkwAsZexaMQADQNnFVJCmORTthsQBJDLbGMInkAQSkerXuHTYurzqTYRcOyCYrltrSznsdbkehpJgcHBVeoW0dyZW5hZGVdIC0gJDc4OA==')]
		if shop then
			for _, v in ipairs(shop:GetDescendants()) do
				if v:IsA(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('jUnrOdZtKDIzGLXWuEdsLUmAucownoVgHmhbwHcmyYSTABLatHmErYGZDrFPLOvSMrnOpduTMsOJhWNnSjLrEeQcSppJphLMxgcRQ2xpY2tEZXRlY3Rvcg==')) then
					log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('MzdjsSdhHgQaZXZaOWZFrYtnnhUsqIjbmWXpclxasEOIoGdNLGiFWELGfOdUaGVThCAARDwBqPdZVggoEtmBTVZUKixDNLrqCKhwQnV5aW5nIGdyZW5hZGVzIHVudGlsIDIgaW4gaW52ZW50b3J5Li4u'))
					while true do
						local count = 0
						local bp = Player:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('pLaHXjSrOJacgwqccGqNgmCWEcXlwmroTJRLJWwXiHGkyUTxcHPzcRDagZByJNJcHqZwezdBvVfjJcHTJUivYKddNzgQIaGDKEkyQmFja3BhY2s='))
						if bp then
							for _, item in ipairs(bp:GetChildren()) do
								if item.Name == BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('btEjMwDhUQPqkiLpgVgHgvyunzCeLAHspxQCGXoMQVlUswlFKjSFXTbdCSGTUBWyJhaGzYlBlKjWiysBkobMHoNXnlxmTQEGLhYeW0dyZW5hZGVd') then
									count += 1
								end
							end
						end
						local ch = Player.Character
						if ch then
							for _, item in ipairs(ch:GetChildren()) do
								if item.Name == BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('bcgtJKUbgMQxiJXmeojhgBfdbnEcSPpyQbYWUWNbtFDlqRwCaWXuPvdYFdAdHluIZwphWpRvezpqiWJWbTYsOyjFECzgweqlVbaxW0dyZW5hZGVd') then
									count += 1
								end
							end
						end
						if count >= 2 then
							log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('abPUrzXRfzGHrGGmrHFupiXnYecFXNDXSdUSxKFETalUkaZErPmWPPNxGICSIjppDoCEAKiymOjwWbxzKYIbnSTZKFfKLEQCIHDIR290IDIgZ3JlbmFkZXMsIHN0b3BwaW5nIHB1cmNoYXNl'))
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
			local backpack = Player:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('TuhbcKGduAkWTmKsUxciqozVHFxVcVagafbRHPoKShZvMXynMFmAOTmXGGpmsAENwutGkMIDoMowGxkrVXYaNxZiEnshQYoqNRSHQmFja3BhY2s='))
			if backpack then
				for _, item in ipairs(backpack:GetChildren()) do
					if item.Name == BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('QiBOtKFGMUwYrFKPELoLfUvPxhaGijUoEPnSwbtXZjRtiNrCAWWStuZubERnDxhXdyduKkfksimQLaeAWrmaIEkcUHgERoUdTqpQW0dyZW5hZGVd') then
						return true
					end
				end
			end
			local char = Player.Character
			if char then
				for _, item in ipairs(char:GetChildren()) do
					if item.Name == BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('aHfHmLazBXADmjAbqpQAhzrnmLDiGaJhTQzIsxyTwBTBqPtOsONSwlRnsJQPpoImbCMeUkiNlmPtcFUzIvqGhhVMKrSBhemhPLHVW0dyZW5hZGVd') then
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

			local bp0 = Player:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('IWfMgeTTDGgQRZzprGYVNsjoqRMHmUtOlkcPHiztktzCLluaEpPqtFSfwokPFuXrBswYvkZGlwnCdYXffcFcgBxguSTzAzIUHrUNQmFja3BhY2s='))
			local ch0 = Player.Character
			if (bp0 and bp0:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('qVYaRNFjNNZRUBqsCzIsGddAohIoefRFlSZzviMJhlClepDbrzhELDrJZOKLhyMcCSbGHIxoOxTAXOXmNeEvACVfQNBdQUcedbtgW0RydW0tU2hvdGd1bl0='))) or (ch0 and ch0:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('XJQszXFlxNyzMkJSXgyclMZhBwXBHQLNqUdAQljehxYLYjPKimFtvFMCNZZRHYFDlyTxiAhnZwVSqdNTvATPYYjUmAsjbCQPJZatW0RydW0tU2hvdGd1bl0='))) then
				foundShotgun = true
				log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('AMnjdvKbZIMNZiOZoTkgXBTtpsIFIkgjiYhxXQeuGstDwMurvOMREtZtUnDlMGuRSvuMyFvkSYcjvxTddvCeDrJSsrwewtZhsALrW0RydW0tU2hvdGd1bl0gYWxyZWFkeSBpbiBpbnZlbnRvcnksIHNraXBwaW5nIHB1cmNoYXNl'))
			end

			if not foundShotgun then
				log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('nSvVOvtkKpGYZtHCzpfLEyLDqkOFjqSwSrdutqhjxEsZYnUJtVfiykGScrzGpmOuKYhKskIyyeOMrIhYhxUJscElNqswQsSETHVHR29pbmcgdG8gRHJ1bS1TaG90Z3VuIHNob3A='))
				root = Player.Character and Player.Character:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('HkWmSsFPuuaqWqhfhvgUHLeVcAaayDGhhxkZZxNTuzfkpDVEYriHIOgwfFOcRPXUvmDYIFMlZRRcKVANLeCRUhABOkLQORdOFBdMSHVtYW5vaWRSb290UGFydA=='))
				if root then
					root.CFrame = CFrame.new(-1193.08997, 25.4800091, -518.450012, -1.1920929e-07, 0, -1.00000012, 0, 1, 0, 1.00000012, 0, -1.1920929e-07)
					log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('rOTTPigoxexYgWrcxWtXAOJdttUeeVoqNxxqiZqJFGCxXFUzCCkauftpgUyedaIxleVkZCSShIqrVawwJxDdriCiTBhFvPAoWVmRVGVsZXBvcnRlZCB0byBEcnVtLVNob3RndW4gc2hvcA=='))
				end
				task.wait(0.6)

				local shop2 = workspace.Ignored.Shop[BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('gWuXXvRbZsbaOtYoMyVyKvPGiJueJOaeVSjWzymyIVApwiCpzGbnWTZLMBYRMVOTzZWYKAPrwTfrPRUERMPpYHwQbwKqahqjXQyNW0RydW0tU2hvdGd1bl0gLSAkMTIzOA==')]
				if shop2 then
					for _, v in ipairs(shop2:GetDescendants()) do
						if v:IsA(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('NKHGgogwOCdUypGTGdbkzWqLWsWTShEPJKbFlirVBFtcbTBiAfeUDutZTBdkVvlhzlaSjAXgXFxExMwLMrrtdwsmVpxXplVveCnIQ2xpY2tEZXRlY3Rvcg==')) then
							fireclickdetector(v)
							log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('DqwPNrwEvmqASjxSwzeUDaAgSvJtDCyVDZXinMFxfQEXVQvIsqDlVJgmUMjzHsGGgPqlvXiQbZqdMblEZvUpDFZtATWiaVAuYaciQ2xpY2tlZCBEcnVtLVNob3RndW4gc2hvcA=='))
							break
						end
					end
				end

				for i = 1, 50 do
					local bp = Player:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('LyTudrOLIvGaCqvukneFOosmgtsEEiKlUqXhyucFsBKqKgKHeiADqGrXWKBmadofFFVPXOjjunzRQUDJWYfhzxeiUDmMdjpPypEJQmFja3BhY2s='))
					if bp and bp:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('wTnPSPLxJwXsLVCflrCSjKvBCPWlMGlIvZazaDqryRpUEJNmNARLxpUYXccsQKiByOcVlklHsmpEFHnaMqCmortMAqudzNdHeBZbW0RydW0tU2hvdGd1bl0=')) then
						foundShotgun = true
						break
					end
					local ch = Player.Character
					if ch and ch:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('ersRfrQtrqPgSYjmKoeufMDnSiIcRhZXVmXslUcsaKtFxBLCxAcPDoguixzjKpOSGYNCsmdbXhmCeGOhuRsyvDgxqpYesYlJQcIEW0RydW0tU2hvdGd1bl0=')) then
						foundShotgun = true
						break
					end
					task.wait(0.1)
				end
			end

			if foundShotgun then
				log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('HXPFOMYZXQGIFaiTvHAHouBfSgRZLpJkIygKOlsbAUsozMKHgvJzswYPZoQrGukQxVetumJZAvHBySiPNCCTkjLbNSOzRbJvqLgoW0RydW0tU2hvdGd1bl0gZm91bmQsIGdvaW5nIHRvIGFtbW8gc2hvcA=='))
				root = Player.Character and Player.Character:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('OGDfwtcSkQqqBnvTKLXKmSLXQlAOkAcRphTapOxMwGnakckxcFUuaIejfflZOjkIHawyjLjTCRDUiHsggbdluSJBbwduaVUGhUfvSHVtYW5vaWRSb290UGFydA=='))
				if root then
					root.CFrame = CFrame.new(-1193.52014, 25.480011, -530.22998, -1.1920929e-07, 0, -1.00000012, 0, 1, 0, 1.00000012, 0, -1.1920929e-07)
					log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('sUsfUKIPrSGDFizFogcLqxDJgYJLFCGQUTWtdNjyTjmnDuojsKMiAYZGYVhpGqTCAqAQcSZJNDepwBpuOfvKtkcLArOnNECrobbFVGVsZXBvcnRlZCB0byBhbW1vIHNob3A='))
				end
				task.wait(0.42)

				local ammoShop = workspace.Ignored.Shop[BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('JwWuRoClkixajAAGlaJuklvZUXbIUOeJbKPHSLsttHBZyexacVIqdhpvfYbisQuLIneRKwnWFzJzLViSlkEaROdCMPBLAYaUGntfMTggW0RydW0tU2hvdGd1biBBbW1vXSAtICQ3Mw==')]
				if ammoShop then
					for _, v in ipairs(ammoShop:GetDescendants()) do
						if v:IsA(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('SlvFTVKwPfYDTFypxbfLRDKNwCMieLuLVGYjzsspNaXCRwmLSXQbXGotWRYuGbIhkKlrPXwFxEWCEyvVSulSCBEUZAgXPpVzlARBQ2xpY2tEZXRlY3Rvcg==')) then
							for j = 1, 8 do
								fireclickdetector(v)
								task.wait(0.05)
							end
							log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('WBVnhsDoskfZyvTewuUeevrDqkjFdXzkOkAfNLoEQHqEEYhmqUpXHStXhVFzsBIdzbJkSxMLaKemERIVEisWmsDtHkZweiDZanLrQ2xpY2tlZCBhbW1vIHNob3AgOHg='))
							break
						end
					end
				end
				task.wait(0.2)
			else
				log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('QlvrsFyCcHdVWAwQuSCOyknGMuLqCnJmpHnBCCkgrIFzJsvYnincrvIBNqiYCrhKvbrDdYojcKgbYqaEfiNYBvqVnCAYVgLQSCcUW0JhbmtBdXRvRmFybV0gW0RydW0tU2hvdGd1bl0gTk9UIGZvdW5kIGluIGludmVudG9yeQ=='))
			end

			log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('NtbrKmHzRwtWDepbQOIfvNruVKDXIentOvRKGvsOteQGcSoeuCcNWBGQtUHlnrgtazLWGKLRBngKIyIvaVOpcmHdKsLPwRmTWJknVGVsZXBvcnRpbmcgYmFjaw=='))
			root = Player.Character and Player.Character:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('kvFWoCbFszFHxxfaEqCjuPVxuzmhwFBoyTbRuOFDsbwlkelOnoFiHHzxIhOpsDWHyPJxGXAvzloIMYBSoqlKdrErjHacjSssSMUTSHVtYW5vaWRSb290UGFydA=='))
			if root then
				root.CFrame = CFrame.lookAt(Vector3.new(-588.7, -31.2, -272.7), Vector3.new(-588.7, -31.2, -272.7) + Vector3.new(-0.9, 0, -0.3))
				workspace.CurrentCamera.CFrame = CFrame.lookAt(Vector3.new(-588.7, -31.2, -272.7), Vector3.new(-588.7, -31.2, -272.7) + Vector3.new(-0.9, 0, -0.3))
			end

			local grenade2Done = false
			local grenade2Started = false
			local throwTime = nil

			if vaultHasParts() then
				log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('uJjXydzpQPdKdOWVxAfMrFpVNizboQrFRiNgdMqGfwygFwRJwVkONTKrWfZYULXaiuSvjYosUckimPOZgBsjhYppDRaxZvlDxmkUVmF1bHQgaGFzIHBhcnRzIOKAlCB0aHJvd2luZyBncmVuYWRlIDE='))

				local char = Player.Character
				local bp = Player:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('TkdxPFxjYcRptrtRuMGaqVtGNguqOXXMlKOLtPEiRFrBmSBhKcfxKSOPAGVesqGFjRymzFoBFPNDilPDVEyxpyJpdbutQhCzegukQmFja3BhY2s='))
				if char and bp then
					local grenade = bp:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('FlKHgXMACSvAUZgjnbogJorKBwbwsoxHUCEIQMnRcPexDXzBtsqqImJXaELFokgvseLkvYFlZyClZNHPwamzSHVyuelYJXoIEpLAW0dyZW5hZGVd'))
					if grenade then
						root = char:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('mQtRiBioqndulMmSxouFLfzAwustsBPOgNIOJvWFOddrwBITRpQualNJXpspRKboTXRmwrGCamrSWggDYqVkHkzViWPiippVWhRMSHVtYW5vaWRSb290UGFydA=='))
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
						log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('aBptWLtkUvGlXWjvdRLRmRepITTnZWSyqAdhBcHQiWRiOxecEKbzkTgukNksqfdewKpnRwDENonvVlgJyCLGTxUnMkASZAAJTVbcR3JlbmFkZSAxIHRocm93biDigJQg0LbQtNC10LwgMS41cyDQv9C10YDQtdC0INGC0LXQu9C10L/QvtGA0YLQvtC8INC6INGB0LXQudGE0LDQvC4uLg=='))
						
						-- ============================================
						-- АКТИВИРУЕМ ПРОВЕРКУ HP ПОСЛЕ ПЕРВОЙ ГРАНАТЫ
						-- ============================================
						startHealthCheck()
						
						task.wait(1.5)

						-- Если уже должен быть ресет, пропускаем дальнейшее
						if shouldRestartCycle then
							log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('ldBaiXSKSoTIcPnoWVmlGiUWNWGpIpOGdqsXmqbfzWtgFronPAUsKZSgwwexyqdCiKMqOFMCkMRBjPkWRqhETurxltZWwtriALkL0KHRgNCw0LHQsNGC0LjQu9CwINC/0YDQvtCy0LXRgNC60LAgSFAsINC/0LXRgNC10LfQsNC/0YPRgdC6INGG0LjQutC70LAuLi4='))
							continue
						end

						teleportToVaults()

						throwTime = tick()
						task.spawn(function()
							while true do
								-- Проверяем флаг перезапуска
								if shouldRestartCycle then
									log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('YaPKleGWzOgaauTDvrQUpeXpDltJLSZXXpcMtJvEIZgQbwJSEcPtISXOiDvGpnSFNrEMioyVVoFUbtsBHIiJMRgLtwfNNlrhCODg0J/RgNC10YDRi9Cy0LDQvdC40LUg0YTQsNGA0LzQsCDQuNC3LdC30LAg0YDQtdGB0LXRgtCwIEhQLi4u'))
									break
								end
								
								if tick() - throwTime >= 5 and vaultHasParts() then
									grenade2Started = true
									log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('EgMTdmrmJVhcZHWLikUDpMuhNgUGFwPLEYygxafojGJWwyWvadwKlkSTodTHWQYhfymGiZBoenctpXBtbhhrXmInMvHyIsqnWPESUGFydHMgYXBwZWFyZWQgaW4gdmF1bHQgYWZ0ZXIgNXMg4oCUIHRocm93aW5nIGdyZW5hZGUgMg=='))

									local bp2 = Player:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('OsuCzXOYRADfTEUqNvCBzkFMIQVxzUNOLifStcvXYexwLQtgNqYUvGDKIztqRKrfnzuiUnvNkXwGoPIMZUQkANjRsnSzaWWtlLYaQmFja3BhY2s='))
									local grenade2 = bp2 and bp2:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('QgYLxfnzjQnqYTPDEqYqaAqIIjhmvIFOYchhlCAQXCrQzzdedbxOhcGmWTwituOrIzeqxsZcnXtyeALSMwMHJXDerNYLlHUScFpsW0dyZW5hZGVd'))
									if grenade2 then
										local root2 = Player.Character and Player.Character:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('xGdkAeoHrtLUZHDVNJDlFFFQVYdNCSQROTRapsaNxQAIThKDfGKKSfJHeDkgnomaydILLGDVZLNFNWDGBfnhEaVpREPdAmrXkgseSHVtYW5vaWRSb290UGFydA=='))
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
										log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('tMieSaCjYpbeCBFDQUMrIfLXpOqvBNdjYoLMvXMmktnHLpxOgFoRtZwoTNSFDuCVhzytPCOtWmRVvmlbcWczIlwDUNgALiPOEUZSR3JlbmFkZSAyIHRocm93bg=='))
									else
										log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('jkdlWOVVIdAztRMYygYoikmJiZhaFZvFHAZmYteTLtPRmSmygMsFZtCMobcgpZYOOReetfhZUQZvsmRJbHMwoPPtZQBucYxNORIhR3JlbmFkZSAyIG5vdCBmb3VuZCBpbiBiYWNrcGFjaw=='))
									end

									grenade2Done = true
									break
								end
								task.wait(0.25)
							end
						end)
					else
						log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('SykrtYUbhlpfNDtcZQbvbNnVkGxtuezWlmiFOOTRuNfLgZMlYYBDZUHQkUAZNPgzCVoUYQYRyzTwGkuPMOCtVhwOuFKLtfptURFtR3JlbmFkZSBub3QgaW4gYmFja3BhY2s='))
					end
				end
			else
				log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('FvHSJKKVaTzPZFipEnvvxKJbcDRYLUXbFIrReLcnkDdhkuJupDtWTxHmsXIjqOPeSXWQlmBOFmOzrLTQaytKYcrChwcUbYEdOqaJVmF1bHQgaXMgZW1wdHkg4oCUIHNraXBwaW5nIGdyZW5hZGVzLCB0ZWxlcG9ydGluZyB0byB2YXVsdHMgYW55d2F5'))
				teleportToVaults()
				-- Активируем проверку HP и здесь
				startHealthCheck()
			end

			task.wait(3)
			
			-- Проверяем флаг перезапуска
			if shouldRestartCycle then
				log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('BdCpLPFzaLejGIkQIySeXgTDSBsVBveNrKZXVrhlzyjGQAvjeKcdDWJPPGJxqQCkKxGeQZQJQMWUBSrDbkLTQBrFSSNnWMExVkBo0KHRgNCw0LHQsNGC0LjQu9CwINC/0YDQvtCy0LXRgNC60LAgSFAsINC/0LXRgNC10LfQsNC/0YPRgdC6INGG0LjQutC70LAuLi4='))
				continue
			end
			
			if grenade2Started and not grenade2Done then
				log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('ohYKMZwaTfoGEroteJqYWilCwzJvXEjDvBIBfVUaTQMRioLfBxxncrmWhrXYwKFTxfilcSHVisHlysPADajlGDjZrgLNWRAmeIqHV2FpdGluZyBmb3IgZ3JlbmFkZSAyIHRvIGZpbmlzaC4uLg=='))
				while not grenade2Done and not shouldRestartCycle do
					task.wait(0.1)
				end
			end

			-- Еще раз проверяем флаг
			if shouldRestartCycle then
				log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('zmwXaQzBNaRCMDGrFRffOORMWdlEVSyMJwcsKJrgRQLdczBSLGBKTNnhynaUcNoQMisdeqYGJHlRRwCYpjfzdXFZYCkOTOdsyhkF0KHRgNCw0LHQsNGC0LjQu9CwINC/0YDQvtCy0LXRgNC60LAgSFAsINC/0LXRgNC10LfQsNC/0YPRgdC6INGG0LjQutC70LAuLi4='))
				continue
			end

			local ammoPath = workspace.Players:FindFirstChild(Player.Name)
			ammoPath = ammoPath and ammoPath:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('KEICTOmkXiCEcBonWIkoTRpWmFxFCLmOmKFjEkgUxmYyVBBTECUGPRrdSnSRlDCrtUbGXccIfLbUFwDdGTauAWjZqpXiSYACwITnW0RydW0tU2hvdGd1bl0='))
			ammoPath = ammoPath and ammoPath:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('VakrbapUamXfscmdcCikoVsLZQUrhYwdhFmdolsYtCILuVzdXfrZrKKNvWHJzFxAerHZRjwJKWUGkUNQUtbElAPQirHthUNUoUHpQW1tbw=='))

			if ammoPath then
				reload()
				task.wait(0)

				local charEq = Player.Character
				if charEq and not charEq:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('xLqUFeMHoaKgmcdELpbnUMCPARsfxmkNJeyoFuTtRImhZFSmLkaCtEDvoKTBwFtPCXecBWPxvfrvUlCrCNqUsqyhUzCYLwKRTsirW0RydW0tU2hvdGd1bl0=')) then
					local bpEq = Player:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('XMJeLXDuhDNwSTkQxpWtSTHTFktqNKWrYknZHNSIYHyKXgxDXBXLgpnqrOKcLqMyxNEIpbTemWATIfSkBSWWZUFXwYoJKwdlIZnjQmFja3BhY2s='))
					if bpEq then
						local shotgun = bpEq:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('TlafWARiYGfPdfdyXTjObjvFqXiAsQOHLuVQIOUerAgvyauQUMxyFoXYvuqYqpOYSgtXLtmjaIKrNmFpauXTmYIVwvmbEclFteUuW0RydW0tU2hvdGd1bl0='))
						if shotgun then
							charEq.Humanoid:EquipTool(shotgun)
							task.wait(0.3)
						end
					end
				end

				local aliveVaults = getAliveVaults()
				log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('RNZsIaiBRSDaRZSrdZjXeJfaBmgFKOyUVZiPGMmqCODJPNHUJDuBpMEkRLCfRQQgviVYHnViEqMrQvBVsdCgswTVQMtWoKGOTohXQWxpdmUgdmF1bHRzOiA=') .. #aliveVaults)

				if #aliveVaults == 0 then
				  log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('FuXPZxTKAyBXcGmgRHnWpZKmWBgAGhRFwbTaSiJchsuKNZGjBGUEPRKQlayZstVbyQbigDxphGwRVxLhuZQGKTcomQKbiWVdnnPx0J3QtdGC0YMg0YHQtdC50YTQvtCyIOKAlCDRgNC10LrQvtC90L3QtdC60YI='))
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
					log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('azPZRayVrHOndEJqolOdmWaFiJLPFiedROQqqAHtsEWFwJJOrVwWYbtrFJVDAXIZpSLYunYgvmxyiyHrIZjeROChHZJTkfYeWCUdSG9sZGluZyBMTUIuLi4gU2hvb3RpbmcgdW50aWwgdmF1bHQgZGllcw=='))
					mouseMoveClick(center.X, center.Y, true)

					-- СТРЕЛЯЕМ ПОКА СЕЙФ НЕ УМРЕТ (не по амо)
					while vaultHumanoid.Health > 0 and not shouldRestartCycle do
						if hasMoneyDropsInRange(15) then
							mouseMoveClick(center.X, center.Y, false)
							log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('QzHusaoreBbITkYdptsOAYoCqanwBzKxPMjDxVXXVGMmyqgfYqgQxSeYiKAHpPEmQVBRJSoyhDiRqZQOcXWLGxgGkfGIYSUQNWcrTW9uZXlEcm9wIGFwcGVhcmVkIOKAlCBjb2xsZWN0aW5nLi4u'))
							collectMoneyDrops()
							if vaultHumanoid.Health > 0 then
								log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('goDaDlndwVEbUUdcoBRWGQXPQVThsvkklmeXEbcprrFIbdZrdUVtpBCIkTClXycpsykuRYXUEcPNWzNTlUfQJhILEARALWIGbhjBUmVzdW1pbmcgTE1CLi4u'))
								mouseMoveClick(center.X, center.Y, true)
							end
						end
						task.wait(0.1)
					end

					mouseMoveClick(center.X, center.Y, false)
					log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('oVvcwWOTpowvkfhrEkltiZxRhJYUXNDokoljBQxoBGyEwLntXtxlyEPoRDTvdBWGeiZahxdkgfltzaOFZCTyFtmhBYbYJJEBLmopVmF1bHQgZGVzdHJveWVkISBTdGFydGluZyByZWxvYWQgY3ljbGUuLi4='))
					task.wait(0.3)
					
					-- ПЕРЕЗАРЯЖАЕМСЯ В ЦИКЛЕ ДО 6 ПАТРОНОВ И ПРИ ЭТОМ СОБИРАЕМ MoneyDrop
					while ammoPath.Value < 6 and not shouldRestartCycle do
						log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('RxCLgKCUSrWtoakNmIRxSBCALebDhpSGstjsXeTcXSgxwspviPNqiLpZLhXyaEKzrMZtXPhNUfZsNztgMknKPhjrnEUVGvtwdsYXUmVsb2FkaW5nLi4uIEN1cnJlbnQgYW1tbzog') .. ammoPath.Value .. BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('JkERRswEDcIeemxuntnsFWiHArxMxqicwriSFeiWCmUioxZuXBMPyzenXJUnvdoZcWCCNjlUYblIvMzNlpUlyKRufANsGQbedfWgLzY='))
						VIM:SendKeyEvent(true, Enum.KeyCode.R, false, game)
						task.wait(0.15)
						VIM:SendKeyEvent(false, Enum.KeyCode.R, false, game)
						task.wait(0.5)
						if hasMoneyDropsInRange(15) then
							log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('cQkicWGuKFLJmFCHgYDKmsLbWkvTVOHCeWVRcDUTLUCRaSXmJvRKIrVCsRUyzJQXArjKrqZQGPHaXRdpBWJDwOweTNVKnpAgWFplTW9uZXlEcm9wIGZvdW5kIGR1cmluZyByZWxvYWQg4oCUIGNvbGxlY3RpbmcuLi4='))
							collectMoneyDrops()
						end
					end
					
					log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('lBdzzFTFRZPpBCbLJOAhOJzLlzNfcWiPeKXMSFnXgjeDyDGHCercMDnwxVeQVATKUgqWVEfmeyuUGmNaHJeFmHzvWjXqKIeTFJLZRnVsbHkgcmVsb2FkZWQgdG8gNiBhbW1v'))
				end

				for _, vault in ipairs(aliveVaults) do
					if shouldRestartCycle then break end
					
					local hum = vault:FindFirstChildOfClass(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('rqyfrGkmVxGaoOjnlfeeSVYeuDniPBMnFkzfjJsrUkwvwZeqgRREGHrFSxCbyyrddpZFKqYiwkrPxiQUjwIQhoRIXDVMaYjzJTeASHVtYW5vaWQ='))
					if not hum or hum.Health <= 0 then continue end

					local head = vault:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('frYSimfDWRgIkfPUhakRyXusNMpjMrbERSsPRevEMAydXwhGqdYKcZetKmVbsHJLdMmUoCsqSVCxHClwNSSfTcMkpbhUAKuswpXYSGVhZA=='))
					if not head then continue end

					local r = Player.Character and Player.Character:FindFirstChild(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('snWuXyuLxdRlHBUEiumncosgHxgJbgWQpuqewTiygZMKVPEPMvONMInBxhlJixikbmmsoHhqWlqwukdTStcgKFgGgrQBaYtRqyrBSHVtYW5vaWRSb290UGFydA=='))
					if r then
						r.CFrame = CFrame.new(head.Position)
						log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('tilZnkzppLtrfrMwsfxWwWCnOTpEaXTObxVXIHvbCpGnQaQrYvUlsTBrkTqztGhhdncveaOBYWFYUCQWheDvdnqwIPBWJxsnOcsBVGVsZXBvcnRlZCB0byB2YXVsdDog') .. vault:GetFullName())
					end
					task.wait(0.3)

					while hasMoneyDropsInRange(15) and not shouldRestartCycle do
						collectMoneyDrops()
						task.wait(0.3)
					end

					-- Передаем humanoid сейфа в функцию
					shootUntilVaultDead(hum)

					log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('JIIfGoaHkRPfjGnlMVEbizGoPRLkgWKujJZqpLUaQaCvmcIfTGStfkXQXnkwLviKYKMgMZjoLfPnoATYnoGYoAPzAJeRFlUHCTLcVmF1bHQgZGVzdHJveWVkOiA=') .. vault:GetFullName())
					task.wait(0.5)
					collectMoneyDrops()
				end

				while hasMoneyDropsInRange(15) and not shouldRestartCycle do
					collectMoneyDrops()
					task.wait(0.3)
				end

				if shouldRestartCycle then
					log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('tipnblcNCLkdTtItxFzDJvDPIGbeCWKrAOeavBoVfkCQvcgruwTNhmWJMgjXCzIveztHkgfnmTepyKVoNARhalVtWYWPjAAPOYgp0J/RgNC10YDRi9Cy0LDQvdC40LUg0YTQsNGA0LzQsCwg0L/QtdGA0LXQt9Cw0L/Rg9GB0Log0YbQuNC60LvQsC4uLg=='))
					continue
				end

				local remainingVaults = getAliveVaults()
				if #remainingVaults == 0 and not hasMoneyDropsInRange(15) then
				  log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('PzRwLKIHMiTxLnXlpvWPLSiKNgDNrLnRAeXOrxFhdpZMeXyGhprnYQfILafMTQwdztyJZohGUxKrJzTdewJFqVhYhrTSajKfOsYd0JLRgdC1INGB0LXQudGE0Ysg0YPQsdC40YLRiyDQuCDQvdC10YIgTW9uZXlEcm9wIOKAlCDRgNC10LrQvtC90L3QtdC60YI='))
				  healthCheckActive = false
				  performReconnect()
				  return
				end
			else
				log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('oyXyQeIqWrXmcrDzIlxoPKDFqvmPhSwZVdBoQwqUWEkjpWsYYMPkDhrorqzhBUTDBpsKGXMuQSTQfkhpPddkQuwjVARYLClbNNFSQW1tbyBwYXRoIG5vdCBmb3VuZA=='))
			end

		else
			log(BKQvEuFenTLGZwjdgIadWzYDJuKeHMPwXmTakYPOTNXqodSBZgOtzIXmib('MdwjoovnkttIWAMJGdvjJkzsEAKBFDdTWtDRovtZuxbbVgRfPbmMJhAwlVfBMqHGYIxkOBoIUGVjLivBvMrBnLetinQNiDrRVGfSW0JhbmtBdXRvRmFybV0gR3JlbmFkZSBOT1QgZm91bmQgaW4gaW52ZW50b3J5'))
		end
		
		-- Отключаем проверку HP перед следующей итерацией
		healthCheckActive = false
		task.wait(1)
	end
end

-- Запускаем основной цикл
mainFarmingLoop()    
