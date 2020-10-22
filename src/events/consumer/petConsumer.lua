PetEventConsumer = {}

PetEventConsumer.AllowedEvents = {
    UNIT_PET = true
}

PetEventConsumer.Execute = function(self, event)

    if (self.AllowedEvents[event] == nil) then return end

    local config = BB_UI_Config[PetHealthConfig.unitType][PetHealthConfig.frameName] or PetHealthConfig

    local PetHealth = BuildBBFrame(config, BB_Health)

    PetHealth:Init()
    PetHealth.frame:SetScript("OnEvent", BBFrame_EventConsumer(PetHealth))
end