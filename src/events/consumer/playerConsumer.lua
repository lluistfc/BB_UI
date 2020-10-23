PlayerEventConsumer = {}

PlayerEventConsumer.AllowedEvents = {
    PLAYER_ENTERING_WORLD = true
}

PlayerEventConsumer.Execute = function(self, event)
    
    if (self.AllowedEvents[event] == nil) then return end
    PlayerHealth:BuildElements()
    PlayerPower:BuildElements()
    --[[local healthConfig = BB_UI_Config[PlayerHealthConfig.unitType][PlayerHealthConfig.frameName] or PlayerHealthConfig
    local powerConfig = BB_UI_Config[PlayerPowerConfig.unitType][PlayerPowerConfig.frameName] or PlayerPowerConfig

    local PlayerHealth = BB_Frame(BB_Health)
    local PlayerPower = BB_Frame(BB_Power)

    PlayerHealth:Init(healthConfig)
    PlayerPower:Init(powerConfig)

    PlayerHealth.frame:SetScript("OnEvent", BBFrame_EventConsumer(PlayerHealth))
    PlayerPower.frame:SetScript("OnEvent", BBFrame_EventConsumer(PlayerPower))]]--
end