PetEventConsumer = {
    alreadyInitialized = false
}

PetEventConsumer.AllowedEvents = {
    UNIT_PET = true
}

PetEventConsumer.Execute = function(self, event)

    if (self.AllowedEvents[event] == nil) then return end

    if not self.alreadyInitialized then
        PetHealth:BuildElements()
        self.alreadyInitialized = true
    end
end