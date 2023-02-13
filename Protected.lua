repeat wait(5) until game:IsLoaded()
repeat wait(5) until game:GetService("Players")
repeat wait(5) until game:GetService("Players").LocalPlayer
repeat wait(5) until game:GetService("Players").LocalPlayer.PlayerGui
repeat wait(5) until game:GetService("ReplicatedStorage").Effect.Container
if not game:IsLoaded() then
    local GameLoadGui = Instance.new("Message",workspace);
    GameLoadGui.Text = 'Wait Game Loading';
    game.Loaded:Wait();
    GameLoadGui:Destroy();
    task.wait();
end;
_G.FilterItem = true
_G.Distance = 0 -- Distance Hop
_G.HopNear = false -- Hop Near Player And Block
_G.Lengened = true -- Filter Fruit 1 M +
_G.ShowOnlyCDK = true -- Set Alias Show Only Cursed Dual Katana and 6 Melee
_G.LowHop = false -- Hop Low Server
_G.Team = "Pirates" -- Auto Select Teams
-- 1 Template Sheet https://docs.google.com/spreadsheets/d/1kJE3pD0h_hPLfZOIqtjVwqL-XOqg2SE2aRpyoytAAiM/edit#gid=0
-- 2 Template Sheet https://docs.google.com/spreadsheets/d/1u0AWP3Gw4jsXdFmxiBBHfbTjIqdeG2z_bzk8vyMCMgk/edit?usp=sharing 
_G.SheetType = 2 -- Type Of Sheet
_G.Delay = 20 -- Time Delay
_G.TimeAFK = 5 -- Time AFK(Not Move)
_G.CooldownHop = 5 -- Minute 
-- Config Zone
_G.ScriptWhenNoMove = function() 
	game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer) -- Rejoin Scripts
end
-- Config Zone
if not _G.Delay then 
	_G.Delay = 10 
end
if type(_G.Delay) ~= "number" then
		_G.Delay = 10 
end
-- Des Log  9-578
local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
local Request = syn.request
local function formatNumber(number)
    local i, k, j = tostring(number):match("(%-?%d?)(%d*)(%.?.*)")
    return i .. k:reverse():gsub("(%d%d%d)", "%1,"):reverse() .. j
