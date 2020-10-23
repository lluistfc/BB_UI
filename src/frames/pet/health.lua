PetHealth = BB_Frame(BB_Health)

function PetHealth:BuildElements()
    local healthConfig = BB_UI_Config[PetHealthConfig.unitType][PetHealthConfig.frameName] or PetHealthConfig
    
    self:Init(healthConfig)
    self.frame:SetScript("OnEvent", BBFrame_EventConsumer(self))
end