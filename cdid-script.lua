warn("Anti afk running")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    warn("Anti afk ran")
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

local function dealerships()
    local tables = {}
    local etc = workspace.Etc.Dealership:GetChildren()
    for i, v in pairs(etc) do
        if v.ClassName == "Model" then
            table.insert(tables, v.Name)
        end
    end
    return tables
end

getfenv().grav = workspace.Gravity

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({
    Name = "Deexzyy HUB",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "OrionTest"
})

-- Tab
local FarmTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local MiscTab = Window:MakeTab ({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false 
})

MiscTab:AddButton({
	Name = "Claim Daily",
	Callback = function()
            game:GetService("ReplicatedStorage").NetworkContainer.RemoteEvents.Box:FireServer("Claim")
  	end    
})

MiscTab:AddButton({
	Name = "Buy Limited Box (must claim daily first)",
	Callback = function()
            game:GetService("ReplicatedStorage").NetworkContainer.RemoteEvents.Box:FireServer("Buy","Limited Box")
  	end    
})

MiscTab:AddButton({
	Name = "Buy Gamepass Box (must claim daily first)",
	Callback = function()
            game:GetService("ReplicatedStorage").NetworkContainer.RemoteEvents.Box:FireServer("Buy","Gamepass Box")print("button pressed")
  	end    
})

