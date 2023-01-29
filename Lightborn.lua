repeat
	task.wait()
until game:IsLoaded()

local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Player = Players.LocalPlayer
local PlayerGui = Player.PlayerGui
local char = Player.Character or Player.CharacterAdded:Wait()
local BodyParts = {
	"Torso",
	"Right Arm",
	"Right Leg",
	"Left Arm",
	"Left Leg",
	"Head"
}
if not ReplicatedStorage:FindFirstChild("Info") then
	return
end

if shared.isRunning then
	for _, v in pairs(shared.Connections) do
		if v then
			v:Disconnect()
		end
	end
else
	shared.isRunning = true
	shared.Connections = {}
end



local function Init(Character)
	local blackborn = false
	if shared.LightbornVariant == "Blackborn" then
		blackborn = true
	end

	local chosenVariant = ReplicatedStorage:WaitForChild("Info").Races.Lightborn:FindFirstChild(shared.LightbornVariant) or ReplicatedStorage.Info.Races.Lightborn

	local EyeColor = not blackborn and chosenVariant:FindFirstChild("EyeColor").Value or Color3.fromRGB(113, 33, 225)
	local HairColor = not blackborn and chosenVariant:FindFirstChild("HairColor").Value or Color3.fromRGB(17, 17, 17)
	local ScleraColor = not blackborn and chosenVariant:FindFirstChild("ScleraColor").Value or Color3.fromRGB(255, 255, 255)
	local SkinColor = not blackborn and chosenVariant:FindFirstChild("SkinColor").Value or Color3.fromRGB(65, 56, 46)

	local randomFaces = {
		"LightCarefree",
		"LightConcerned",
		"LightConfident",
		"LightFurious",
		"LightScarred",
		"LightSerious"
	}

	if shared.LightbornFace == "Random" then
		shared.LightbornFace = randomFaces[math.random(1, #randomFaces)]
	end

	repeat
		task.wait()
	until Character:FindFirstChild("Head") and Character.Head:FindFirstChild("FaceMount") and Character.Head.FaceMount:FindFirstChildOfClass("Decal") and Character:FindFirstChildOfClass("Accessory") and Character:FindFirstChildOfClass("Accessory"):FindFirstChild("Handle")

	repeat
		task.wait()
	until Character:FindFirstChild("CharacterHandler")

	Character.CharacterHandler:WaitForChild("InputClient")

	local LeaderboardGui = PlayerGui:WaitForChild("LeaderboardGui")
	local PlayerTag
	local GuildTag
	local CharacterName = PlayerGui:WaitForChild("WorldInfo"):WaitForChild("InfoFrame"):WaitForChild("CharacterInfo"):WaitForChild("Character")
	local function getNames()
		for i, v in pairs(LeaderboardGui:GetDescendants()) do
			if v.Name == "Player" and v.Text == Player:GetAttribute("CharacterName") or v.Name == "Player" and v.Text == shared.CustomName then
				PlayerTag = v
				GuildTag = v.Parent.Guild
				break
			end
		end
	end
	getNames()
	repeat
		task.wait(0.1)
		getNames()
	until PlayerTag and GuildTag
	if shared.CustomGuild ~= "" then
		GuildTag.Text = shared.CustomGuild
		table.insert(shared.Connections, GuildTag:GetPropertyChangedSignal("Text"):Connect(function()
			GuildTag.Text = shared.CustomGuild
		end))
	end
	if shared.CustomName ~= "" then
		PlayerTag.Text = shared.CustomName
		CharacterName.Text = shared.CustomName
		table.insert(shared.Connections, CharacterName:GetPropertyChangedSignal("Text"):Connect(function()
			CharacterName.Text = shared.CustomName
		end))
		table.insert(shared.Connections, PlayerTag:GetPropertyChangedSignal("Text"):Connect(function()
			PlayerTag.Text = shared.CustomName
		end))
	end
	local nums = {
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
		"0"
	}
	local alpha = {
		"A",
		"B",
		"C",
		"D",
		"E"
	}
	if shared.SpoofCharacterID then
		local randomID = ""
		for i = 1, 10 do
			randomID ..= nums[math.random(1, #nums)]
		end
		PlayerGui:WaitForChild("WorldInfo").InfoFrame.CharacterInfo.Slot.Text = string.format("%s:%s|%s [Lv.%s]", randomID, alpha[math.random(1, #alpha)], math.random(1, 50), math.random(1, 20))
	end
	if shared.LightbornAccessory2 ~= "" then
		if shared.LightbornAccessory2 == "Wristbands" then
			local Right = game:GetObjects(getsynasset("WristbandsRight.rbxm"))[1]
			local RightWeld = Instance.new("Weld")
			RightWeld.C0 = Right.Offset.CFrame:Inverse()
			RightWeld.Part0 = Character["Right Arm"]
			RightWeld.Part1 = Right
			RightWeld.Parent = Right
			Right.Parent = Character
			local Left = game:GetObjects(getsynasset("WristbandsLeft.rbxm"))[1]
			local LeftWeld = Instance.new("Weld")
			LeftWeld.C0 = Left.Offset.CFrame:Inverse()
			LeftWeld.Part0 = Character["Left Arm"]
			LeftWeld.Part1 = Left
			LeftWeld.Parent = Left
			Left.Parent = Character
		else
			local Accessory = game:GetObjects(getsynasset(shared.LightbornAccessory2 .. ".rbxm"))[1]
			local Weld = Instance.new("Weld")
			Weld.C0 = Accessory.Offset.CFrame:Inverse()
			Weld.Part0 = Character.Head
			Weld.Part1 = Accessory
			Weld.Parent = Accessory
			Accessory.Parent = Character
		end
	end
	if shared.LightbornAccessorya ~= "" then
		if shared.LightbornAccessorya == "Wristbands" then
			local Right = game:GetObjects(getsynasset("WristbandsRight.rbxm"))[1]
			local RightWeld = Instance.new("Weld")
			RightWeld.C0 = Right.Offset.CFrame:Inverse()
			RightWeld.Part0 = Character["Right Arm"]
			RightWeld.Part1 = Right
			RightWeld.Parent = Right
			Right.Parent = Character
			local Left = game:GetObjects(getsynasset("WristbandsLeft.rbxm"))[1]
			local LeftWeld = Instance.new("Weld")
			LeftWeld.C0 = Left.Offset.CFrame:Inverse()
			LeftWeld.Part0 = Character["Left Arm"]
			LeftWeld.Part1 = Left
			LeftWeld.Parent = Left
			Left.Parent = Character
		else
			local Accessory = game:GetObjects(getsynasset(shared.LightbornAccessorya .. ".rbxm"))[1]
			local Weld = Instance.new("Weld")
			Weld.C0 = Accessory.Offset.CFrame:Inverse()
			Weld.Part0 = Character.Head
			Weld.Part1 = Accessory
			Weld.Parent = Accessory
			Accessory.Parent = Character
		end
	end
	local RaceOrnaments = ReplicatedStorage:WaitForChild("Assets").RaceOrnaments
	local allOrnaments = {}
	for i, v in pairs(RaceOrnaments:GetChildren()) do
		for i, v in pairs(v:GetChildren()) do
			table.insert(allOrnaments, v:FindFirstChild("Attach") and v.Attach.CFrame or v.Offset.CFrame)
		end
	end
	for i, v in pairs(Character:GetChildren()) do
		if v.Name == "TiranFeathers" then
			v:Destroy()
		end
		if v:FindFirstChild("Attach") and table.find(allOrnaments, v.Attach.CFrame) then
			v:Destroy()
		end
		if table.find(BodyParts, v.Name) then
			if v:FindFirstChild("MarkingMount") then
				v.MarkingMount.Color = SkinColor
			end
			v.Color = SkinColor
		end
		if v:FindFirstChild("Handle") and v.Handle:FindFirstChildOfClass("SpecialMesh") then
			if v.Handle:FindFirstChildOfClass("SpecialMesh") then
				v.Handle:FindFirstChildOfClass("SpecialMesh").VertexColor = Vector3.new(HairColor.R, HairColor.G, HairColor.B)
			end
		end
		if v.Name:find("Asset:") then
			if not v:FindFirstChild("Handle") then
				continue
			end
			if v.Handle:FindFirstChildOfClass("SpecialMesh") then
				v.Handle:FindFirstChildOfClass("SpecialMesh").VertexColor = Vector3.new(HairColor.R, HairColor.G, HairColor.B)
			end
		end
		if v.Name == "Torso" then
			for _, torsoChild in pairs(v:GetChildren()) do
				if torsoChild.Name == "StarKindred1" then
					if torsoChild.Weld.C0 == CFrame.new(2.85, 1, 1.2, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
						torsoChild.Color = HairColor
					elseif torsoChild.Weld.C0 == CFrame.new(1.9, 0, 0.8, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
						torsoChild.Color = SkinColor
					end
				elseif torsoChild.Name == "Starkindred2" then
					if torsoChild.Weld.C0 == CFrame.new(-2.85, 1, 1.2, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
						torsoChild.Color = HairColor
					elseif torsoChild.Weld.C0 == CFrame.new(-1.9, 0, 0.8, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
						torsoChild.Color = SkinColor
					end
				end
			end
		end
		if v.Name == "Head" then
			local FaceMount = v:FindFirstChild("FaceMount")
			local MarkingMount = v:FindFirstChild("MarkingMount")
			if not FaceMount then
				continue
			end
			if MarkingMount then
				for _, v in pairs(MarkingMount:GetChildren()) do
					if v.Name == "Sclera" then
						v.Color3 = ScleraColor
					end
					if v:IsA("Decal") and v.Name ~= "Sclera" then
						v:Destroy()
					end
				end
			end
			if FaceMount:FindFirstChildOfClass("Decal") then
				FaceMount:FindFirstChildOfClass("Decal"):Destroy()
			end
			local Face = ReplicatedStorage.Assets.Faces:FindFirstChild(shared.LightbornFace):Clone() or ReplicatedStorage.Assets.Faces:FindFirstChild("LightCarefree"):Clone()
			Face.Color3 = EyeColor
			Face.Parent = FaceMount
		end
	end
	table.insert(shared.Connections, Character.Torso.ChildAdded:Connect(function(child)
		if child.Name == "StarKindred1" then
			child:WaitForChild("Weld")
			if child.Weld.C0 == CFrame.new(2.85, 1, 1.2, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
				child.Color = HairColor
			elseif child.Weld.C0 == CFrame.new(1.9, 0, 0.8, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
				child.Color = SkinColor
			end
		elseif child.Name == "Starkindred2" then
			child:WaitForChild("Weld")
			if child.Weld.C0 == CFrame.new(-2.85, 1, 1.2, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
				child.Color = HairColor
			elseif child.Weld.C0 == CFrame.new(-1.9, 0, 0.8, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
				child.Color = SkinColor
			end
		end
	end))
end

Init(char)

Player.CharacterAdded:Connect(function(character)
	Init(character)
end)
