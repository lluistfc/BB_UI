PetEventConsumer = {}

PetEventConsumer.AllowedEvents = {
    UNIT_PET = true
}

PetEventConsumer.Execute = function(self, event)

    if (self.AllowedEvents[event] == nil) then return end

    local PetHealth = BuildBBFrame(PetHealthConfig, BB_Health)

    PetHealth:Init()
    PetHealth.frame:SetScript("OnEvent", BBFrame_EventConsumer(PetHealth))
end