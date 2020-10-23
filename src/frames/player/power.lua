PlayerPower = BB_Frame(BB_Power)

function PlayerPower:BuildElements()

    local powerConfig = BB_UI_Config[PlayerPowerConfig.unitType][PlayerPowerConfig.frameName] or PlayerPowerConfig
    
    self:Init(powerConfig)
    self.frame:SetScript("OnEvent", BBFrame_EventConsumer(self))
end