FarmTab:AddToggle({
    Name = "Auto Truck",
    Default = false,
    Callback = function(state)
        getfenv().drive = (state and true or false)
        workspace.Gravity = 196
        if workspace.Map:findFirstChild("Prop") then
         workspace.Map.Prop:Destroy()
        end
         while getfenv().drive do
             wait()
             pcall(function()
     if game.Players.LocalPlayer.Character.Humanoid.SeatPart == nil then
     game:GetService("ReplicatedStorage").NetworkContainer.RemoteEvents.Job:FireServer("Truck")
     wait(0.1)
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Etc.Job.Truck.Starter.WorldPivot
     game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
     wait(5)
     game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
     wait()
     local prepos = workspace.Etc.Waypoint.Waypoint.Position
     repeat wait()
     fireproximityprompt(workspace.Etc.Job.Truck.Starter.Prompt)
     until workspace.Etc.Waypoint.Waypoint.Position ~= prepos
     wait(2)
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame= workspace.Etc.Job.Truck.Spawner.Part.CFrame
     workspace.Gravity = 196
     wait(2)
     local thetruck = nil
     repeat wait()
     if thetruck == nil then
     repeat wait()
     fireproximityprompt(workspace.Etc.Job.Truck.Spawner.Part.Prompt)
     until workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name.."sCar")
     wait(4)
     for i,v in pairs(workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name.."sCar"):GetDescendants()) do
     if v.Name == "Identifier" and v.Text == "H 9281 KGK" or v.Name == "Identifier" and v.Text == "BL 7201 EL" or v.Name == "Identifier" and v.Text == "L 9128 TIM" then
         thetruck = v
         print(v)
     end
     end
     end
     until thetruck ~= nil
     repeat wait()
     until workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name.."sCar")
     repeat wait()
         pcall(function()
     if game.Players.LocalPlayer.Character.Humanoid.SeatPart == nil then
     workspace.Vehicles:FindFirstChild(game.Players.LocalPlayer.Name.."sCar"):FindFirstChild("DriveSeat"):Sit(game.Players.LocalPlayer.Character.Humanoid)
     wait(1)
     end
         end)
     until game.Players.LocalPlayer.Character.Humanoid.SeatPart ~= nil
     elseif game.Players.LocalPlayer.Character.Humanoid.SeatPart ~= nil then
     local plr = game.Players.LocalPlayer
     local chr = plr.Character
     local croot = chr.HumanoidRootPart
     local seat = chr.Humanoid.SeatPart
     local car = seat.Parent
     local primary = car.PrimaryPart
     workspace.Gravity = 0
     wait()
     local dist = (primary.Position-primary.Position+Vector3.new(0,1000,0)).magnitude
     local TweenService = game:GetService("TweenService")
     local TweenInfoToUse = TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
     
     local TweenValue = Instance.new("CFrameValue")
     TweenValue.Value = car:GetPrimaryPartCFrame()
             
     TweenValue.Changed:Connect(function()
     car:PivotTo(TweenValue.Value)
     end)
     local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=primary.CFrame+Vector3.new(0,1000,0)})
     OnTween:Play()
     OnTween.Completed:Wait()
     local plr = game.Players.LocalPlayer
     local chr = plr.Character
     local croot = chr.HumanoidRootPart
     local seat = chr.Humanoid.SeatPart
     local car = seat.Parent
     local primary = car.PrimaryPart
     workspace.Gravity = 0
     local dist = (primary.Position-workspace.Etc.Waypoint.Waypoint.Position+Vector3.new(0,1000,0)).magnitude
     print(dist/150)
     local TweenService = game:GetService("TweenService")
     local TweenInfoToUse = TweenInfo.new(40, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
     
     local TweenValue = Instance.new("CFrameValue")
     TweenValue.Value = car:GetPrimaryPartCFrame()
             
     TweenValue.Changed:Connect(function()
     car:PivotTo(TweenValue.Value)
     end)
     local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=workspace.Etc.Waypoint.Waypoint.CFrame+Vector3.new(0,1000,0)})
     OnTween:Play()
     OnTween.Completed:Wait()
     local plr = game.Players.LocalPlayer
     local chr = plr.Character
     local croot = chr.HumanoidRootPart
     local seat = chr.Humanoid.SeatPart
     local car = seat.Parent
     local primary = car.PrimaryPart
     workspace.Gravity = 0
     local dist = (primary.Position-workspace.Etc.Waypoint.Waypoint.Position+Vector3.new(0,30,0)).magnitude
     local TweenService = game:GetService("TweenService")
     local TweenInfoToUse = TweenInfo.new(dist/150, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
     
     local TweenValue = Instance.new("CFrameValue")
     TweenValue.Value = car:GetPrimaryPartCFrame()
             
     TweenValue.Changed:Connect(function()
     car:PivotTo(TweenValue.Value)
     end)
     local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=workspace.Etc.Waypoint.Waypoint.CFrame+Vector3.new(0,30,0)})
     OnTween:Play()
     OnTween.Completed:Wait()
     local prepos = workspace.Etc.Waypoint.Waypoint.Position
     repeat task.wait()
         if workspace.Etc.Waypoint.Waypoint.Position == prepos then
             local plr = game.Players.LocalPlayer
             local chr = plr.Character
             local croot = chr.HumanoidRootPart
             local seat = chr.Humanoid.SeatPart
             local car = seat.Parent
             local primary = car.PrimaryPart
             workspace.Gravity = 0
             local dist = (primary.Position-workspace.Etc.Waypoint.Waypoint.Position).magnitude
             local TweenService = game:GetService("TweenService")
             local TweenInfoToUse = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
             
             local TweenValue = Instance.new("CFrameValue")
             TweenValue.Value = car:GetPrimaryPartCFrame()
                     
             TweenValue.Changed:Connect(function()
             car:PivotTo(TweenValue.Value)
             end)
             local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=workspace.Etc.Waypoint.Waypoint.CFrame*CFrame.new(0,0,20)})
             OnTween:Play()
             OnTween.Completed:Wait()
             if workspace.Etc.Waypoint.Waypoint.Position == prepos then
                 local plr = game.Players.LocalPlayer
     local chr = plr.Character
     local croot = chr.HumanoidRootPart
     local seat = chr.Humanoid.SeatPart
     local car = seat.Parent
     local primary = car.PrimaryPart
     workspace.Gravity = 0
     local dist = (primary.Position-workspace.Etc.Waypoint.Waypoint.Position-Vector3.new(0,25,0)).magnitude
     local TweenService = game:GetService("TweenService")
     local TweenInfoToUse = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
     
     local TweenValue = Instance.new("CFrameValue")
     TweenValue.Value = car:GetPrimaryPartCFrame()
             
     TweenValue.Changed:Connect(function()
     car:PivotTo(TweenValue.Value)
     end)
     local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=workspace.Etc.Waypoint.Waypoint.CFrame-Vector3.new(0,25,0)})
     OnTween:Play()
     OnTween.Completed:Wait()
     end
     workspace.Gravity = 200
     for i, v in pairs(car:GetDescendants()) do
         pcall(function()
         v.Velocity = Vector3.new(0,0,0)
         end)
     end
     wait(2)
         end
     until prepos ~= workspace.Etc.Waypoint.Waypoint.Position
     workspace.Gravity = 196
     end
     end)
     end
    end
})

local tables = dealerships()  -- Call the function to get the data

FarmTab:AddDropdown({
    Name = "Select Dealerships",
    Options = tables,  -- Ensure that `tables` is populated before this call
    Callback = function(state)
        if state ~= "Dealerships" then
            for i, v in pairs(workspace.Etc.Dealership:GetChildren()) do
                if v.Name == state then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.WorldPivot + Vector3.new(0, 5, 0)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                    wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                end
            end
        end
    end
})

OrionLib:Init()
