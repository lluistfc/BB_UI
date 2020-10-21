PlayerEventConsumer = {}

PlayerEventConsumer.AllowedEvents = {
    PLAYER_ALIVE = true,
    PLAYER_ENTERING_WORLD = true
}

PlayerEventConsumer.Execute = function(self, event)
    
    if (self.AllowedEvents[event] == nil) then return end

    local PlayerHealth = BuildBBFrame(PlayerHealthConfig, BB_Health)
    local PlayerPower = BuildBBFrame(PlayerPowerConfig, BB_Power)

    PlayerHealth:Init()
    PlayerPower:Init()

    PlayerHealth.frame:SetScript("OnEvent", BBFrame_EventConsumer(PlayerHealth))
    PlayerPower.frame:SetScript("OnEvent", BBFrame_EventConsumer(PlayerPower))
end