end
spawn(
    function()
        while wait(_G.PiwwyBf["Log Delay"]) do
            local World = ""
            local Money = ""
            local Username = game.Players.LocalPlayer.Name
            local Fragment = ""
            local Level = ""
            local Fruit = ""
            local Material = ""
            local Race = ""
            local World = ""
            local FruitMastery = ""
            local Gun = ""
            local RequestgetInventory
            local HttpService = game:GetService("HttpService")
            local Malee = ""
            local Sword = ""
            local Accesorry = ""
            local Awake = ""
            local Combo = ""
            local Evo = ""
            local function notifyCheck(types, ...)
                if types == "Notify" then
                    require(game.ReplicatedStorage.Notification).new(...):Display()
                end
            end
            function format_number_(n)
                local x = n
                local res = x:gsub(",","")
                return tonumber(res)
            end
            
            function foo(n)
                if n >= 10^6 then
                    return string.format("%.2fM", n / 10^6)
                elseif n >= 10^3 then
                    return string.format("%.2fK", n / 10^3)
                else
                    return tostring(n)
                end
            end
            Money = foo(format_number_(formatNumber(game:GetService("Players").LocalPlayer.Data.Beli.Value)))
            Fragment = foo(format_number_(formatNumber(game:GetService("Players").LocalPlayer.Data.Fragments.Value)))
            Race = game:GetService("Players").LocalPlayer.Data.Race.Value
            Level = game:GetService("Players").LocalPlayer.Data.Level.Value
            if
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 and
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0
             then
                World = 3
            elseif
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 and
                    not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") and
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") ~= 0
             then
                World = 2
            else
                World = 1
            end

            RequestgetInventory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
            for i, __ in pairs(RequestgetInventory) do
                if __["Type"] == "Sword" then
                    if Sword == "" then
                        if _G.PiwwyBf["Inventory Log Des/Sheet"] and _G.PiwwyBf["OnlyRareItemPlus"]  then
                            if table.find(_G.PiwwyBf["Inventory Log Des/Sheet"], __["Name"]) then
                                Sword = __["Name"] .. " "
                            end
                        else
                            Sword = __["Name"] .. " "
                        end
                    else
                        if _G.PiwwyBf["Inventory Log Des/Sheet"] and _G.PiwwyBf["OnlyRareItemPlus"] then
                            if table.find(_G.PiwwyBf["Inventory Log Des/Sheet"], __["Name"]) then
                                Sword = Sword .. __["Name"] .. ", "
                            end
                        else
                            Sword = Sword .. __["Name"] .. ", "
                        end
                    end
                end
                if __["Type"] == "Wear" then
                    if Accesorry == "" then
                        Accesorry = __["Name"] .. " "
                    else
                        Accesorry = Accesorry .. __["Name"] .. " "
                    end
                end
                if __["Type"] == "Blox Fruit" then
                    if Fruit == "" then
                        if _G.PiwwyBf["ShowLegendary"] then
                            if __["Rarity"] == 3 or __["Rarity"] == 4 then
                                Fruit = __["Name"] .. " "
                            end
                        else
                            Fruit = __["Name"] .. " "
                        end
                    else
                        if _G.PiwwyBf["ShowLegendary"] then
                            if __["Rarity"] == 3 or __["Rarity"] == 4 then
                                Fruit = Fruit .. __["Name"] .. " "
                            end
                        else
                            Fruit = Fruit .. __["Name"] .. " "
                        end
                    end
                end
                if __["Type"] == "Material" then
                    if Material == "" then
                        Material = __["Name"] .. " "
                    else
                        Material = Material .. __["Name"] .. "( x" .. __["Count"] .. " )" .. " "
                    end
                end
                if __["Type"] == "Gun" then
                    if Gun == "" then
                        Gun = __["Name"] .. " "
                    else
                        Gun = Gun .. __["Name"] .. " "
                    end
                end
            end
            local args = {
                [1] = "BuyDeathStep",
                [2] = true
            }

            DeathStep = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if DeathStep == 1 then
                HasDeathStep = true
            else
                HasDeathStep = false
            end
            wait(0.2)

            local args = {
                [1] = "BuySharkmanKarate",
                [2] = true
            }

            SharkmanKarate = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if SharkmanKarate == 1 then
                HasSharkmanKarate = true
            end
            wait(0.2)

            local args = {
                [1] = "BuySuperhuman",
                [2] = true
            }

            Superhuman = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if Superhuman == 1 then
                HasSuperhuman = true
            else
                HasSuperhuman = false
            end
            wait(0.2)

            local args = {
                [1] = "BuyElectricClaw",
                [2] = true
            }

            ElectricClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if ElectricClaw == 1 then
                HasElectricClaw = true
            else
                HasElectricClaw = false
            end
            local args = {
                [1] = "BuyDragonTalon",
                [2] = true
            }

            DragonTalon = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if type(DragonTalon) == "number" then
                if DragonTalon == 1 then
                    HasDragonTalon = true
                else
                    HasDragonTalon = false
                end
            end

            local args = {
                [1] = "BuyGodhuman",
                [2] = true
            }
            Godhuman = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if type(Godhuman) == "number" then
                if Godhuman == 1 then
                    HasGodhuman = true
                else
                    HasGodhuman = false
                end
            end
            if HasGodhuman then
                Malee = Malee .. "GODHUMAN, "
            end
            if HasSuperhuman then
                Malee = Malee .. "SUPERHUMAN, "
            end
            if HasElectricClaw then
                Malee = Malee .. "ELECTRICV2, "
            end
            if HasDragonTalon then
                Malee = Malee .. "DRAGONV2, "
            end
            if HasDeathStep then
                Malee = Malee .. "DEATHSTEPV2, "
            end
            if HasSharkmanKarate then
                Malee = Malee .. "SHARKMANV2"
            end

            
            for _i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    if v.ToolTip == "Blox Fruit" then
                        FruitMastery = v.Level.Value
                        FruitName = v.Name
                    end
                end
            end

            r = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
            if r then
                for i, v in pairs(r) do
                    if v["Awakened"] then
                        Awake = Awake .. i .. " "
                    end
                end
            else
                Awake = "None"
            end
            if game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                Evo = ""
            else
                Evo = "No"
            end
            function GetWeaponInventory(Weaponname)
                for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
                    if v.Type == "Sword" then
                        if v.Name == Weaponname then
                            return true
                        end
                    end
                end
            end
            if GetWeaponInventory("Cursed Dual Katana") then
                CDKYed = true
             end
             if GetWeaponInventory("Hallow Scythe") == true then
                HSYed = true
                end
             if GetWeaponInventory("Dark Dagger") == true then
                 DDGYed = true
                 end
                 if GetWeaponInventory("Yama") == true then
                    YMYed = true
                    end
             if GetWeaponInventory("Tushita") == true then
              TSYed = true
              end
             if GetWeaponInventory("True Triple Katana") == true then
             TTKYed = true
             end

             RequestgetInventory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
             for i,x in pairs(RequestgetInventory) do
                  if x["Type"] == "Gun" then
                      if x["Name"] == "Soul Guitar" then
                        SGYed = true
                     
                      end
                  end
             end 
            if CDKYed or SGYed or HSYed or DDGYed or YMYed or TSYed or TTKYed then
            Payload = ""
             if CDKYed then
                Payload = Payload .."CDK,"
                end

            else
                Payload = ""
            end
                Payload = Payload.."Lv: "..Level.." \nW : "..World.." \nB : "..Money.." \nF : "..Fragment.." \nFruit Inventory : "..Fruit.." \nInventory : "..Sword.." \nFighting Style : "..Malee
            
                Request(
                {
                    Method = "POST",
                    Url = "http://localhost:7963/SetDescription?Account=" .. Username,
                    Body = Payload
                }
            )
        end
    end
)
spawn(
    function()
        while wait(_G.PiwwyBf["Log Delay"]) do
            local Username = game.Players.LocalPlayer.Name
            local args = {
                [1] = "BuyDeathStep",
                [2] = true
            }

            DeathStep = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if DeathStep == 1 then
                HasDeathStep = true
            else
                HasDeathStep = false
            end
            wait(0.2)

            local args = {
                [1] = "BuySharkmanKarate",
                [2] = true
            }

            SharkmanKarate = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if SharkmanKarate == 1 then
                HasSharkmanKarate = true
            end
            wait(0.2)

            local args = {
                [1] = "BuySuperhuman",
                [2] = true
            }

            Superhuman = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if Superhuman == 1 then
                HasSuperhuman = true
            else
                HasSuperhuman = false
            end
            wait(0.2)

            local args = {
                [1] = "BuyElectricClaw",
                [2] = true
            }

            ElectricClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if ElectricClaw == 1 then
                HasElectricClaw = true
            else
                HasElectricClaw = false
            end
            local args = {
                [1] = "BuyDragonTalon",
                [2] = true
            }

            DragonTalon = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if type(DragonTalon) == "number" then
                if DragonTalon == 1 then
                    HasDragonTalon = true
                else
                    HasDragonTalon = false
                end
            end

            local args = {
                [1] = "BuyGodhuman",
                [2] = true
            }
            local FruitName = ""
            Godhuman = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if type(Godhuman) == "number" then
                if Godhuman == 1 then
                    HasGodhuman = true
                else
                    HasGodhuman = false
                end
            end
            
            local Ml = 0
           if HasDragonTalon then
            Ml = Ml + 1
            end
           if HasElectricClaw then
            Ml = Ml + 1
            end
           if HasSuperhuman then 
            Ml = Ml +1
            end
           if HasSharkmanKarate then
            Ml = Ml +1
            end
           if HasDeathStep then
            Ml = Ml +1
           end
           if HasGodhuman then
              Ml = Ml +1
               end
			   	Payload = ""
                if Ml == 6 then
                    Payload = Payload.."GOD, "
                else
                    Payload = Payload .. Ml.."/6, "
                end
		
						local MyFruit = game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
                   
						if MyFruit == "Dark-Dark" then
						    CurrentFruitName = "Dark"
						elseif MyFruit == 'Flame-Flame' then
						     CurrentFruitName = "Flame"
						elseif MyFruit == 'Quake-Quake' then
						     CurrentFruitName = "Quake"
						elseif MyFruit == 'Human-Human: Buddha' then
						     CurrentFruitName = "Buddha"
						elseif MyFruit == 'Sand-Sand' then
						     CurrentFruitName = "Sand"
						elseif MyFruit == 'Light-Light' then
						     CurrentFruitName = "Light"
						elseif MyFruit == 'Magma-Magma' then
						     CurrentFruitName = "Magma"
						elseif MyFruit == 'Bird-Bird: Phoenix' then
						    CurrentFruitName = "Phoenix"
						elseif MyFruit == 'Rumble-Rumble' then
						    CurrentFruitName = "Rumble"
						elseif MyFruit == 'Dough-Dough' then
						    CurrentFruitName = "Dough"
						elseif MyFruit == 'Dragon-Dragon' then
						    CurrentFruitName = "Dragon"
						 elseif MyFruit == 'Leopard-Leopard' then
						    CurrentFruitName = "Leopard"
						 elseif MyFruit == 'Ice-Ice' then
					      CurrentFruitName = "Ice"
						 	end
					HHH = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
              if HHH then
               S = 0
            for i, v in pairs(HHH) do
                if v["Awakened"] then
                 S = S + 1
                    end
            end
            end
            function GetWeaponInventory(Weaponname)
                for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
                    if type(v) == "table" then
                        if v.Type == "Sword" then
                            if v.Name == Weaponname then
                                return true
                            end
                        end
                    end
                end
                return false
            end
            
                                 if GetWeaponInventory("Cursed Dual Katana") then
                                    CDKYed = true
                                 end
                                 if GetWeaponInventory("Hallow Scythe") == true then
                                    HSYed = true
                                    end
                                 if GetWeaponInventory("Dark Dagger") == true then
                                     DDGYed = true
                                     end
                                     if GetWeaponInventory("Yama") == true then
                                        YMYed = true
                                        end
                                 if GetWeaponInventory("Tushita") == true then
                                  TSYed = true
                                  end
                                 if GetWeaponInventory("True Triple Katana") == true then
                                 TTKYed = true
                                 end 
             
                       RequestgetInventory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
                        for i,x in pairs(RequestgetInventory) do
                             if x["Type"] == "Gun" then
                                 if x["Name"] == "Soul Guitar" then
                                   SGYed = true
                                
                                 end
                             end
                        end    
                       
                                 if CDKYed then
                                Payload = Payload .."CDK , "
                                end

                         if MyFruit == "" then
                Payload = Payload .." ".."N/A".." "
            else
        
            Payload = Payload .." "..CurrentFruitName.." ".."{"..S.."} "
            end
			
            r =
                Request(
                {
                    Method = "POST",
                    Url = "http://localhost:7963/SetAlias?Account=" .. Username,
                    Body = Payload
                }
            )
        end
    end
)



