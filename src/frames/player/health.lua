PlayerHealth = BB_Frame(BB_Health)

function PlayerHealth:BuildElements()
    
    local healthConfig = BB_UI_Config[PlayerHealthConfig.unitType][PlayerHealthConfig.frameName] or PlayerHealthConfig
    
    self:Init(healthConfig)
    self.frame:SetScript("OnEvent", BBFrame_EventConsumer(self))
end