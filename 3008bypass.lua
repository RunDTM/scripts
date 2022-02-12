local event = require(game:service'Players'.LocalPlayer.PlayerGui.MainPlayerInformation).PickupEvent
local plr = game:service'Players'.LocalPlayer
local old
old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    if self ~= event and getnamecallmethod() ~= "InvokeServer" then
        return old(self, ...)
    end
    return
end))
spawn(function()
    while wait() do
        pcall(function()
            for i,v in pairs(getconnections(plr.Character.Humanoid.Changed)) do
                v.Disable()
            end
            for i,v in pairs(getconnections(plr.Character.DescendantAdded)) do
                v.Disable()
            end
        end)
    end
end)