_G.FilterItem = true
_G.Distance = 0 -- Distance Hop
_G.HopNear = false -- Hop Near Player And Block
_G.Lengened = true -- Filter Fruit 1 M +
_G.ShowOnlyCDK = true -- Set Alias Show Only Cursed Dual Katana and 6 Melee
_G.LowHop = false -- Hop Low Server
_G.Team = "Pirates" -- Auto Select Teams
-- 1 Template Sheet https://docs.google.com/spreadsheets/d/1kJE3pD0h_hPLfZOIqtjVwqL-XOqg2SE2aRpyoytAAiM/edit#gid=0
-- 2 Template Sheet https://docs.google.com/spreadsheets/d/1u0AWP3Gw4jsXdFmxiBBHfbTjIqdeG2z_bzk8vyMCMgk/edit?usp=sharing 
_G.SheetType = 2 -- Type Of Sheet
_G.Delay = 3 -- Time Delay
_G.TimeAFK = 5 -- Time AFK(Not Move)
_G.CooldownHop = 5 -- Minute 
-- Config Zone
if not _G.Delay then 
	_G.Delay = 10 
end
if type(_G.Delay) ~= "number" then
		_G.Delay = 10 
end
task.spawn(function() 
    local cu = 0;
    local mx = _G.PiwwyBf["AFK Time Check"];
    local q = nil;
    spawn(function() 
        while true do wait(60) 
            if u == 0 then 
                pcall(function() 
                    q = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    u = u + 1;
                end)
            end
            if u ~= 0 then 
                if type(q) ~= "nil" then 
                    if(q.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        q = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        u = u + 1;
                    end
                    if(q.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10 then
                        q = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        u = 0;
                    end
                end
               if u >= (mx + 1) then 
                    _G.ScriptWhenNoMove()
                end
            end
        end
    end)
    print('Anti AFK (No Move) Is Load')	
    end)
    _G.ScriptWhenNoMove = function() 
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer) -- Rejoin Scripts
    end
-- Config Zone
if not _G.Delay then 
	_G.Delay = 20 
end
if type(_G.Delay) ~= "number" then
		_G.Delay = 10 
end
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(
    function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end
)
print("Anti AFK Is Loaded")
Nexus_Version = 101
loadstring(
    game:HttpGet "https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RBX%20Alt%20Manager/Nexus/Nexus.lua"
)()
task.spawn(
    function()
        Nexus:Connect()
    end
)
local TeleportService = game:GetService('TeleportService')
local f;
f = hookmetamethod(game:GetService("TeleportService"), "__namecall", function(...)
    if getnamecallmethod() == "Teleport" and not _G.CooldownDone then
        return
    end

    return f(...)
end)
task.spawn(function ()
  wait(_G.CooldownHop * 60)
  _G.CooldownDone  = true
end)
_G.CooldownDone  = false
local HttpService = game:GetService("HttpService")
local Request = syn.request
join = game.Players.localPlayer.Neutral == false
if _G.Team == nil then
    _G.Team = "Pirates"
end
if (_G.Team == "Pirates" or _G.Team == "Marines") and not join then
    repeat
        wait()
        pcall(
            function()
                join = game.Players.localPlayer.Neutral == false
                if _G.Team == "Pirates" then
                    for i, v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
                        for i, v in pairs(
                            getconnections(
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton[
                                    v
                                ]
                            )
                        ) do
                            v.Function()
                        end
                    end
                elseif _G.Team == "Marines" then
                    for i, v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
                        for i, v in pairs(
                            getconnections(
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton[
                                    v
                                ]
                            )
                        ) do
                            v.Function()
                        end
                    end
                else
                    for i, v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
                        for i, v in pairs(
                            getconnections(
                                game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton[
                                    v
                                ]
                            )
                        ) do
                            v.Function()
                        end
                    end
                end
            end
        )
    until (game.Players.localPlayer.Neutral == false) == true
end
repeat
        wait()
until (game.Players.localPlayer.Neutral == false) == true
local function len(x)
    local q = 0
    for i, v in pairs(x) do
        q = q + 1
    end
    return q
end
function getRartiy(__)
    if __["Rarity"] == 3 and _G.Legendary then
        return __
    else
        return __
    end
end
wait(6)
spawn(
    function()
        while true do
            wait()
            local x, p =
                pcall(
                function()
                    Nexus:NewLine()
                    Nexus:CreateLabel("loginfo", "BestSheet")
                    Nexus:NewLine()
                    Nexus:CreateTextBox("loginput", _G.PiwwyBf["BestSheet"], {200, 20})
                    Nexus:CreateButton("logbtn", "Sent", {100, 30})
                    Nexus:NewLine()
                end
            )
            if x then
                break
            end
        end
    end
)

function PraseFruit()
	r = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
            if r then
                q = len(r)
                w = 0
                for i, v in pairs(r) do
                    if v["Awakened"] then
                        w = w + 1
                    end
                end
					return " | Awk. " .. w .. " )"
            else
                return "Cant Awake Fruit!_!"
            end
end
Nexus:OnButtonClick(
    "logbtn",
    function()
        url = Nexus:GetText("loginput")
        local World = ""
        local Money = ""
        local Username = game.Players.LocalPlayer.Name
        local Fragment = ""
        local Level = ""
        local Fruit = ""
        local Material = ""
        local Race = ""
        local World = ""
        local FruitMastery = "N/A"
        local FruitName = "N/A"
        local Gun = ""
        local RequestgetInventory
        local HttpService = game:GetService("HttpService")
        local Malee = ""
        local Sword = ""
        local Accesorry = ""
        local Awake = ""
        local Combo = ""
        local function formatNumber(number)
            local i, k, j = tostring(number):match("(%-?%d?)(%d*)(%.?.*)")
            return i .. k:reverse():gsub("(%d%d%d)", "%1,"):reverse() .. j
        end
        local function notifyCheck(types, ...)
            if types == "Notify" then
                require(game.ReplicatedStorage.Notification).new(...):Display()
            end
        end
        function format_number_(n)
            local x = n
            local res = x:gsub(",","")
            return tonumber(res)
        end
        
        function foo(n)
            if n >= 10^6 then
                return string.format("%.2fm", n / 10^6)
            elseif n >= 10^3 then
                return string.format("%.2fk", n / 10^3)
            else
                return tostring(n)
            end
        end

        Money = foo(format_number_(formatNumber(game:GetService("Players").LocalPlayer.Data.Beli.Value)))
        Fragment = formatNumber(game:GetService("Players").LocalPlayer.Data.Fragments.Value)
        Race = game:GetService("Players").LocalPlayer.Data.Race.Value
        Level = game:GetService("Players").LocalPlayer.Data.Level.Value

        if
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 and
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0
         then
            World = "3"
        elseif
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 and
                not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0
         then
            World = "2"
        else
            World = "1"
        end

       RequestgetInventory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
            for i, __ in pairs(RequestgetInventory) do
                if __["Type"] == "Sword" then
                    if Sword == "" then
                        if _G.PiwwyBf["Inventory Log Des/Sheet"] and _G.PiwwyBf["OnlyRareItemPlus"]  then
                            if table.find(_G.PiwwyBf["Inventory Log Des/Sheet"], __["Name"]) then
                                Sword = __["Name"] .. " "
                            end
                        else
                            Sword = __["Name"] .. " "
                        end
                    else
                        if _G.PiwwyBf["Inventory Log Des/Sheet"] and _G.PiwwyBf["OnlyRareItemPlus"] then
                            if table.find(_G.PiwwyBf["Inventory Log Des/Sheet"], __["Name"]) then
                                Sword = Sword..", ".. __["Name"]
                            end
                        else
                            Sword = Sword..", ".. __["Name"]
                        end
                    end
                end
                if __["Type"] == "Wear" then
                    if Accesorry == "" then
                        Accesorry = __["Name"] .. " "
                    else
                        Accesorry = Accesorry .. __["Name"] .. " "
                    end
                end
                if __["Type"] == "Blox Fruit" then
                    if Fruit == "" then
                        if _G.PiwwyBf["ShowLegendary"] then
                            if __["Rarity"] == 3 or __["Rarity"] == 4  then
                                Fruit = __["Name"] .. " "
                            end
                        else
                            Fruit = __["Name"] .. " "
                        end
                    else
                        if _G.PiwwyBf["ShowLegendary"] then
                            if __["Rarity"] == 3 or __["Rarity"] == 4 then
                                Fruit = Fruit .. __["Name"] .. " "
                            end
                        else
                            Fruit = Fruit .. __["Name"] .. " "
                        end
                    end
                end
                if __["Type"] == "Material" then
                    if Material == "" then
                        Material = __["Name"] .. " "
                    else
                        Material = Material .. __["Name"] .. "( x" .. __["Count"] .. " )" .. " "
                    end
                end
                if __["Type"] == "Gun" then
                    if Gun == "" then
                        Gun = __["Name"] .. " "
                    else
                        Gun = Gun .. __["Name"] .. " "
                    end
                end
            end
        local args = {
            [1] = "BuyDeathStep",
            [2] = true
        }

        DeathStep = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        if DeathStep == 1 then
            HasDeathStep = true
        else
            HasDeathStep = false
        end
        wait(0.2)

        local args = {
            [1] = "BuySharkmanKarate",
            [2] = true
        }

        SharkmanKarate = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        if SharkmanKarate == 0 then
            HasSharkmanKarate = false
        else
            HasSharkmanKarate = true
        end
        wait(0.2)

        local args = {
            [1] = "BuySuperhuman",
            [2] = true
        }

        Superhuman = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        if Superhuman == 1 then
            HasSuperhuman = true
        else
            HasSuperhuman = false
        end
        wait(0.2)

        local args = {
            [1] = "BuyElectricClaw",
            [2] = true
        }

        ElectricClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        if ElectricClaw == 1 then
            HasElectricClaw = true
        else
            HasElectricClaw = false
        end
        local args = {
            [1] = "BuyDragonTalon",
            [2] = true
        }

        DragonTalon = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        if type(DragonTalon) == "number" then
            if DragonTalon == 1 then
                HasDragonTalon = true
            else
                HasDragonTalon = false
            end
        end

        local args = {
            [1] = "BuyGodhuman",
            [2] = true
        }
        Godhuman = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        if type(Godhuman) == "number" then
            if Godhuman == 1 then
                HasGodhuman = true
            else
                HasGodhuman = false
            end
        end
        if HasGodhuman then
            Malee = Malee .. "GODHUMAN, "
        end
        if HasSuperhuman then
            Malee = Malee .. "SUPERHUMAN, "
        end
        if HasElectricClaw then
            Malee = Malee .. "ELECTRICV2, "
        end
        if HasDragonTalon then
            Malee = Malee .. "DRAGONV2, "
        end
        if HasDeathStep then
            Malee = Malee .. "DEATHSTEPV2, "
        end
        if HasSharkmanKarate then
            Malee = Malee .. "SHARKMANV2"
        end
        for _i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                if v.ToolTip == "Blox Fruit" then
                    FruitMastery = v.Level.Value
                    FruitName = v.Name
                end
            end
        end
        r = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
        if r then
            for i, v in pairs(r) do
                if v["Awakened"] then
                    Awake = Awake .. i .. " "
                end
            end
        else
            Awake = "None"
        end
        local Type = ""
        RequestgetInventory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
            for i, __ in pairs(RequestgetInventory) do
                if __["Type"] == "Sword" then
                    if __["Name"] == "Cursed Dual Katana" then
                        CDKHas = true
                    end
                end
            end
            RequestgetInventory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
            for i, __ in pairs(RequestgetInventory) do
                if __["Type"] == "Sword" then
                    if __["Name"] == "Tushita" then
                        TSHas = true
                    end
                end
            end
            RequestgetInventory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
            for i, __ in pairs(RequestgetInventory) do
                if __["Type"] == "Sword" then
                    if __["Name"] == "Yama" then
                        YMHAS = true
                    end
                end
            end
            RequestgetInventory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
            for i, __ in pairs(RequestgetInventory) do
                if __["Type"] == "Sword" then
                    if __["Name"] == "Hallow Scythe" then
                        HSHas = true
                    end
                end
            end
            RequestgetInventory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
            for i,x in pairs(RequestgetInventory) do
                 if x["Type"] == "Gun" then
                     if x["Name"] == "Soul Guitar" then
                       SGHasDD = true
                     end
                 end
            end 
            if HasGodhuman then
                AllMelee = true
               end
               if AllMelee then
                Type = Type .."6 หมัด"
               else
                Type = Type .."3-5 หมัด"
               end
            if CDKHas then 
                Type = Type .." + ดาบคู่"    
                YMHAS = false
                TSHas = false
            end
            if SGHasDD then
                Type = Type.." + กีตาร์"
            end
            if TSHas then
                Type = Type .." + ทูชิตะ"    
            end
            if YMHAS then
                Type = Type .." + ยามะ"    
            end
            if HSHas then
                Type = Type.." + เคียว"
            end
           local MyFruit = game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
           local Awake = 0
           r = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
           for i, v in pairs(r) do
              if v["Awakened"] then
                  Awake = Awake + 1
              end
          end
          if Awake  == 6 and MyFruit == 'Dough-Dough' then
            Type = Type .." + โมจิตื่นครบ"
                   end
        if _G.SheetType == 1 then 
        	Payload =
				HttpService:JSONEncode(
				{
					["UserName"] = Username,
					["FruitAwake"] = Awake,
					["Beli"] = Money,
					["Fragment"] = Fragment,
					["WeaponInventory"] = Combo,
					["FruitInventory"] = Fruit,
					["FruitName"] = FruitName,
					["Race"] = Race,
					["World"] = World,
					["FruitMastery"] = FruitMastery,
					["Melee"] = Malee,
					["Level"] = Level
				}
			)
		elseif _G.SheetType == 2 then
            local MyFruit = game:GetService("Players").LocalPlayer.Data.DevilFruit.Value
			Payload =
				HttpService:JSONEncode(
				{
					["Account"] = Username,
					["Inventory"] = Sword,
					["Fruit Inventory"] = Fruit,
					["Fruit"] = MyFruit .. ' ( Mastery. ' .. FruitMastery .. PraseFruit(),
					["World"] = World,
					["Melee"] = Malee,
					["Level"] = Level,
					["Beli"] = Money,
					["Fragment"] = Fragment,
					["Type Account"] = Type
				}
			)
		end
        if syn or syn.request then
            requestWebhook =
                syn.request(
                {
                    ["Url"] = url,
                    ["Method"] = "POST",
                    ["Body"] = Payload,
                    ["Headers"] = {
                        ["Content-Type"] = "application/json"
                    }
                }
            )
        else
            requestWebhook =
                syn.request(
                {
                    ["Url"] = url,
                    ["Method"] = "POST",
                    ["Body"] = Payload,
                    ["Headers"] = {
                        ["Content-Type"] = "application/json"
                    }
                }
            )
        end
    end
)
print("Script Loaded")
