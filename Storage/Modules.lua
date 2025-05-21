-- Module Scripts: HH2k3 --
-- Service[S-1]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")

local FunText = {
    "HoangHien×Scripts:"
}

local BodyPart = {
    "HumanoidRootPart"
}

local Modules = {}

Modules.PR = function(msg)
    print(FunText[1] .. " " .. msg)
    warn(FunText[1] .. " " .. msg)
end

Modules.CorrectName = function(plr_name)
    for _, v in ipairs(Players:GetPlayers()) do
        if string.lower(v.Name):sub(1, #plr_name) == string.lower(plr_name) or
        string.lower(v.DisplayName):sub(1, #plr_name) == string.lower(plr_name) then
            return v
        end
    end
    print(FunText[1] .. " " .. v.Name .. "| " .. v.DisplayName)
    return nil
end

Modules.Notify = function(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration,
    })
end

Modules.ButtonNotify = function(title, text, duration, btnText1, btnText2, script)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration,
        Button1 = btnText1,
        Callback = function()
            script()
        end,
        Button2 = btnText2,
    })
end

Modules.DevConsole = function()
    if CoreGui:FindFirstChild("DeveloperConsole") == nil then
        StarterGui:SetCore("DevConsoleVisible", true)
    end
end

Modules.TP = function(local_plr, plr_name)
    if plr_name and plr_name.Character and plr_name.Character:FindFirstChild("HumanoidRootPart") then
        Players[local_plr].Character:SetPrimaryPartCFrame(plr_name.Character.HumanoidRootPart)
    else
        print(FunText[1] .. " " .. plr_name .. " does not exist a " .. BodyPart[1])
    end
end

return Modules
