PlayerEventConsumer = {}

PlayerEventConsumer.AllowedEvents = {
    PLAYER_ENTERING_WORLD = true
}

PlayerEventConsumer.Execute = function(self, event)
    
    if (self.AllowedEvents[event] == nil) then return end

    local healthConfig = BB_UI_Config[PlayerHealthConfig.unitType][PlayerHealthConfig.frameName] or PlayerHealthConfig
    local powerConfig = BB_UI_Config[PlayerPowerConfig.unitType][PlayerPowerConfig.frameName] or PlayerPowerConfig

    local PlayerHealth = BuildBBFrame(healthConfig, BB_Health)
    local PlayerPower = BuildBBFrame(powerConfig, BB_Power)

    PlayerHealth:Init()
    PlayerPower:Init()

    PlayerHealth.frame:SetScript("OnEvent", BBFrame_EventConsumer(PlayerHealth))
    PlayerPower.frame:SetScript("OnEvent", BBFrame_EventConsumer(PlayerPower))
end